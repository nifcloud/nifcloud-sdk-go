// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package hatoba

import (
	"context"
	"fmt"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type AuthorizeFirewallGroupInput struct {
	_ struct{} `type:"structure"`

	// FirewallGroupName is a required field
	FirewallGroupName *string `location:"uri" locationName:"firewall_group_name" type:"string" required:"true"`

	// Rules is a required field
	Rules []RequestRules `locationName:"rules" type:"list" required:"true"`
}

// String returns the string representation
func (s AuthorizeFirewallGroupInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *AuthorizeFirewallGroupInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "AuthorizeFirewallGroupInput"}

	if s.FirewallGroupName == nil {
		invalidParams.Add(aws.NewErrParamRequired("FirewallGroupName"))
	}

	if s.Rules == nil {
		invalidParams.Add(aws.NewErrParamRequired("Rules"))
	}
	if s.Rules != nil {
		for i, v := range s.Rules {
			if err := v.Validate(); err != nil {
				invalidParams.AddNested(fmt.Sprintf("%s[%v]", "Rules", i), err.(aws.ErrInvalidParams))
			}
		}
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s AuthorizeFirewallGroupInput) MarshalFields(e protocol.FieldEncoder) error {
	e.SetValue(protocol.HeaderTarget, "Content-Type", protocol.StringValue("application/json"), protocol.Metadata{})

	if s.Rules != nil {
		v := s.Rules

		metadata := protocol.Metadata{}
		ls0 := e.List(protocol.BodyTarget, "rules", metadata)
		ls0.Start()
		for _, v1 := range v {
			ls0.ListAddFields(v1)
		}
		ls0.End()

	}
	if s.FirewallGroupName != nil {
		v := *s.FirewallGroupName

		metadata := protocol.Metadata{}
		e.SetValue(protocol.PathTarget, "firewall_group_name", protocol.QuotedValue{ValueMarshaler: protocol.StringValue(v)}, metadata)
	}
	return nil
}

type AuthorizeFirewallGroupOutput struct {
	_ struct{} `type:"structure"`

	FirewallGroup *FirewallGroup `locationName:"firewallGroup" type:"structure"`
}

// String returns the string representation
func (s AuthorizeFirewallGroupOutput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s AuthorizeFirewallGroupOutput) MarshalFields(e protocol.FieldEncoder) error {
	if s.FirewallGroup != nil {
		v := s.FirewallGroup

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "firewallGroup", v, metadata)
	}
	return nil
}

const opAuthorizeFirewallGroup = "AuthorizeFirewallGroup"

// AuthorizeFirewallGroupRequest returns a request value for making API operation for
// NIFCLOUD Kubernetes Service Hatoba.
//
//    // Example sending a request using AuthorizeFirewallGroupRequest.
//    req := client.AuthorizeFirewallGroupRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/hatoba/AuthorizeFirewallGroup.htm
func (c *Client) AuthorizeFirewallGroupRequest(input *AuthorizeFirewallGroupInput) AuthorizeFirewallGroupRequest {
	op := &aws.Operation{
		Name:       opAuthorizeFirewallGroup,
		HTTPMethod: "POST",
		HTTPPath:   "/v1/firewallGroups/{firewall_group_name}/rules",
	}

	if input == nil {
		input = &AuthorizeFirewallGroupInput{}
	}

	req := c.newRequest(op, input, &AuthorizeFirewallGroupOutput{})

	return AuthorizeFirewallGroupRequest{Request: req, Input: input, Copy: c.AuthorizeFirewallGroupRequest}
}

// AuthorizeFirewallGroupRequest is the request type for the
// AuthorizeFirewallGroup API operation.
type AuthorizeFirewallGroupRequest struct {
	*aws.Request
	Input *AuthorizeFirewallGroupInput
	Copy  func(*AuthorizeFirewallGroupInput) AuthorizeFirewallGroupRequest
}

// Send marshals and sends the AuthorizeFirewallGroup API request.
func (r AuthorizeFirewallGroupRequest) Send(ctx context.Context) (*AuthorizeFirewallGroupResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &AuthorizeFirewallGroupResponse{
		AuthorizeFirewallGroupOutput: r.Request.Data.(*AuthorizeFirewallGroupOutput),
		response:                     &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// AuthorizeFirewallGroupResponse is the response type for the
// AuthorizeFirewallGroup API operation.
type AuthorizeFirewallGroupResponse struct {
	*AuthorizeFirewallGroupOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// AuthorizeFirewallGroup request.
func (r *AuthorizeFirewallGroupResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
