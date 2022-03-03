package nifcloud

import (
	"os"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/smithy-go/logging"
	"github.com/aws/smithy-go/middleware"
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

	// The HTTP Client the SDK's API clients will use to invoke HTTP requests.
	// The SDK defaults to a BuildableClient allowing API clients to create
	// copies of the HTTP Client for service specific customizations.
	//
	// Use a (*http.Client) for custom behavior. Using a custom http.Client
	// will prevent the SDK from modifying the HTTP client.
	HTTPClient aws.HTTPClient

	//nolint:staticcheck SA1019 to use aws.EndpointResolver
	EndpointResolver aws.EndpointResolver

	// An endpoint resolver that can be used to provide or override an endpoint for the given
	// service and region Please see the `aws.EndpointResolverWithOptions` documentation on usage.
	EndpointResolverWithOptions aws.EndpointResolverWithOptions

	// Config.Retryer member is not nil. This value will be ignored if
	// Retryer is not nil.
	RetryMaxAttempts int

	// RetryMode specifies the retry model the API client will be created with.
	//
	// API Clients will only use this value to construct a retryer if the
	// Config.Retryer member is not nil. This value will be ignored if
	// Retryer is not nil.
	RetryMode aws.RetryMode

	// Retryer is a function that provides a Retryer implementation. A Retryer guides how HTTP requests should be
	// retried in case of recoverable failures. When nil the API client will use a default
	// retryer.
	//
	// In general, the provider function should return a new instance of a Retryer if you are attempting
	// to provide a consistent Retryer configuration across all clients. This will ensure that each client will be
	// provided a new instance of the Retryer implementation, and will avoid issues such as sharing the same retry token
	// bucket across services.
	Retryer func() aws.Retryer

	// ConfigSources are the sources that were used to construct the Config.
	// Allows for additional configuration to be loaded by clients.
	ConfigSources []interface{}

	// APIOptions provides the set of middleware mutations modify how the API
	// client requests will be handled. This is useful for adding additional
	// tracing data to a request, or changing behavior of the SDK's client.
	APIOptions []func(*middleware.Stack) error

	// The logger writer interface to write logging messages to. Defaults to
	// standard error.
	Logger logging.Logger

	// Configures the events that will be sent to the configured logger.
	// This can be used to configure the logging of signing, retries, request, and responses
	// of the SDK clients.
	//
	// See the ClientLogMode type documentation for the complete set of logging modes and available
	// configuration.
	ClientLogMode aws.ClientLogMode

	// The configured DefaultsMode. If not specified, service clients will default to legacy.
	//
	// Supported modes are: auto, cross-region, in-region, legacy, mobile, standard
	DefaultsMode aws.DefaultsMode

	// The RuntimeEnvironment configuration, only populated if the DefaultsMode is set to
	// AutoDefaultsMode and is initialized by `config.LoadDefaultConfig`. You should not
	// populate this structure programmatically, or rely on the values here within your applications.
	RuntimeEnvironment aws.RuntimeEnvironment
}

// NewConfig returns a new Config with access key, secret key and region.
func NewConfig(key, secret, region string) Config {
	return Config{
		Region:      region,
		Credentials: NewStaticCredentialsProvider(key, secret),
		Logger:      logging.NewStandardLogger(os.Stderr),
	}
}

// AWSConfig converts the config values to aws.Config.
func (c Config) AWSConfig() aws.Config {
	return aws.Config{
		Region:                      c.Region,
		Credentials:                 c.Credentials,
		HTTPClient:                  c.HTTPClient,
		EndpointResolver:            c.EndpointResolver,
		EndpointResolverWithOptions: c.EndpointResolverWithOptions,
		RetryMaxAttempts:            c.RetryMaxAttempts,
		RetryMode:                   c.RetryMode,
		Retryer:                     c.Retryer,
		ConfigSources:               c.ConfigSources,
		APIOptions:                  c.APIOptions,
		Logger:                      c.Logger,
		ClientLogMode:               c.ClientLogMode,
		DefaultsMode:                c.DefaultsMode,
		RuntimeEnvironment:          c.RuntimeEnvironment,
	}
}
