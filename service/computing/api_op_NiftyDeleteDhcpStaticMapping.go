// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type NiftyDeleteDhcpStaticMappingInput struct {
	_ struct{} `type:"structure"`

	// DhcpConfigId is a required field
	DhcpConfigId *string `locationName:"DhcpConfigId" type:"string" required:"true"`

	// IpAddress is a required field
	IpAddress *string `locationName:"IpAddress" type:"string" required:"true"`

	// MacAddress is a required field
	MacAddress *string `locationName:"MacAddress" type:"string" required:"true"`
}

// String returns the string representation
func (s NiftyDeleteDhcpStaticMappingInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *NiftyDeleteDhcpStaticMappingInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "NiftyDeleteDhcpStaticMappingInput"}

	if s.DhcpConfigId == nil {
		invalidParams.Add(aws.NewErrParamRequired("DhcpConfigId"))
	}

	if s.IpAddress == nil {
		invalidParams.Add(aws.NewErrParamRequired("IpAddress"))
	}

	if s.MacAddress == nil {
		invalidParams.Add(aws.NewErrParamRequired("MacAddress"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type NiftyDeleteDhcpStaticMappingOutput struct {
	_ struct{} `type:"structure"`

	RequestId *string `locationName:"requestId" type:"string"`

	Return *bool `locationName:"return" type:"boolean"`
}

// String returns the string representation
func (s NiftyDeleteDhcpStaticMappingOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opNiftyDeleteDhcpStaticMapping = "NiftyDeleteDhcpStaticMapping"

// NiftyDeleteDhcpStaticMappingRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using NiftyDeleteDhcpStaticMappingRequest.
//    req := client.NiftyDeleteDhcpStaticMappingRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/NiftyDeleteDhcpStaticMapping.htm
func (c *Client) NiftyDeleteDhcpStaticMappingRequest(input *NiftyDeleteDhcpStaticMappingInput) NiftyDeleteDhcpStaticMappingRequest {
	op := &aws.Operation{
		Name:       opNiftyDeleteDhcpStaticMapping,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &NiftyDeleteDhcpStaticMappingInput{}
	}

	req := c.newRequest(op, input, &NiftyDeleteDhcpStaticMappingOutput{})

	return NiftyDeleteDhcpStaticMappingRequest{Request: req, Input: input, Copy: c.NiftyDeleteDhcpStaticMappingRequest}
}

// NiftyDeleteDhcpStaticMappingRequest is the request type for the
// NiftyDeleteDhcpStaticMapping API operation.
type NiftyDeleteDhcpStaticMappingRequest struct {
	*aws.Request
	Input *NiftyDeleteDhcpStaticMappingInput
	Copy  func(*NiftyDeleteDhcpStaticMappingInput) NiftyDeleteDhcpStaticMappingRequest
}

// Send marshals and sends the NiftyDeleteDhcpStaticMapping API request.
func (r NiftyDeleteDhcpStaticMappingRequest) Send(ctx context.Context) (*NiftyDeleteDhcpStaticMappingResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &NiftyDeleteDhcpStaticMappingResponse{
		NiftyDeleteDhcpStaticMappingOutput: r.Request.Data.(*NiftyDeleteDhcpStaticMappingOutput),
		response:                           &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// NiftyDeleteDhcpStaticMappingResponse is the response type for the
// NiftyDeleteDhcpStaticMapping API operation.
type NiftyDeleteDhcpStaticMappingResponse struct {
	*NiftyDeleteDhcpStaticMappingOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// NiftyDeleteDhcpStaticMapping request.
func (r *NiftyDeleteDhcpStaticMappingResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
