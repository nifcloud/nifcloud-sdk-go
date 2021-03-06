// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package nas

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type UpgradeNASInstanceInput struct {
	_ struct{} `type:"structure"`

	// NASInstanceIdentifier is a required field
	NASInstanceIdentifier *string `locationName:"NASInstanceIdentifier" type:"string" required:"true"`
}

// String returns the string representation
func (s UpgradeNASInstanceInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *UpgradeNASInstanceInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "UpgradeNASInstanceInput"}

	if s.NASInstanceIdentifier == nil {
		invalidParams.Add(aws.NewErrParamRequired("NASInstanceIdentifier"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type UpgradeNASInstanceOutput struct {
	_ struct{} `type:"structure"`

	NASInstance *NASInstance `type:"structure"`
}

// String returns the string representation
func (s UpgradeNASInstanceOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opUpgradeNASInstance = "UpgradeNASInstance"

// UpgradeNASInstanceRequest returns a request value for making API operation for
// NIFCLOUD NAS.
//
//    // Example sending a request using UpgradeNASInstanceRequest.
//    req := client.UpgradeNASInstanceRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/nas/UpgradeNASInstance.htm
func (c *Client) UpgradeNASInstanceRequest(input *UpgradeNASInstanceInput) UpgradeNASInstanceRequest {
	op := &aws.Operation{
		Name:       opUpgradeNASInstance,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &UpgradeNASInstanceInput{}
	}

	req := c.newRequest(op, input, &UpgradeNASInstanceOutput{})

	return UpgradeNASInstanceRequest{Request: req, Input: input, Copy: c.UpgradeNASInstanceRequest}
}

// UpgradeNASInstanceRequest is the request type for the
// UpgradeNASInstance API operation.
type UpgradeNASInstanceRequest struct {
	*aws.Request
	Input *UpgradeNASInstanceInput
	Copy  func(*UpgradeNASInstanceInput) UpgradeNASInstanceRequest
}

// Send marshals and sends the UpgradeNASInstance API request.
func (r UpgradeNASInstanceRequest) Send(ctx context.Context) (*UpgradeNASInstanceResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &UpgradeNASInstanceResponse{
		UpgradeNASInstanceOutput: r.Request.Data.(*UpgradeNASInstanceOutput),
		response:                 &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// UpgradeNASInstanceResponse is the response type for the
// UpgradeNASInstance API operation.
type UpgradeNASInstanceResponse struct {
	*UpgradeNASInstanceOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// UpgradeNASInstance request.
func (r *UpgradeNASInstanceResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
