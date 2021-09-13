package v3

import (
	"context"
	"crypto/hmac"
	"crypto/sha256"
	"encoding/base64"
	"fmt"
	"net/http"
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
)

type signer struct {
	// Values that must be populated from the request
	Request     *http.Request
	Time        time.Time
	Credentials aws.CredentialsProvider
	Debug       aws.LogLevel
	Logger      aws.Logger
}

// SignRequestHandler is a named request handler the SDK will use to sign
// service client request with using the V3 signature.
var SignRequestHandler = aws.NamedHandler{
	Name: "v3.SignRequestHandler", Fn: SignSDKRequest,
}

// SignSDKRequest requests with signature version 3.
//
// Will sign the requests with the service config's Credentials object
// Signing is skipped if the credentials is the aws.AnonymousCredentials
// object.
func SignSDKRequest(req *aws.Request) {
	// If the request does not need to be signed ignore the signing of the
	// request if the AnonymousCredentials object is used.
	if req.Config.Credentials == aws.AnonymousCredentials {
		return
	}

	v3 := signer{
		Request:     req.HTTPRequest,
		Time:        req.Time,
		Credentials: req.Config.Credentials,
		Debug:       req.Config.LogLevel,
		Logger:      req.Config.Logger,
	}

	req.Error = v3.Sign(req.Context())

	if req.Error != nil {
		return
	}
}

func (v3 *signer) Sign(ctx context.Context) error {
	credValue, err := v3.Credentials.Retrieve(ctx)
	if err != nil {
		return err
	}

	if v3.Request.Header.Get("Date") == "" {
		location, err := time.LoadLocation("GMT")
		if err != nil {
			return err
		}

		v3.Request.Header.Set("Date", time.Now().In(location).Format(time.RFC1123))
	}

	if v3.Request.URL.Path == "" {
		v3.Request.URL.Path += "/"
	}

	mac := hmac.New(sha256.New, []byte(credValue.SecretAccessKey))
	_, err = mac.Write([]byte(v3.Request.Header.Get("Date")))
	if err != nil {
		return err
	}

	hashed := mac.Sum(nil)
	signature := base64.StdEncoding.EncodeToString(hashed)

	auth := fmt.Sprintf(
		"NIFTY3-HTTPS NiftyAccessKeyId=%s,Algorithm=HmacSHA256,Signature=%s",
		credValue.AccessKeyID,
		signature,
	)
	v3.Request.Header.Set("X-Nifty-Authorization", auth)

	if v3.Debug.Matches(aws.LogDebugWithSigning) {
		v3.logSigningInfo()
	}
	return nil
}

const logSignInfoMsg = `DEBUG: Request Signature:
---[ SIGNATURE ]-------------------------------------
%s
-----------------------------------------------------`

func (v3 *signer) logSigningInfo() {
	msg := fmt.Sprintf(logSignInfoMsg, v3.Request.Header.Get("X-Nifty-Authorization"))
	v3.Logger.Log(msg)
}
