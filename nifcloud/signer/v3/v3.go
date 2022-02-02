package v3

import (
	"context"
	"crypto/hmac"
	"crypto/sha256"
	"encoding/base64"
	"fmt"
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/smithy-go/logging"
	smithyhttp "github.com/aws/smithy-go/transport/http"
)

const (
	authorizationHeader = "X-Nifty-Authorization"
)

// HTTPSigner is an interface to a SigV3 signer that can sign HTTP requests
type HTTPSigner interface {
	SignHTTP(ctx context.Context, credentials aws.Credentials, r *smithyhttp.Request, optFns ...func(*SignerOptions)) error
}

// SignerOptions is the SigV3 Signer options
type SignerOptions struct {
	Logger     logging.Logger
	LogSigning bool
}

// Signer applies NIFCLOUD v2 signing to given request
type Signer struct {
	options SignerOptions
}

// NewSigner returns a new SigV3 Signer
func NewSigner(optFns ...func(signer *SignerOptions)) *Signer {
	options := SignerOptions{}

	for _, fn := range optFns {
		fn(&options)
	}
	return &Signer{options: options}
}

type httpSigner struct {
	Request     *smithyhttp.Request
	Credentials aws.Credentials
}

// SignHTTP signs NIFCLOUD v3 requests
func (s Signer) SignHTTP(
	ctx context.Context,
	credentials aws.Credentials,
	r *smithyhttp.Request,
	optFns ...func(options *SignerOptions)) error {
	options := s.options

	for _, fn := range optFns {
		fn(&options)
	}

	signer := httpSigner{
		Request:     r,
		Credentials: credentials,
	}

	signedRequest, err := signer.Build()
	if err != nil {
		return err
	}

	logSigningInfo(ctx, options, &signedRequest)

	return nil
}

func (s *httpSigner) Build() (signedRequest, error) {
	req := s.Request

	if req.Header.Get("Date") == "" {
		location, err := time.LoadLocation("GMT")
		if err != nil {
			return signedRequest{}, err
		}

		req.Header.Set("Date", time.Now().In(location).Format(time.RFC1123))
	}

	if req.URL.Path == "" {
		req.URL.Path += "/"
	}

	mac := hmac.New(sha256.New, []byte(s.Credentials.SecretAccessKey))
	_, err := mac.Write([]byte(req.Header.Get("Date")))
	if err != nil {
		return signedRequest{}, err
	}

	hashed := mac.Sum(nil)
	signature := base64.StdEncoding.EncodeToString(hashed)

	auth := fmt.Sprintf(
		"NIFTY3-HTTPS NiftyAccessKeyId=%s,Algorithm=HmacSHA256,Signature=%s",
		s.Credentials.AccessKeyID,
		signature,
	)
	req.Header.Set(authorizationHeader, auth)

	return signedRequest{Request: req}, nil
}

func logSigningInfo(ctx context.Context, options SignerOptions, request *signedRequest) {
	if !options.LogSigning {
		return
	}
	logger := logging.WithContext(ctx, options.Logger)
	logger.Logf(logging.Debug, logSignInfoMsg, request.Request.Header.Get(authorizationHeader))
}

type signedRequest struct {
	Request *smithyhttp.Request
}

const logSignInfoMsg = `DEBUG: Request Signature:
	}
---[ SIGNATURE ]-------------------------------------
%s
-----------------------------------------------------`
