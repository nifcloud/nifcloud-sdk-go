// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type NiftyCreateNatRuleInput struct {
	_ struct{} `type:"structure"`

	Description *string `locationName:"Description" type:"string"`

	Destination *RequestDestination `locationName:"Destination" type:"structure"`

	InboundInterface *RequestInboundInterface `locationName:"InboundInterface" type:"structure"`

	// NatTableId is a required field
	NatTableId *string `locationName:"NatTableId" type:"string" required:"true"`

	// NatType is a required field
	NatType NatTypeOfNiftyCreateNatRuleRequest `locationName:"NatType" type:"string" required:"true" enum:"true"`

	OutboundInterface *RequestOutboundInterface `locationName:"OutboundInterface" type:"structure"`

	// Protocol is a required field
	Protocol ProtocolOfNiftyCreateNatRuleRequest `locationName:"Protocol" type:"string" required:"true" enum:"true"`

	// RuleNumber is a required field
	RuleNumber *string `locationName:"RuleNumber" type:"string" required:"true"`

	Source *RequestSource `locationName:"Source" type:"structure"`

	Translation *RequestTranslation `locationName:"Translation" type:"structure"`
}

// String returns the string representation
func (s NiftyCreateNatRuleInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *NiftyCreateNatRuleInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "NiftyCreateNatRuleInput"}

	if s.NatTableId == nil {
		invalidParams.Add(aws.NewErrParamRequired("NatTableId"))
	}
	if len(s.NatType) == 0 {
		invalidParams.Add(aws.NewErrParamRequired("NatType"))
	}
	if len(s.Protocol) == 0 {
		invalidParams.Add(aws.NewErrParamRequired("Protocol"))
	}

	if s.RuleNumber == nil {
		invalidParams.Add(aws.NewErrParamRequired("RuleNumber"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type NiftyCreateNatRuleOutput struct {
	_ struct{} `type:"structure"`

	NatRule *NatRule `locationName:"natRule" type:"structure"`

	NatTableId *string `locationName:"natTableId" type:"string"`

	RequestId *string `locationName:"requestId" type:"string"`
}

// String returns the string representation
func (s NiftyCreateNatRuleOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opNiftyCreateNatRule = "NiftyCreateNatRule"

// NiftyCreateNatRuleRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using NiftyCreateNatRuleRequest.
//    req := client.NiftyCreateNatRuleRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/NiftyCreateNatRule.htm
func (c *Client) NiftyCreateNatRuleRequest(input *NiftyCreateNatRuleInput) NiftyCreateNatRuleRequest {
	op := &aws.Operation{
		Name:       opNiftyCreateNatRule,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &NiftyCreateNatRuleInput{}
	}

	req := c.newRequest(op, input, &NiftyCreateNatRuleOutput{})

	return NiftyCreateNatRuleRequest{Request: req, Input: input, Copy: c.NiftyCreateNatRuleRequest}
}

// NiftyCreateNatRuleRequest is the request type for the
// NiftyCreateNatRule API operation.
type NiftyCreateNatRuleRequest struct {
	*aws.Request
	Input *NiftyCreateNatRuleInput
	Copy  func(*NiftyCreateNatRuleInput) NiftyCreateNatRuleRequest
}

// Send marshals and sends the NiftyCreateNatRule API request.
func (r NiftyCreateNatRuleRequest) Send(ctx context.Context) (*NiftyCreateNatRuleResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &NiftyCreateNatRuleResponse{
		NiftyCreateNatRuleOutput: r.Request.Data.(*NiftyCreateNatRuleOutput),
		response:                 &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// NiftyCreateNatRuleResponse is the response type for the
// NiftyCreateNatRule API operation.
type NiftyCreateNatRuleResponse struct {
	*NiftyCreateNatRuleOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// NiftyCreateNatRule request.
func (r *NiftyCreateNatRuleResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
