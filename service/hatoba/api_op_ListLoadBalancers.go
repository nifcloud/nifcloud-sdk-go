// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package hatoba

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type ListLoadBalancersInput struct {
	_ struct{} `type:"structure"`
}

// String returns the string representation
func (s ListLoadBalancersInput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s ListLoadBalancersInput) MarshalFields(e protocol.FieldEncoder) error {
	e.SetValue(protocol.HeaderTarget, "Content-Type", protocol.StringValue("application/json"), protocol.Metadata{})

	return nil
}

type ListLoadBalancersOutput struct {
	_ struct{} `type:"structure"`

	LoadBalancers []LoadBalancersOfListLoadBalancers `locationName:"loadBalancers" type:"list"`
}

// String returns the string representation
func (s ListLoadBalancersOutput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s ListLoadBalancersOutput) MarshalFields(e protocol.FieldEncoder) error {
	if s.LoadBalancers != nil {
		v := s.LoadBalancers

		metadata := protocol.Metadata{}
		ls0 := e.List(protocol.BodyTarget, "loadBalancers", metadata)
		ls0.Start()
		for _, v1 := range v {
			ls0.ListAddFields(v1)
		}
		ls0.End()

	}
	return nil
}

const opListLoadBalancers = "ListLoadBalancers"

// ListLoadBalancersRequest returns a request value for making API operation for
// NIFCLOUD Kubernetes Service Hatoba.
//
//    // Example sending a request using ListLoadBalancersRequest.
//    req := client.ListLoadBalancersRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/hatoba/ListLoadBalancers.htm
func (c *Client) ListLoadBalancersRequest(input *ListLoadBalancersInput) ListLoadBalancersRequest {
	op := &aws.Operation{
		Name:       opListLoadBalancers,
		HTTPMethod: "GET",
		HTTPPath:   "/v1/loadBalancers",
	}

	if input == nil {
		input = &ListLoadBalancersInput{}
	}

	req := c.newRequest(op, input, &ListLoadBalancersOutput{})

	return ListLoadBalancersRequest{Request: req, Input: input, Copy: c.ListLoadBalancersRequest}
}

// ListLoadBalancersRequest is the request type for the
// ListLoadBalancers API operation.
type ListLoadBalancersRequest struct {
	*aws.Request
	Input *ListLoadBalancersInput
	Copy  func(*ListLoadBalancersInput) ListLoadBalancersRequest
}

// Send marshals and sends the ListLoadBalancers API request.
func (r ListLoadBalancersRequest) Send(ctx context.Context) (*ListLoadBalancersResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &ListLoadBalancersResponse{
		ListLoadBalancersOutput: r.Request.Data.(*ListLoadBalancersOutput),
		response:                &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// ListLoadBalancersResponse is the response type for the
// ListLoadBalancers API operation.
type ListLoadBalancersResponse struct {
	*ListLoadBalancersOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// ListLoadBalancers request.
func (r *ListLoadBalancersResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
