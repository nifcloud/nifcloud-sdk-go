// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type ExtendVolumeSizeInput struct {
	_ struct{} `type:"structure"`

	NiftyReboot NiftyRebootOfExtendVolumeSizeRequest `locationName:"NiftyReboot" type:"string" enum:"true"`

	// VolumeId is a required field
	VolumeId *string `locationName:"VolumeId" type:"string" required:"true"`
}

// String returns the string representation
func (s ExtendVolumeSizeInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *ExtendVolumeSizeInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "ExtendVolumeSizeInput"}

	if s.VolumeId == nil {
		invalidParams.Add(aws.NewErrParamRequired("VolumeId"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type ExtendVolumeSizeOutput struct {
	_ struct{} `type:"structure"`

	RequestId *string `locationName:"requestId" type:"string"`

	Return *string `locationName:"return" type:"string"`
}

// String returns the string representation
func (s ExtendVolumeSizeOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opExtendVolumeSize = "ExtendVolumeSize"

// ExtendVolumeSizeRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using ExtendVolumeSizeRequest.
//    req := client.ExtendVolumeSizeRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/ExtendVolumeSize.htm
func (c *Client) ExtendVolumeSizeRequest(input *ExtendVolumeSizeInput) ExtendVolumeSizeRequest {
	op := &aws.Operation{
		Name:       opExtendVolumeSize,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &ExtendVolumeSizeInput{}
	}

	req := c.newRequest(op, input, &ExtendVolumeSizeOutput{})

	return ExtendVolumeSizeRequest{Request: req, Input: input, Copy: c.ExtendVolumeSizeRequest}
}

// ExtendVolumeSizeRequest is the request type for the
// ExtendVolumeSize API operation.
type ExtendVolumeSizeRequest struct {
	*aws.Request
	Input *ExtendVolumeSizeInput
	Copy  func(*ExtendVolumeSizeInput) ExtendVolumeSizeRequest
}

// Send marshals and sends the ExtendVolumeSize API request.
func (r ExtendVolumeSizeRequest) Send(ctx context.Context) (*ExtendVolumeSizeResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &ExtendVolumeSizeResponse{
		ExtendVolumeSizeOutput: r.Request.Data.(*ExtendVolumeSizeOutput),
		response:               &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// ExtendVolumeSizeResponse is the response type for the
// ExtendVolumeSize API operation.
type ExtendVolumeSizeResponse struct {
	*ExtendVolumeSizeOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// ExtendVolumeSize request.
func (r *ExtendVolumeSizeResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
