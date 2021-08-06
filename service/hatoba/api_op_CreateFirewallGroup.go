// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package hatoba

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type CreateFirewallGroupInput struct {
	_ struct{} `type:"structure"`

	// FirewallGroup is a required field
	FirewallGroup *RequestFirewallGroup `locationName:"firewallGroup" type:"structure" required:"true"`
}

// String returns the string representation
func (s CreateFirewallGroupInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *CreateFirewallGroupInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "CreateFirewallGroupInput"}

	if s.FirewallGroup == nil {
		invalidParams.Add(aws.NewErrParamRequired("FirewallGroup"))
	}
	if s.FirewallGroup != nil {
		if err := s.FirewallGroup.Validate(); err != nil {
			invalidParams.AddNested("FirewallGroup", err.(aws.ErrInvalidParams))
		}
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s CreateFirewallGroupInput) MarshalFields(e protocol.FieldEncoder) error {
	e.SetValue(protocol.HeaderTarget, "Content-Type", protocol.StringValue("application/json"), protocol.Metadata{})

	if s.FirewallGroup != nil {
		v := s.FirewallGroup

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "firewallGroup", v, metadata)
	}
	return nil
}

type CreateFirewallGroupOutput struct {
	_ struct{} `type:"structure"`

	FirewallGroup *FirewallGroup `locationName:"firewallGroup" type:"structure"`
}

// String returns the string representation
func (s CreateFirewallGroupOutput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s CreateFirewallGroupOutput) MarshalFields(e protocol.FieldEncoder) error {
	if s.FirewallGroup != nil {
		v := s.FirewallGroup

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "firewallGroup", v, metadata)
	}
	return nil
}

const opCreateFirewallGroup = "CreateFirewallGroup"

// CreateFirewallGroupRequest returns a request value for making API operation for
// NIFCLOUD Kubernetes Service Hatoba.
//
//    // Example sending a request using CreateFirewallGroupRequest.
//    req := client.CreateFirewallGroupRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/hatoba/CreateFirewallGroup.htm
func (c *Client) CreateFirewallGroupRequest(input *CreateFirewallGroupInput) CreateFirewallGroupRequest {
	op := &aws.Operation{
		Name:       opCreateFirewallGroup,
		HTTPMethod: "POST",
		HTTPPath:   "/v1/firewallGroups",
	}

	if input == nil {
		input = &CreateFirewallGroupInput{}
	}

	req := c.newRequest(op, input, &CreateFirewallGroupOutput{})

	return CreateFirewallGroupRequest{Request: req, Input: input, Copy: c.CreateFirewallGroupRequest}
}

// CreateFirewallGroupRequest is the request type for the
// CreateFirewallGroup API operation.
type CreateFirewallGroupRequest struct {
	*aws.Request
	Input *CreateFirewallGroupInput
	Copy  func(*CreateFirewallGroupInput) CreateFirewallGroupRequest
}

// Send marshals and sends the CreateFirewallGroup API request.
func (r CreateFirewallGroupRequest) Send(ctx context.Context) (*CreateFirewallGroupResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &CreateFirewallGroupResponse{
		CreateFirewallGroupOutput: r.Request.Data.(*CreateFirewallGroupOutput),
		response:                  &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// CreateFirewallGroupResponse is the response type for the
// CreateFirewallGroup API operation.
type CreateFirewallGroupResponse struct {
	*CreateFirewallGroupOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// CreateFirewallGroup request.
func (r *CreateFirewallGroupResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
