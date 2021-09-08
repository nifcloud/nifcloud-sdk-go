// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package ess

import (
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/retry"
	"github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	"github.com/nifcloud/nifcloud-sdk-go/private/protocol/ess"
)

// Client provides the API operation methods for making requests to
// ess. See this package's package overview docs
// for details on the service.
//
// The client's methods are safe to use concurrently. It is not safe to
// modify mutate any of the struct's properties though.
type Client struct {
	*aws.Client
}

// Used for custom client initialization logic
var initClient func(*Client)

// Used for custom request initialization logic
var initRequest func(*Client, *aws.Request)

const (
	ServiceName = "ess" // Service's name
	ServiceID   = "Ess" // Service's identifier
	EndpointsID = "ess" // Service's Endpoint identifier
)

// New creates a new instance of the client from the provided Config.
//
// Example:
//     // Create a client from just a config.
//     svc := ess.New(myConfig)
func New(config nifcloud.Config) *Client {
	svc := &Client{
		Client: aws.NewClient(
			config.AWSConfig(),
			aws.Metadata{
				ServiceName:   ServiceName,
				ServiceID:     ServiceID,
				EndpointsID:   EndpointsID,
				SigningName:   "email",
				SigningRegion: config.Region,
				APIVersion:    "2010-12-01N2014-05-28",
			},
		),
	}

	if config.Retryer == nil {
		svc.Retryer = retry.NewStandard()
	}

	// Handlers
	svc.Handlers.Sign.PushBackNamed(v4.SignRequestHandler)
	svc.Handlers.Build.PushBackNamed(ess.BuildHandler)
	svc.Handlers.Unmarshal.PushBackNamed(ess.UnmarshalHandler)
	svc.Handlers.UnmarshalMeta.PushBackNamed(ess.UnmarshalMetaHandler)
	svc.Handlers.UnmarshalError.PushBackNamed(ess.UnmarshalErrorHandler)

	// Run custom client initialization if present
	if initClient != nil {
		initClient(svc)
	}

	return svc
}

// newRequest creates a new request for a client operation and runs any
// custom request initialization.
func (c *Client) newRequest(op *aws.Operation, params, data interface{}) *aws.Request {
	req := c.NewRequest(op, params, data)

	// Run custom request initialization if present
	if initRequest != nil {
		initRequest(c, req)
	}

	return req
}