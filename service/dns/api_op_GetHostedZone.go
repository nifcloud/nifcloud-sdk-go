// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package dns

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type GetHostedZoneInput struct {
	_ struct{} `type:"structure"`

	// ZoneID is a required field
	ZoneID *string `location:"uri" locationName:"ZoneID" type:"string" required:"true"`
}

// String returns the string representation
func (s GetHostedZoneInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *GetHostedZoneInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "GetHostedZoneInput"}

	if s.ZoneID == nil {
		invalidParams.Add(aws.NewErrParamRequired("ZoneID"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s GetHostedZoneInput) MarshalFields(e protocol.FieldEncoder) error {

	if s.ZoneID != nil {
		v := *s.ZoneID

		metadata := protocol.Metadata{}
		e.SetValue(protocol.PathTarget, "ZoneID", protocol.StringValue(v), metadata)
	}
	return nil
}

type GetHostedZoneOutput struct {
	_ struct{} `type:"structure"`

	DelegationSet *DelegationSet `locationName:"DelegationSet" type:"structure"`

	HostedZone *HostedZone `locationName:"HostedZone" type:"structure"`
}

// String returns the string representation
func (s GetHostedZoneOutput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s GetHostedZoneOutput) MarshalFields(e protocol.FieldEncoder) error {
	if s.DelegationSet != nil {
		v := s.DelegationSet

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "DelegationSet", v, metadata)
	}
	if s.HostedZone != nil {
		v := s.HostedZone

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "HostedZone", v, metadata)
	}
	return nil
}

const opGetHostedZone = "GetHostedZone"

// GetHostedZoneRequest returns a request value for making API operation for
// NIFCLOUD DNS.
//
//    // Example sending a request using GetHostedZoneRequest.
//    req := client.GetHostedZoneRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/dns/GetHostedZone.htm
func (c *Client) GetHostedZoneRequest(input *GetHostedZoneInput) GetHostedZoneRequest {
	op := &aws.Operation{
		Name:       opGetHostedZone,
		HTTPMethod: "GET",
		HTTPPath:   "/2012-12-12N2013-12-16/hostedzone/{ZoneID}",
	}

	if input == nil {
		input = &GetHostedZoneInput{}
	}

	req := c.newRequest(op, input, &GetHostedZoneOutput{})

	return GetHostedZoneRequest{Request: req, Input: input, Copy: c.GetHostedZoneRequest}
}

// GetHostedZoneRequest is the request type for the
// GetHostedZone API operation.
type GetHostedZoneRequest struct {
	*aws.Request
	Input *GetHostedZoneInput
	Copy  func(*GetHostedZoneInput) GetHostedZoneRequest
}

// Send marshals and sends the GetHostedZone API request.
func (r GetHostedZoneRequest) Send(ctx context.Context) (*GetHostedZoneResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &GetHostedZoneResponse{
		GetHostedZoneOutput: r.Request.Data.(*GetHostedZoneOutput),
		response:            &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// GetHostedZoneResponse is the response type for the
// GetHostedZone API operation.
type GetHostedZoneResponse struct {
	*GetHostedZoneOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// GetHostedZone request.
func (r *GetHostedZoneResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}