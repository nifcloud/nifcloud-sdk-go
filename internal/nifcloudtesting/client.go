package nifcloudtesting

import (
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/retry"
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
)

// NewClient creates and initializes a generic service client for testing.
func NewClient(cfg nifcloud.Config) *aws.Client {
	if cfg.Retryer == nil {
		cfg.Retryer = retry.NewStandard()
	}
	return aws.NewClient(cfg.AWSConfig(), aws.Metadata{ServiceName: "mockService"})
}
