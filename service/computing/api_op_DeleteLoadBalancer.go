// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type DeleteLoadBalancerInput struct {
	_ struct{} `type:"structure"`

	// InstancePort is a required field
	InstancePort *int64 `locationName:"InstancePort" type:"integer" required:"true"`

	// LoadBalancerName is a required field
	LoadBalancerName *string `locationName:"LoadBalancerName" type:"string" required:"true"`

	// LoadBalancerPort is a required field
	LoadBalancerPort *int64 `locationName:"LoadBalancerPort" type:"integer" required:"true"`
}

// String returns the string representation
func (s DeleteLoadBalancerInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *DeleteLoadBalancerInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "DeleteLoadBalancerInput"}

	if s.InstancePort == nil {
		invalidParams.Add(aws.NewErrParamRequired("InstancePort"))
	}

	if s.LoadBalancerName == nil {
		invalidParams.Add(aws.NewErrParamRequired("LoadBalancerName"))
	}

	if s.LoadBalancerPort == nil {
		invalidParams.Add(aws.NewErrParamRequired("LoadBalancerPort"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type DeleteLoadBalancerOutput struct {
	_ struct{} `type:"structure"`

	DeleteLoadBalancerResult *string `locationName:"DeleteLoadBalancerResult" type:"string"`

	ResponseMetadata *ResponseMetadata `locationName:"ResponseMetadata" type:"structure"`
}

// String returns the string representation
func (s DeleteLoadBalancerOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opDeleteLoadBalancer = "DeleteLoadBalancer"

// DeleteLoadBalancerRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using DeleteLoadBalancerRequest.
//    req := client.DeleteLoadBalancerRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/DeleteLoadBalancer.htm
func (c *Client) DeleteLoadBalancerRequest(input *DeleteLoadBalancerInput) DeleteLoadBalancerRequest {
	op := &aws.Operation{
		Name:       opDeleteLoadBalancer,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &DeleteLoadBalancerInput{}
	}

	req := c.newRequest(op, input, &DeleteLoadBalancerOutput{})

	return DeleteLoadBalancerRequest{Request: req, Input: input, Copy: c.DeleteLoadBalancerRequest}
}

// DeleteLoadBalancerRequest is the request type for the
// DeleteLoadBalancer API operation.
type DeleteLoadBalancerRequest struct {
	*aws.Request
	Input *DeleteLoadBalancerInput
	Copy  func(*DeleteLoadBalancerInput) DeleteLoadBalancerRequest
}

// Send marshals and sends the DeleteLoadBalancer API request.
func (r DeleteLoadBalancerRequest) Send(ctx context.Context) (*DeleteLoadBalancerResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &DeleteLoadBalancerResponse{
		DeleteLoadBalancerOutput: r.Request.Data.(*DeleteLoadBalancerOutput),
		response:                 &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// DeleteLoadBalancerResponse is the response type for the
// DeleteLoadBalancer API operation.
type DeleteLoadBalancerResponse struct {
	*DeleteLoadBalancerOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// DeleteLoadBalancer request.
func (r *DeleteLoadBalancerResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
