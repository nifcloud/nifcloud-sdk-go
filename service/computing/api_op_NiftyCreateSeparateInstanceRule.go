// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type NiftyCreateSeparateInstanceRuleInput struct {
	_ struct{} `type:"structure"`

	InstanceId []string `locationName:"InstanceId" type:"list"`

	InstanceUniqueId []string `locationName:"InstanceUniqueId" type:"list"`

	// Placement is a required field
	Placement *RequestPlacementOfNiftyCreateSeparateInstanceRule `locationName:"Placement" type:"structure" required:"true"`

	SeparateInstanceRuleDescription *string `locationName:"SeparateInstanceRuleDescription" type:"string"`

	SeparateInstanceRuleName *string `locationName:"SeparateInstanceRuleName" type:"string"`
}

// String returns the string representation
func (s NiftyCreateSeparateInstanceRuleInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *NiftyCreateSeparateInstanceRuleInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "NiftyCreateSeparateInstanceRuleInput"}

	if s.Placement == nil {
		invalidParams.Add(aws.NewErrParamRequired("Placement"))
	}
	if s.Placement != nil {
		if err := s.Placement.Validate(); err != nil {
			invalidParams.AddNested("Placement", err.(aws.ErrInvalidParams))
		}
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type NiftyCreateSeparateInstanceRuleOutput struct {
	_ struct{} `type:"structure"`

	RequestId *string `locationName:"requestId" type:"string"`

	Return *string `locationName:"return" type:"string"`
}

// String returns the string representation
func (s NiftyCreateSeparateInstanceRuleOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opNiftyCreateSeparateInstanceRule = "NiftyCreateSeparateInstanceRule"

// NiftyCreateSeparateInstanceRuleRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using NiftyCreateSeparateInstanceRuleRequest.
//    req := client.NiftyCreateSeparateInstanceRuleRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/NiftyCreateSeparateInstanceRule.htm
func (c *Client) NiftyCreateSeparateInstanceRuleRequest(input *NiftyCreateSeparateInstanceRuleInput) NiftyCreateSeparateInstanceRuleRequest {
	op := &aws.Operation{
		Name:       opNiftyCreateSeparateInstanceRule,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &NiftyCreateSeparateInstanceRuleInput{}
	}

	req := c.newRequest(op, input, &NiftyCreateSeparateInstanceRuleOutput{})

	return NiftyCreateSeparateInstanceRuleRequest{Request: req, Input: input, Copy: c.NiftyCreateSeparateInstanceRuleRequest}
}

// NiftyCreateSeparateInstanceRuleRequest is the request type for the
// NiftyCreateSeparateInstanceRule API operation.
type NiftyCreateSeparateInstanceRuleRequest struct {
	*aws.Request
	Input *NiftyCreateSeparateInstanceRuleInput
	Copy  func(*NiftyCreateSeparateInstanceRuleInput) NiftyCreateSeparateInstanceRuleRequest
}

// Send marshals and sends the NiftyCreateSeparateInstanceRule API request.
func (r NiftyCreateSeparateInstanceRuleRequest) Send(ctx context.Context) (*NiftyCreateSeparateInstanceRuleResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &NiftyCreateSeparateInstanceRuleResponse{
		NiftyCreateSeparateInstanceRuleOutput: r.Request.Data.(*NiftyCreateSeparateInstanceRuleOutput),
		response:                              &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// NiftyCreateSeparateInstanceRuleResponse is the response type for the
// NiftyCreateSeparateInstanceRule API operation.
type NiftyCreateSeparateInstanceRuleResponse struct {
	*NiftyCreateSeparateInstanceRuleOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// NiftyCreateSeparateInstanceRule request.
func (r *NiftyCreateSeparateInstanceRuleResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
