// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type UpdateLoadBalancerInput struct {
	_ struct{} `type:"structure"`

	AccountingTypeUpdate *int64 `locationName:"AccountingTypeUpdate" type:"integer"`

	ListenerUpdate *RequestListenerUpdate `locationName:"ListenerUpdate" type:"structure"`

	// LoadBalancerName is a required field
	LoadBalancerName *string `locationName:"LoadBalancerName" type:"string" required:"true"`

	LoadBalancerNameUpdate *string `locationName:"LoadBalancerNameUpdate" type:"string"`

	NetworkVolumeUpdate *int64 `locationName:"NetworkVolumeUpdate" type:"integer"`
}

// String returns the string representation
func (s UpdateLoadBalancerInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *UpdateLoadBalancerInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "UpdateLoadBalancerInput"}

	if s.LoadBalancerName == nil {
		invalidParams.Add(aws.NewErrParamRequired("LoadBalancerName"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type UpdateLoadBalancerOutput struct {
	_ struct{} `type:"structure"`

	ResponseMetadata *ResponseMetadata `locationName:"ResponseMetadata" type:"structure"`
}

// String returns the string representation
func (s UpdateLoadBalancerOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opUpdateLoadBalancer = "UpdateLoadBalancer"

// UpdateLoadBalancerRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using UpdateLoadBalancerRequest.
//    req := client.UpdateLoadBalancerRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/UpdateLoadBalancer.htm
func (c *Client) UpdateLoadBalancerRequest(input *UpdateLoadBalancerInput) UpdateLoadBalancerRequest {
	op := &aws.Operation{
		Name:       opUpdateLoadBalancer,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &UpdateLoadBalancerInput{}
	}

	req := c.newRequest(op, input, &UpdateLoadBalancerOutput{})

	return UpdateLoadBalancerRequest{Request: req, Input: input, Copy: c.UpdateLoadBalancerRequest}
}

// UpdateLoadBalancerRequest is the request type for the
// UpdateLoadBalancer API operation.
type UpdateLoadBalancerRequest struct {
	*aws.Request
	Input *UpdateLoadBalancerInput
	Copy  func(*UpdateLoadBalancerInput) UpdateLoadBalancerRequest
}

// Send marshals and sends the UpdateLoadBalancer API request.
func (r UpdateLoadBalancerRequest) Send(ctx context.Context) (*UpdateLoadBalancerResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &UpdateLoadBalancerResponse{
		UpdateLoadBalancerOutput: r.Request.Data.(*UpdateLoadBalancerOutput),
		response:                 &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// UpdateLoadBalancerResponse is the response type for the
// UpdateLoadBalancer API operation.
type UpdateLoadBalancerResponse struct {
	*UpdateLoadBalancerOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// UpdateLoadBalancer request.
func (r *UpdateLoadBalancerResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
