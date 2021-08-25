// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package ess

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type SendRawEmailInput struct {
	_ struct{} `type:"structure"`

	Destinations []string `locationName:"Destinations" locationNameList:"member" type:"list"`

	// RawMessage is a required field
	RawMessage *RequestRawMessage `locationName:"RawMessage" type:"structure" required:"true"`

	Source *string `locationName:"Source" type:"string"`
}

// String returns the string representation
func (s SendRawEmailInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *SendRawEmailInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "SendRawEmailInput"}

	if s.RawMessage == nil {
		invalidParams.Add(aws.NewErrParamRequired("RawMessage"))
	}
	if s.RawMessage != nil {
		if err := s.RawMessage.Validate(); err != nil {
			invalidParams.AddNested("RawMessage", err.(aws.ErrInvalidParams))
		}
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type SendRawEmailOutput struct {
	_ struct{} `type:"structure"`

	MessageId *string `locationName:"MessageId" type:"string"`

	ResponseMetadata *ResponseMetadata `locationName:"ResponseMetadata" type:"structure"`
}

// String returns the string representation
func (s SendRawEmailOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opSendRawEmail = "SendRawEmail"

// SendRawEmailRequest returns a request value for making API operation for
// NIFCLOUD ESS.
//
//    // Example sending a request using SendRawEmailRequest.
//    req := client.SendRawEmailRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/ess/SendRawEmail.htm
func (c *Client) SendRawEmailRequest(input *SendRawEmailInput) SendRawEmailRequest {
	op := &aws.Operation{
		Name:       opSendRawEmail,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &SendRawEmailInput{}
	}

	req := c.newRequest(op, input, &SendRawEmailOutput{})

	return SendRawEmailRequest{Request: req, Input: input, Copy: c.SendRawEmailRequest}
}

// SendRawEmailRequest is the request type for the
// SendRawEmail API operation.
type SendRawEmailRequest struct {
	*aws.Request
	Input *SendRawEmailInput
	Copy  func(*SendRawEmailInput) SendRawEmailRequest
}

// Send marshals and sends the SendRawEmail API request.
func (r SendRawEmailRequest) Send(ctx context.Context) (*SendRawEmailResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &SendRawEmailResponse{
		SendRawEmailOutput: r.Request.Data.(*SendRawEmailOutput),
		response:           &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// SendRawEmailResponse is the response type for the
// SendRawEmail API operation.
type SendRawEmailResponse struct {
	*SendRawEmailOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// SendRawEmail request.
func (r *SendRawEmailResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}