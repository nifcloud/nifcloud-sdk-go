// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package nas

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type CreateNASSecurityGroupInput struct {
	_ struct{} `type:"structure"`

	// AvailabilityZone is a required field
	AvailabilityZone *string `locationName:"AvailabilityZone" type:"string" required:"true"`

	NASSecurityGroupDescription *string `locationName:"NASSecurityGroupDescription" type:"string"`

	// NASSecurityGroupName is a required field
	NASSecurityGroupName *string `locationName:"NASSecurityGroupName" type:"string" required:"true"`
}

// String returns the string representation
func (s CreateNASSecurityGroupInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *CreateNASSecurityGroupInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "CreateNASSecurityGroupInput"}

	if s.AvailabilityZone == nil {
		invalidParams.Add(aws.NewErrParamRequired("AvailabilityZone"))
	}

	if s.NASSecurityGroupName == nil {
		invalidParams.Add(aws.NewErrParamRequired("NASSecurityGroupName"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type CreateNASSecurityGroupOutput struct {
	_ struct{} `type:"structure"`

	NASSecurityGroup *NASSecurityGroup `type:"structure"`
}

// String returns the string representation
func (s CreateNASSecurityGroupOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opCreateNASSecurityGroup = "CreateNASSecurityGroup"

// CreateNASSecurityGroupRequest returns a request value for making API operation for
// NIFCLOUD NAS.
//
//    // Example sending a request using CreateNASSecurityGroupRequest.
//    req := client.CreateNASSecurityGroupRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/nas/CreateNASSecurityGroup.htm
func (c *Client) CreateNASSecurityGroupRequest(input *CreateNASSecurityGroupInput) CreateNASSecurityGroupRequest {
	op := &aws.Operation{
		Name:       opCreateNASSecurityGroup,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &CreateNASSecurityGroupInput{}
	}

	req := c.newRequest(op, input, &CreateNASSecurityGroupOutput{})

	return CreateNASSecurityGroupRequest{Request: req, Input: input, Copy: c.CreateNASSecurityGroupRequest}
}

// CreateNASSecurityGroupRequest is the request type for the
// CreateNASSecurityGroup API operation.
type CreateNASSecurityGroupRequest struct {
	*aws.Request
	Input *CreateNASSecurityGroupInput
	Copy  func(*CreateNASSecurityGroupInput) CreateNASSecurityGroupRequest
}

// Send marshals and sends the CreateNASSecurityGroup API request.
func (r CreateNASSecurityGroupRequest) Send(ctx context.Context) (*CreateNASSecurityGroupResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &CreateNASSecurityGroupResponse{
		CreateNASSecurityGroupOutput: r.Request.Data.(*CreateNASSecurityGroupOutput),
		response:                     &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// CreateNASSecurityGroupResponse is the response type for the
// CreateNASSecurityGroup API operation.
type CreateNASSecurityGroupResponse struct {
	*CreateNASSecurityGroupOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// CreateNASSecurityGroup request.
func (r *CreateNASSecurityGroupResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
