// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package hatoba

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type DeleteFirewallGroupsInput struct {
	_ struct{} `type:"structure"`

	Names *string `location:"querystring" locationName:"names" type:"string"`
}

// String returns the string representation
func (s DeleteFirewallGroupsInput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s DeleteFirewallGroupsInput) MarshalFields(e protocol.FieldEncoder) error {
	e.SetValue(protocol.HeaderTarget, "Content-Type", protocol.StringValue("application/json"), protocol.Metadata{})

	if s.Names != nil {
		v := *s.Names

		metadata := protocol.Metadata{}
		e.SetValue(protocol.QueryTarget, "names", protocol.QuotedValue{ValueMarshaler: protocol.StringValue(v)}, metadata)
	}
	return nil
}

type DeleteFirewallGroupsOutput struct {
	_ struct{} `type:"structure"`

	FirewallGroups []FirewallGroupResponse `locationName:"firewallGroups" type:"list"`

	RequestId *string `locationName:"requestId" type:"string"`
}

// String returns the string representation
func (s DeleteFirewallGroupsOutput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s DeleteFirewallGroupsOutput) MarshalFields(e protocol.FieldEncoder) error {
	if s.FirewallGroups != nil {
		v := s.FirewallGroups

		metadata := protocol.Metadata{}
		ls0 := e.List(protocol.BodyTarget, "firewallGroups", metadata)
		ls0.Start()
		for _, v1 := range v {
			ls0.ListAddFields(v1)
		}
		ls0.End()

	}
	if s.RequestId != nil {
		v := *s.RequestId

		metadata := protocol.Metadata{}
		e.SetValue(protocol.BodyTarget, "requestId", protocol.QuotedValue{ValueMarshaler: protocol.StringValue(v)}, metadata)
	}
	return nil
}

const opDeleteFirewallGroups = "DeleteFirewallGroups"

// DeleteFirewallGroupsRequest returns a request value for making API operation for
// NIFCLOUD Hatoba beta.
//
//    // Example sending a request using DeleteFirewallGroupsRequest.
//    req := client.DeleteFirewallGroupsRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/hatoba/DeleteFirewallGroups.htm
func (c *Client) DeleteFirewallGroupsRequest(input *DeleteFirewallGroupsInput) DeleteFirewallGroupsRequest {
	op := &aws.Operation{
		Name:       opDeleteFirewallGroups,
		HTTPMethod: "DELETE",
		HTTPPath:   "/v1/firewallGroups",
	}

	if input == nil {
		input = &DeleteFirewallGroupsInput{}
	}

	req := c.newRequest(op, input, &DeleteFirewallGroupsOutput{})

	return DeleteFirewallGroupsRequest{Request: req, Input: input, Copy: c.DeleteFirewallGroupsRequest}
}

// DeleteFirewallGroupsRequest is the request type for the
// DeleteFirewallGroups API operation.
type DeleteFirewallGroupsRequest struct {
	*aws.Request
	Input *DeleteFirewallGroupsInput
	Copy  func(*DeleteFirewallGroupsInput) DeleteFirewallGroupsRequest
}

// Send marshals and sends the DeleteFirewallGroups API request.
func (r DeleteFirewallGroupsRequest) Send(ctx context.Context) (*DeleteFirewallGroupsResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &DeleteFirewallGroupsResponse{
		DeleteFirewallGroupsOutput: r.Request.Data.(*DeleteFirewallGroupsOutput),
		response:                   &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// DeleteFirewallGroupsResponse is the response type for the
// DeleteFirewallGroups API operation.
type DeleteFirewallGroupsResponse struct {
	*DeleteFirewallGroupsOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// DeleteFirewallGroups request.
func (r *DeleteFirewallGroupsResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
