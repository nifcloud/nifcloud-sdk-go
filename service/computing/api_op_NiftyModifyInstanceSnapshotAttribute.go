// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type NiftyModifyInstanceSnapshotAttributeInput struct {
	_ struct{} `type:"structure"`

	// Attribute is a required field
	Attribute AttributeOfNiftyModifyInstanceSnapshotAttributeRequest `locationName:"Attribute" type:"string" required:"true" enum:"true"`

	InstanceSnapshotId *string `locationName:"InstanceSnapshotId" type:"string"`

	SnapshotName *string `locationName:"SnapshotName" type:"string"`

	// Value is a required field
	Value *string `locationName:"Value" type:"string" required:"true"`
}

// String returns the string representation
func (s NiftyModifyInstanceSnapshotAttributeInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *NiftyModifyInstanceSnapshotAttributeInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "NiftyModifyInstanceSnapshotAttributeInput"}
	if len(s.Attribute) == 0 {
		invalidParams.Add(aws.NewErrParamRequired("Attribute"))
	}

	if s.Value == nil {
		invalidParams.Add(aws.NewErrParamRequired("Value"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type NiftyModifyInstanceSnapshotAttributeOutput struct {
	_ struct{} `type:"structure"`

	RequestId *string `locationName:"requestId" type:"string"`

	Return *bool `locationName:"return" type:"boolean"`
}

// String returns the string representation
func (s NiftyModifyInstanceSnapshotAttributeOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opNiftyModifyInstanceSnapshotAttribute = "NiftyModifyInstanceSnapshotAttribute"

// NiftyModifyInstanceSnapshotAttributeRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using NiftyModifyInstanceSnapshotAttributeRequest.
//    req := client.NiftyModifyInstanceSnapshotAttributeRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/NiftyModifyInstanceSnapshotAttribute.htm
func (c *Client) NiftyModifyInstanceSnapshotAttributeRequest(input *NiftyModifyInstanceSnapshotAttributeInput) NiftyModifyInstanceSnapshotAttributeRequest {
	op := &aws.Operation{
		Name:       opNiftyModifyInstanceSnapshotAttribute,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &NiftyModifyInstanceSnapshotAttributeInput{}
	}

	req := c.newRequest(op, input, &NiftyModifyInstanceSnapshotAttributeOutput{})

	return NiftyModifyInstanceSnapshotAttributeRequest{Request: req, Input: input, Copy: c.NiftyModifyInstanceSnapshotAttributeRequest}
}

// NiftyModifyInstanceSnapshotAttributeRequest is the request type for the
// NiftyModifyInstanceSnapshotAttribute API operation.
type NiftyModifyInstanceSnapshotAttributeRequest struct {
	*aws.Request
	Input *NiftyModifyInstanceSnapshotAttributeInput
	Copy  func(*NiftyModifyInstanceSnapshotAttributeInput) NiftyModifyInstanceSnapshotAttributeRequest
}

// Send marshals and sends the NiftyModifyInstanceSnapshotAttribute API request.
func (r NiftyModifyInstanceSnapshotAttributeRequest) Send(ctx context.Context) (*NiftyModifyInstanceSnapshotAttributeResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &NiftyModifyInstanceSnapshotAttributeResponse{
		NiftyModifyInstanceSnapshotAttributeOutput: r.Request.Data.(*NiftyModifyInstanceSnapshotAttributeOutput),
		response: &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// NiftyModifyInstanceSnapshotAttributeResponse is the response type for the
// NiftyModifyInstanceSnapshotAttribute API operation.
type NiftyModifyInstanceSnapshotAttributeResponse struct {
	*NiftyModifyInstanceSnapshotAttributeOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// NiftyModifyInstanceSnapshotAttribute request.
func (r *NiftyModifyInstanceSnapshotAttributeResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
