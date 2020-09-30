// Package unit performs initialization and validation for unit tests
package unit

import (
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
)

// Config returns a copy of the mock configuration for unit tests.
func Config() nifcloud.Config {
	cfg := nifcloud.NewConfig("AKID", "SECRET", "mock-region")
	cfg.EndpointResolver = aws.ResolveWithEndpointURL("https://endpoint")
	return cfg
}
