// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package rdb

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type RemoveSourceIdentifierFromSubscriptionInput struct {
	_ struct{} `type:"structure"`

	// SourceIdentifier is a required field
	SourceIdentifier *string `locationName:"SourceIdentifier" type:"string" required:"true"`

	// SubscriptionName is a required field
	SubscriptionName *string `locationName:"SubscriptionName" type:"string" required:"true"`
}

// String returns the string representation
func (s RemoveSourceIdentifierFromSubscriptionInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *RemoveSourceIdentifierFromSubscriptionInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "RemoveSourceIdentifierFromSubscriptionInput"}

	if s.SourceIdentifier == nil {
		invalidParams.Add(aws.NewErrParamRequired("SourceIdentifier"))
	}

	if s.SubscriptionName == nil {
		invalidParams.Add(aws.NewErrParamRequired("SubscriptionName"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type RemoveSourceIdentifierFromSubscriptionOutput struct {
	_ struct{} `type:"structure"`

	EventSubscription *EventSubscription `locationName:"EventSubscription" type:"structure"`

	ResponseMetadata *ResponseMetadata `locationName:"ResponseMetadata" type:"structure"`
}

// String returns the string representation
func (s RemoveSourceIdentifierFromSubscriptionOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opRemoveSourceIdentifierFromSubscription = "RemoveSourceIdentifierFromSubscription"

// RemoveSourceIdentifierFromSubscriptionRequest returns a request value for making API operation for
// NIFCLOUD RDB.
//
//    // Example sending a request using RemoveSourceIdentifierFromSubscriptionRequest.
//    req := client.RemoveSourceIdentifierFromSubscriptionRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rdb/RemoveSourceIdentifierFromSubscription.htm
func (c *Client) RemoveSourceIdentifierFromSubscriptionRequest(input *RemoveSourceIdentifierFromSubscriptionInput) RemoveSourceIdentifierFromSubscriptionRequest {
	op := &aws.Operation{
		Name:       opRemoveSourceIdentifierFromSubscription,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &RemoveSourceIdentifierFromSubscriptionInput{}
	}

	req := c.newRequest(op, input, &RemoveSourceIdentifierFromSubscriptionOutput{})

	return RemoveSourceIdentifierFromSubscriptionRequest{Request: req, Input: input, Copy: c.RemoveSourceIdentifierFromSubscriptionRequest}
}

// RemoveSourceIdentifierFromSubscriptionRequest is the request type for the
// RemoveSourceIdentifierFromSubscription API operation.
type RemoveSourceIdentifierFromSubscriptionRequest struct {
	*aws.Request
	Input *RemoveSourceIdentifierFromSubscriptionInput
	Copy  func(*RemoveSourceIdentifierFromSubscriptionInput) RemoveSourceIdentifierFromSubscriptionRequest
}

// Send marshals and sends the RemoveSourceIdentifierFromSubscription API request.
func (r RemoveSourceIdentifierFromSubscriptionRequest) Send(ctx context.Context) (*RemoveSourceIdentifierFromSubscriptionResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &RemoveSourceIdentifierFromSubscriptionResponse{
		RemoveSourceIdentifierFromSubscriptionOutput: r.Request.Data.(*RemoveSourceIdentifierFromSubscriptionOutput),
		response: &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// RemoveSourceIdentifierFromSubscriptionResponse is the response type for the
// RemoveSourceIdentifierFromSubscription API operation.
type RemoveSourceIdentifierFromSubscriptionResponse struct {
	*RemoveSourceIdentifierFromSubscriptionOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// RemoveSourceIdentifierFromSubscription request.
func (r *RemoveSourceIdentifierFromSubscriptionResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
