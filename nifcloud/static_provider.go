package nifcloud

import (
	"context"
	"errors"

	"github.com/aws/aws-sdk-go-v2/aws"
)

// A StaticCredentialsProvider is a set of credentials which are set programmatically.
type StaticCredentialsProvider struct {
	Value aws.Credentials
}

// NewStaticCredentialsProvider return a StaticCredentialsProvider initialized with the NIFCLOUD credentials passed in.
func NewStaticCredentialsProvider(key, secret string) StaticCredentialsProvider {
	return StaticCredentialsProvider{
		Value: aws.Credentials{
			AccessKeyID:     key,
			SecretAccessKey: secret,
		},
	}
}

// Retrieve returns the credentials or error if the credentials are invalid.
func (s StaticCredentialsProvider) Retrieve(ctx context.Context) (aws.Credentials, error) {
	v := s.Value
	if v.AccessKeyID == "" || v.SecretAccessKey == "" {
		return aws.Credentials{}, errors.New("static credentials are empty")
	}

	return v, nil
}
