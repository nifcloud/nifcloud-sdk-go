// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package nas

import (
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/retry"
	"github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	"github.com/nifcloud/nifcloud-sdk-go/private/protocol/nas"
)

// Client provides the API operation methods for making requests to
// nas. See this package's package overview docs
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
	ServiceName = "nas" // Service's name
	ServiceID   = "Nas" // Service's identifier
	EndpointsID = "nas" // Service's Endpoint identifier
)

// New creates a new instance of the client from the provided Config.
//
// Example:
//     // Create a client from just a config.
//     svc := nas.New(myConfig)
func New(config nifcloud.Config) *Client {
	svc := &Client{
		Client: aws.NewClient(
			config.AWSConfig(),
			aws.Metadata{
				ServiceName:   ServiceName,
				ServiceID:     ServiceID,
				EndpointsID:   EndpointsID,
				SigningName:   "nas",
				SigningRegion: config.Region,
				APIVersion:    "N2016-02-24",
			},
		),
	}

	if config.Retryer == nil {
		svc.Retryer = retry.NewStandard()
	}

	// Handlers
	svc.Handlers.Sign.PushBackNamed(v4.SignRequestHandler)
	svc.Handlers.Build.PushBackNamed(nas.BuildHandler)
	svc.Handlers.Unmarshal.PushBackNamed(nas.UnmarshalHandler)
	svc.Handlers.UnmarshalMeta.PushBackNamed(nas.UnmarshalMetaHandler)
	svc.Handlers.UnmarshalError.PushBackNamed(nas.UnmarshalErrorHandler)

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
