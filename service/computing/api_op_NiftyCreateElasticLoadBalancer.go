// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"
	"fmt"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type NiftyCreateElasticLoadBalancerInput struct {
	_ struct{} `type:"structure"`

	AccountingType AccountingTypeOfNiftyCreateElasticLoadBalancerRequest `locationName:"AccountingType" type:"string" enum:"true"`

	// AvailabilityZones is a required field
	AvailabilityZones []string `locationName:"AvailabilityZones" locationNameList:"member" type:"list" required:"true"`

	ElasticLoadBalancerName *string `locationName:"ElasticLoadBalancerName" type:"string"`

	// Listeners is a required field
	Listeners []RequestListenersOfNiftyCreateElasticLoadBalancer `locationName:"Listeners" locationNameList:"member" type:"list" required:"true"`

	NetworkInterface []RequestNetworkInterfaceOfNiftyCreateElasticLoadBalancer `locationName:"NetworkInterface" type:"list"`

	NetworkVolume *int64 `locationName:"NetworkVolume" type:"integer"`
}

// String returns the string representation
func (s NiftyCreateElasticLoadBalancerInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *NiftyCreateElasticLoadBalancerInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "NiftyCreateElasticLoadBalancerInput"}

	if s.AvailabilityZones == nil {
		invalidParams.Add(aws.NewErrParamRequired("AvailabilityZones"))
	}

	if s.Listeners == nil {
		invalidParams.Add(aws.NewErrParamRequired("Listeners"))
	}
	if s.Listeners != nil {
		for i, v := range s.Listeners {
			if err := v.Validate(); err != nil {
				invalidParams.AddNested(fmt.Sprintf("%s[%v]", "Listeners", i), err.(aws.ErrInvalidParams))
			}
		}
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type NiftyCreateElasticLoadBalancerOutput struct {
	_ struct{} `type:"structure"`

	DNSName *string `locationName:"DNSName" type:"string"`

	ResponseMetadata *ResponseMetadata `locationName:"ResponseMetadata" type:"structure"`
}

// String returns the string representation
func (s NiftyCreateElasticLoadBalancerOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opNiftyCreateElasticLoadBalancer = "NiftyCreateElasticLoadBalancer"

// NiftyCreateElasticLoadBalancerRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using NiftyCreateElasticLoadBalancerRequest.
//    req := client.NiftyCreateElasticLoadBalancerRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/NiftyCreateElasticLoadBalancer.htm
func (c *Client) NiftyCreateElasticLoadBalancerRequest(input *NiftyCreateElasticLoadBalancerInput) NiftyCreateElasticLoadBalancerRequest {
	op := &aws.Operation{
		Name:       opNiftyCreateElasticLoadBalancer,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &NiftyCreateElasticLoadBalancerInput{}
	}

	req := c.newRequest(op, input, &NiftyCreateElasticLoadBalancerOutput{})

	return NiftyCreateElasticLoadBalancerRequest{Request: req, Input: input, Copy: c.NiftyCreateElasticLoadBalancerRequest}
}

// NiftyCreateElasticLoadBalancerRequest is the request type for the
// NiftyCreateElasticLoadBalancer API operation.
type NiftyCreateElasticLoadBalancerRequest struct {
	*aws.Request
	Input *NiftyCreateElasticLoadBalancerInput
	Copy  func(*NiftyCreateElasticLoadBalancerInput) NiftyCreateElasticLoadBalancerRequest
}

// Send marshals and sends the NiftyCreateElasticLoadBalancer API request.
func (r NiftyCreateElasticLoadBalancerRequest) Send(ctx context.Context) (*NiftyCreateElasticLoadBalancerResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &NiftyCreateElasticLoadBalancerResponse{
		NiftyCreateElasticLoadBalancerOutput: r.Request.Data.(*NiftyCreateElasticLoadBalancerOutput),
		response:                             &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// NiftyCreateElasticLoadBalancerResponse is the response type for the
// NiftyCreateElasticLoadBalancer API operation.
type NiftyCreateElasticLoadBalancerResponse struct {
	*NiftyCreateElasticLoadBalancerOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// NiftyCreateElasticLoadBalancer request.
func (r *NiftyCreateElasticLoadBalancerResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
