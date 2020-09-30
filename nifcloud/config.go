package nifcloud

import (
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/defaults"
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud/endpoints"
)

// A Config provides service configuration for service clients.
// This struct is copied from github.com/aws/aws-sdk-go-v2/aws.Config
type Config struct {
	// The region to send requests to. This parameter is required and must
	// be configured globally or on a per-client basis unless otherwise
	// noted. A full list of regions is found in the "Regions and Endpoints"
	// document.
	//
	// See http://docs.aws.amazon.com/general/latest/gr/rande.html for
	// information on AWS regions.
	Region string

	// The credentials object to use when signing requests. Defaults to a
	// chain of credential providers to search for credentials in environment
	// variables, shared credential file, and EC2 Instance Roles.
	Credentials aws.CredentialsProvider

	// The resolver to use for looking up endpoints for AWS service clients
	// to use based on region.
	EndpointResolver aws.EndpointResolver

	// The HTTP Client the SDK's API clients will use to invoke HTTP requests.
	// The SDK defaults to a BuildableHTTPClient allowing API clients to create
	// copies of the HTTP Client for service specific customizations.
	//
	// Use a (*http.Client) for custom behavior. Using a custom http.Client
	// will prevent the SDK from modifying the HTTP client.
	HTTPClient aws.HTTPClient

	// TODO document
	Handlers aws.Handlers

	// Retryer guides how HTTP requests should be retried in case of
	// recoverable failures.
	//
	// When nil or the value does not implement the request.Retryer interface,
	// the client.DefaultRetryer will be used.
	//
	// When both Retryer and MaxRetries are non-nil, the former is used and
	// the latter ignored.
	//
	// To set the Retryer field in a type-safe manner and with chaining, use
	// the request.WithRetryer helper function:
	//
	//   cfg := request.WithRetryer(aws.NewConfig(), myRetryer)
	Retryer aws.Retryer

	// An integer value representing the logging level. The default log level
	// is zero (LogOff), which represents no logging. To enable logging set
	// to a LogLevel Value.
	LogLevel aws.LogLevel

	// The logger writer interface to write logging messages to. Defaults to
	// standard out.
	Logger aws.Logger

	// DisableRestProtocolURICleaning will not clean the URL path when making
	// rest protocol requests.  Will default to false. This would only be used
	// for empty directory names in s3 requests.
	//
	// Example:
	//    cfg, err := external.LoadDefaultAWSConfig()
	//    cfg.DisableRestProtocolURICleaning = true
	//
	//    svc := s3.New(cfg)
	//    out, err := svc.GetObject(&s3.GetObjectInput {
	//    	Bucket: aws.String("bucketname"),
	//    	Key: aws.String("//foo//bar//moo"),
	//    })
	//
	// TODO need better way of representing support for this concept. Not on Config.
	DisableRestProtocolURICleaning bool

	// DisableEndpointHostPrefix will disable the SDK's behavior of prefixing
	// request endpoint hosts with modeled information.
	//
	// Disabling this feature is useful when you want to use local endpoints
	// for testing that do not support the modeled host prefix pattern.
	DisableEndpointHostPrefix bool
}

// NewConfig returns a new Config with access key, secret key and region.
func NewConfig(key, secret, region string) Config {
	return Config{
		Region:           region,
		EndpointResolver: endpoints.NewDefaultResolver(),
		Credentials:      NewStaticCredentialsProvider(key, secret),
		HTTPClient:       defaults.HTTPClient(),
		Logger:           defaults.Logger(),
		Handlers:         defaults.Handlers(),
	}
}

// AWSConfig converts the config values to aws.Config.
func (c Config) AWSConfig() aws.Config {
	return aws.Config{
		Region:                         c.Region,
		Credentials:                    c.Credentials,
		EndpointResolver:               c.EndpointResolver,
		HTTPClient:                     c.HTTPClient,
		Handlers:                       c.Handlers,
		Retryer:                        c.Retryer,
		LogLevel:                       c.LogLevel,
		Logger:                         c.Logger,
		DisableRestProtocolURICleaning: c.DisableRestProtocolURICleaning,
		DisableEndpointHostPrefix:      c.DisableEndpointHostPrefix,
	}
}
