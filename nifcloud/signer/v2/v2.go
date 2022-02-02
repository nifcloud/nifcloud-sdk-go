package v2

import (
	"context"
	"crypto/hmac"
	"crypto/sha256"
	"encoding/base64"
	"fmt"
	"net/url"
	"sort"
	"strings"
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/smithy-go/encoding/httpbinding"
	"github.com/aws/smithy-go/logging"
	smithyhttp "github.com/aws/smithy-go/transport/http"
)

const (
	signatureVersion = "2"
	signatureMethod  = "HmacSHA256"
	timeFormat       = "2006-01-02T15:04:05Z"
)

// HTTPSigner is an interface to a SigV2 signer that can sign HTTP requests
type HTTPSigner interface {
	SignHTTP(ctx context.Context, credentials aws.Credentials, r *smithyhttp.Request, optFns ...func(*SignerOptions)) error
}

// SignerOptions is the SigV2 Signer options
type SignerOptions struct {
	Logger     logging.Logger
	LogSigning bool
}

// Signer applies NIFCLOUD v2 signing to given request.
type Signer struct {
	options SignerOptions
	Request *smithyhttp.Request
}

// NewSigner returns a new SigV2 Signer
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

// SignHTTP signs NIFCLOUD v2 requests
func (s *Signer) SignHTTP(
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

	s.Request = signedRequest.Request

	logSigningInfo(ctx, options, &signedRequest)

	return nil
}

func (s *httpSigner) Build() (signedRequest, error) {
	req := s.Request
	r := req.Build(context.Background())

	err := r.ParseForm()
	if err != nil {
		return signedRequest{}, err
	}

	query := r.PostForm

	err = req.RewindStream()
	if err != nil {
		return signedRequest{}, err
	}

	// Set new query parameters
	query.Set("AccessKeyId", s.Credentials.AccessKeyID)
	query.Set("SignatureVersion", signatureVersion)
	query.Set("SignatureMethod", signatureMethod)
	query.Set("Timestamp", time.Now().UTC().Format(timeFormat))

	// in case this is a retry, ensure no signature present
	query.Del("Signature")

	method := req.Method
	host := req.URL.Host
	path := req.URL.Path
	if path == "" {
		path = "/"
	}

	// obtain all of the query keys and sort them
	queryKeys := make([]string, 0, len(query))
	for key := range query {
		queryKeys = append(queryKeys, key)
	}
	sort.Strings(queryKeys)

	// build URL-encoded query keys and values
	queryKeysAndValues := make([]string, len(queryKeys))
	for i, key := range queryKeys {
		k := strings.Replace(url.QueryEscape(key), "+", "%20", -1)
		v := strings.Replace(url.QueryEscape(query.Get(key)), "+", "%20", -1)
		queryKeysAndValues[i] = k + "=" + v
	}

	// join into one query string
	queryString := strings.Join(queryKeysAndValues, "&")

	// build the canonical string for the V2 signature
	stringToSign := strings.Join([]string{
		method,
		host,
		path,
		queryString,
	}, "\n")

	hash := hmac.New(sha256.New, []byte(s.Credentials.SecretAccessKey))
	_, err = hash.Write([]byte(stringToSign))
	if err != nil {
		return signedRequest{}, err
	}
	signature := base64.StdEncoding.EncodeToString(hash.Sum(nil))
	query.Set("Signature", signature)

	request, err := req.SetStream(strings.NewReader(query.Encode()))
	if err != nil {
		return signedRequest{}, err
	}

	httpBindingEncoder, err := httpbinding.NewEncoder(path, request.URL.RawQuery, request.Header)
	if err != nil {
		return signedRequest{}, err
	}

	if request.Request, err = httpBindingEncoder.Encode(request.Request); err != nil {
		return signedRequest{}, err
	}

	size, ok, err := request.StreamLength()
	if err != nil {
		return signedRequest{}, err
	}
	if !ok {
		return signedRequest{}, fmt.Errorf("request stream is not seekable")
	}
	request.Request.ContentLength = size

	return signedRequest{Request: request}, nil
}

func logSigningInfo(ctx context.Context, options SignerOptions, request *signedRequest) {
	if !options.LogSigning {
		return
	}
	req := request.Request.Build(context.Background())
	err := req.ParseForm()
	if err != nil {
		return
	}
	query := req.PostForm

	err = request.Request.RewindStream()
	if err != nil {
		return
	}

	logger := logging.WithContext(ctx, options.Logger)
	logger.Logf(logging.Debug, logSignInfoMsg, query.Get("Signature"))
}

type signedRequest struct {
	Request *smithyhttp.Request
}

const logSignInfoMsg = `DEBUG: Request Signature:
	}
---[ SIGNATURE ]-------------------------------------
%s
-----------------------------------------------------`
