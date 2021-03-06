// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type IncreaseMultiIpAddressCountInput struct {
	_ struct{} `type:"structure"`

	// IpAddressCount is a required field
	IpAddressCount *int64 `locationName:"IpAddressCount" type:"integer" required:"true"`

	// MultiIpAddressGroupId is a required field
	MultiIpAddressGroupId *string `locationName:"MultiIpAddressGroupId" type:"string" required:"true"`
}

// String returns the string representation
func (s IncreaseMultiIpAddressCountInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *IncreaseMultiIpAddressCountInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "IncreaseMultiIpAddressCountInput"}

	if s.IpAddressCount == nil {
		invalidParams.Add(aws.NewErrParamRequired("IpAddressCount"))
	}

	if s.MultiIpAddressGroupId == nil {
		invalidParams.Add(aws.NewErrParamRequired("MultiIpAddressGroupId"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type IncreaseMultiIpAddressCountOutput struct {
	_ struct{} `type:"structure"`

	RequestId *string `locationName:"requestId" type:"string"`

	Return *bool `locationName:"return" type:"boolean"`
}

// String returns the string representation
func (s IncreaseMultiIpAddressCountOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opIncreaseMultiIpAddressCount = "IncreaseMultiIpAddressCount"

// IncreaseMultiIpAddressCountRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using IncreaseMultiIpAddressCountRequest.
//    req := client.IncreaseMultiIpAddressCountRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/IncreaseMultiIpAddressCount.htm
func (c *Client) IncreaseMultiIpAddressCountRequest(input *IncreaseMultiIpAddressCountInput) IncreaseMultiIpAddressCountRequest {
	op := &aws.Operation{
		Name:       opIncreaseMultiIpAddressCount,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &IncreaseMultiIpAddressCountInput{}
	}

	req := c.newRequest(op, input, &IncreaseMultiIpAddressCountOutput{})

	return IncreaseMultiIpAddressCountRequest{Request: req, Input: input, Copy: c.IncreaseMultiIpAddressCountRequest}
}

// IncreaseMultiIpAddressCountRequest is the request type for the
// IncreaseMultiIpAddressCount API operation.
type IncreaseMultiIpAddressCountRequest struct {
	*aws.Request
	Input *IncreaseMultiIpAddressCountInput
	Copy  func(*IncreaseMultiIpAddressCountInput) IncreaseMultiIpAddressCountRequest
}

// Send marshals and sends the IncreaseMultiIpAddressCount API request.
func (r IncreaseMultiIpAddressCountRequest) Send(ctx context.Context) (*IncreaseMultiIpAddressCountResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &IncreaseMultiIpAddressCountResponse{
		IncreaseMultiIpAddressCountOutput: r.Request.Data.(*IncreaseMultiIpAddressCountOutput),
		response:                          &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// IncreaseMultiIpAddressCountResponse is the response type for the
// IncreaseMultiIpAddressCount API operation.
type IncreaseMultiIpAddressCountResponse struct {
	*IncreaseMultiIpAddressCountOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// IncreaseMultiIpAddressCount request.
func (r *IncreaseMultiIpAddressCountResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
