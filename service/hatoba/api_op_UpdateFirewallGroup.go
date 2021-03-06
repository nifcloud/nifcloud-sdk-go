// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package hatoba

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type UpdateFirewallGroupInput struct {
	_ struct{} `type:"structure"`

	// FirewallGroup is a required field
	FirewallGroup *UpdateFirewallGroupRequestFirewallGroup `locationName:"firewallGroup" type:"structure" required:"true"`

	// FirewallGroupName is a required field
	FirewallGroupName *string `location:"uri" locationName:"FirewallGroupName" type:"string" required:"true"`
}

// String returns the string representation
func (s UpdateFirewallGroupInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *UpdateFirewallGroupInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "UpdateFirewallGroupInput"}

	if s.FirewallGroup == nil {
		invalidParams.Add(aws.NewErrParamRequired("FirewallGroup"))
	}

	if s.FirewallGroupName == nil {
		invalidParams.Add(aws.NewErrParamRequired("FirewallGroupName"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s UpdateFirewallGroupInput) MarshalFields(e protocol.FieldEncoder) error {
	e.SetValue(protocol.HeaderTarget, "Content-Type", protocol.StringValue("application/json"), protocol.Metadata{})

	if s.FirewallGroup != nil {
		v := s.FirewallGroup

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "firewallGroup", v, metadata)
	}
	if s.FirewallGroupName != nil {
		v := *s.FirewallGroupName

		metadata := protocol.Metadata{}
		e.SetValue(protocol.PathTarget, "FirewallGroupName", protocol.QuotedValue{ValueMarshaler: protocol.StringValue(v)}, metadata)
	}
	return nil
}

type UpdateFirewallGroupOutput struct {
	_ struct{} `type:"structure"`

	FirewallGroup *FirewallGroupResponse `locationName:"firewallGroup" type:"structure"`

	RequestId *string `locationName:"requestId" type:"string"`
}

// String returns the string representation
func (s UpdateFirewallGroupOutput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s UpdateFirewallGroupOutput) MarshalFields(e protocol.FieldEncoder) error {
	if s.FirewallGroup != nil {
		v := s.FirewallGroup

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "firewallGroup", v, metadata)
	}
	if s.RequestId != nil {
		v := *s.RequestId

		metadata := protocol.Metadata{}
		e.SetValue(protocol.BodyTarget, "requestId", protocol.QuotedValue{ValueMarshaler: protocol.StringValue(v)}, metadata)
	}
	return nil
}

const opUpdateFirewallGroup = "UpdateFirewallGroup"

// UpdateFirewallGroupRequest returns a request value for making API operation for
// NIFCLOUD Hatoba beta.
//
//    // Example sending a request using UpdateFirewallGroupRequest.
//    req := client.UpdateFirewallGroupRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/hatoba/UpdateFirewallGroup.htm
func (c *Client) UpdateFirewallGroupRequest(input *UpdateFirewallGroupInput) UpdateFirewallGroupRequest {
	op := &aws.Operation{
		Name:       opUpdateFirewallGroup,
		HTTPMethod: "PUT",
		HTTPPath:   "/v1/firewallGroups/{FirewallGroupName}",
	}

	if input == nil {
		input = &UpdateFirewallGroupInput{}
	}

	req := c.newRequest(op, input, &UpdateFirewallGroupOutput{})

	return UpdateFirewallGroupRequest{Request: req, Input: input, Copy: c.UpdateFirewallGroupRequest}
}

// UpdateFirewallGroupRequest is the request type for the
// UpdateFirewallGroup API operation.
type UpdateFirewallGroupRequest struct {
	*aws.Request
	Input *UpdateFirewallGroupInput
	Copy  func(*UpdateFirewallGroupInput) UpdateFirewallGroupRequest
}

// Send marshals and sends the UpdateFirewallGroup API request.
func (r UpdateFirewallGroupRequest) Send(ctx context.Context) (*UpdateFirewallGroupResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &UpdateFirewallGroupResponse{
		UpdateFirewallGroupOutput: r.Request.Data.(*UpdateFirewallGroupOutput),
		response:                  &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// UpdateFirewallGroupResponse is the response type for the
// UpdateFirewallGroup API operation.
type UpdateFirewallGroupResponse struct {
	*UpdateFirewallGroupOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// UpdateFirewallGroup request.
func (r *UpdateFirewallGroupResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
