// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type NiftyDisassociateRouteTableFromElasticLoadBalancerInput struct {
	_ struct{} `type:"structure"`

	// AssociationId is a required field
	AssociationId *string `locationName:"AssociationId" type:"string" required:"true"`
}

// String returns the string representation
func (s NiftyDisassociateRouteTableFromElasticLoadBalancerInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *NiftyDisassociateRouteTableFromElasticLoadBalancerInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "NiftyDisassociateRouteTableFromElasticLoadBalancerInput"}

	if s.AssociationId == nil {
		invalidParams.Add(aws.NewErrParamRequired("AssociationId"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type NiftyDisassociateRouteTableFromElasticLoadBalancerOutput struct {
	_ struct{} `type:"structure"`

	RequestId *string `locationName:"requestId" type:"string"`

	Return *bool `locationName:"return" type:"boolean"`
}

// String returns the string representation
func (s NiftyDisassociateRouteTableFromElasticLoadBalancerOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opNiftyDisassociateRouteTableFromElasticLoadBalancer = "NiftyDisassociateRouteTableFromElasticLoadBalancer"

// NiftyDisassociateRouteTableFromElasticLoadBalancerRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using NiftyDisassociateRouteTableFromElasticLoadBalancerRequest.
//    req := client.NiftyDisassociateRouteTableFromElasticLoadBalancerRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/NiftyDisassociateRouteTableFromElasticLoadBalancer.htm
func (c *Client) NiftyDisassociateRouteTableFromElasticLoadBalancerRequest(input *NiftyDisassociateRouteTableFromElasticLoadBalancerInput) NiftyDisassociateRouteTableFromElasticLoadBalancerRequest {
	op := &aws.Operation{
		Name:       opNiftyDisassociateRouteTableFromElasticLoadBalancer,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &NiftyDisassociateRouteTableFromElasticLoadBalancerInput{}
	}

	req := c.newRequest(op, input, &NiftyDisassociateRouteTableFromElasticLoadBalancerOutput{})

	return NiftyDisassociateRouteTableFromElasticLoadBalancerRequest{Request: req, Input: input, Copy: c.NiftyDisassociateRouteTableFromElasticLoadBalancerRequest}
}

// NiftyDisassociateRouteTableFromElasticLoadBalancerRequest is the request type for the
// NiftyDisassociateRouteTableFromElasticLoadBalancer API operation.
type NiftyDisassociateRouteTableFromElasticLoadBalancerRequest struct {
	*aws.Request
	Input *NiftyDisassociateRouteTableFromElasticLoadBalancerInput
	Copy  func(*NiftyDisassociateRouteTableFromElasticLoadBalancerInput) NiftyDisassociateRouteTableFromElasticLoadBalancerRequest
}

// Send marshals and sends the NiftyDisassociateRouteTableFromElasticLoadBalancer API request.
func (r NiftyDisassociateRouteTableFromElasticLoadBalancerRequest) Send(ctx context.Context) (*NiftyDisassociateRouteTableFromElasticLoadBalancerResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &NiftyDisassociateRouteTableFromElasticLoadBalancerResponse{
		NiftyDisassociateRouteTableFromElasticLoadBalancerOutput: r.Request.Data.(*NiftyDisassociateRouteTableFromElasticLoadBalancerOutput),
		response: &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// NiftyDisassociateRouteTableFromElasticLoadBalancerResponse is the response type for the
// NiftyDisassociateRouteTableFromElasticLoadBalancer API operation.
type NiftyDisassociateRouteTableFromElasticLoadBalancerResponse struct {
	*NiftyDisassociateRouteTableFromElasticLoadBalancerOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// NiftyDisassociateRouteTableFromElasticLoadBalancer request.
func (r *NiftyDisassociateRouteTableFromElasticLoadBalancerResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
