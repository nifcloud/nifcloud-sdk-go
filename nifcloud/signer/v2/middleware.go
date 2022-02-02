package v2

import (
	"context"
	"fmt"

	"github.com/aws/aws-sdk-go-v2/aws"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
)

// SigningError indicates an error condition occurred while performing SigV2 signing
type SigningError struct {
	Err error
}

func (e *SigningError) Error() string {
	return fmt.Sprintf("failed to sign request: %v", e.Err)
}

// Unwrap returns the underlying error cause
func (e *SigningError) Unwrap() error {
	return e.Err
}

// SignHTTPRequestMiddlewareOptions is the configuration options for the SignHTTPRequestMiddleware middleware.
type SignHTTPRequestMiddlewareOptions struct {
	CredentialsProvider aws.CredentialsProvider
	Signer              HTTPSigner
	LogSigning          bool
}

// SignHTTPRequestMiddleware is a `FinalizeMiddleware` implementation for SigV2 HTTP Signing
type SignHTTPRequestMiddleware struct {
	credentialsProvider aws.CredentialsProvider
	signer              HTTPSigner
	logSigning          bool
}

// NewSignHTTPRequestMiddleware constructs a SignHTTPRequestMiddleware using the given Signer for signing requests
func NewSignHTTPRequestMiddleware(options SignHTTPRequestMiddlewareOptions) *SignHTTPRequestMiddleware {
	return &SignHTTPRequestMiddleware{
		credentialsProvider: options.CredentialsProvider,
		signer:              options.Signer,
		logSigning:          options.LogSigning,
	}
}

// ID is the SignHTTPRequestMiddleware identifier
func (s *SignHTTPRequestMiddleware) ID() string {
	return "Signing"
}

// HandleFinalize will take the provided input and sign the request using the SigV2 authentication scheme
func (s *SignHTTPRequestMiddleware) HandleFinalize(
	ctx context.Context,
	in middleware.FinalizeInput,
	next middleware.FinalizeHandler) (
	out middleware.FinalizeOutput, metadata middleware.Metadata, err error,
) {
	if !haveCredentialProvider(s.credentialsProvider) {
		return next.HandleFinalize(ctx, in)
	}

	req, ok := in.Request.(*smithyhttp.Request)
	if !ok {
		return out, metadata, &SigningError{Err: fmt.Errorf("unexpected request middleware type %T", in.Request)}
	}

	credentials, err := s.credentialsProvider.Retrieve(ctx)
	if err != nil {
		return out, metadata, &SigningError{Err: fmt.Errorf("failed to retrieve credentials: %w", err)}
	}

	err = s.signer.SignHTTP(ctx, credentials, req,
		func(o *SignerOptions) {
			o.Logger = middleware.GetLogger(ctx)
			o.LogSigning = s.logSigning
		})
	if err != nil {
		return out, metadata, &SigningError{Err: fmt.Errorf("failed to sign http request, %w", err)}
	}

	r, ok := s.signer.(*Signer)
	if !ok {
		return out, metadata, &SigningError{Err: fmt.Errorf("unexpected singner type %T", s.signer)}
	}

	in.Request = r.Request

	ctx = awsmiddleware.SetSigningCredentials(ctx, credentials)

	return next.HandleFinalize(ctx, in)
}

func haveCredentialProvider(p aws.CredentialsProvider) bool {
	if p == nil {
		return false
	}
	switch p.(type) {
	case aws.AnonymousCredentials,
		*aws.AnonymousCredentials:
		return false
	}

	return true
}
