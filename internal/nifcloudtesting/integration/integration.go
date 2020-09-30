// +build integration

// Package integration performs initialization and validation for integration
// tests.
package integration

import (
	"os"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/defaults"
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
)

// ConfigWithDefaultRegion returns a copy of the integration config with the
// region set if one was not already provided.
func ConfigWithDefaultRegion(region string) nifcloud.Config {
	cfg := nifcloud.NewConfig(os.Getenv("NIFCLOUD_ACCESS_KEY_ID"), os.Getenv("NIFCLOUD_SECRET_ACCESS_KEY"), region)

	// Disable parameter validation for integration tests.
	cfg.Handlers.Validate.Remove(defaults.ValidateParametersHandler)

	// Disable retryer for integration tests.
	cfg.Retryer = aws.NoOpRetryer{}

	logLevel := cfg.LogLevel
	if os.Getenv("DEBUG") != "" {
		logLevel = aws.LogLevel(aws.LogDebug)
	}
	if os.Getenv("DEBUG_SIGNING") != "" {
		logLevel = aws.LogLevel(aws.LogDebugWithSigning)
	}
	if os.Getenv("DEBUG_BODY") != "" {
		logLevel = aws.LogLevel(aws.LogDebugWithSigning | aws.LogDebugWithHTTPBody)
	}
	cfg.LogLevel = logLevel

	return cfg
}
