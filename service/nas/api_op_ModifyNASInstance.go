// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package nas

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type ModifyNASInstanceInput struct {
	_ struct{} `type:"structure"`

	AllocatedStorage *int64 `locationName:"AllocatedStorage" type:"integer"`

	AuthenticationType *int64 `locationName:"AuthenticationType" type:"integer"`

	DirectoryServiceAdministratorName *string `locationName:"DirectoryServiceAdministratorName" type:"string"`

	DirectoryServiceAdministratorPassword *string `locationName:"DirectoryServiceAdministratorPassword" type:"string"`

	DirectoryServiceDomainName *string `locationName:"DirectoryServiceDomainName" type:"string"`

	DomainControllers []RequestDomainControllers `locationName:"DomainControllers" locationNameList:"member" type:"list"`

	MasterPrivateAddress *string `locationName:"MasterPrivateAddress" type:"string"`

	MasterUserPassword *string `locationName:"MasterUserPassword" type:"string"`

	NASInstanceDescription *string `locationName:"NASInstanceDescription" type:"string"`

	// NASInstanceIdentifier is a required field
	NASInstanceIdentifier *string `locationName:"NASInstanceIdentifier" type:"string" required:"true"`

	NASSecurityGroups []string `locationName:"NASSecurityGroups" locationNameList:"member" type:"list"`

	NetworkId *string `locationName:"NetworkId" type:"string"`

	NewNASInstanceIdentifier *string `locationName:"NewNASInstanceIdentifier" type:"string"`

	NoRootSquash *string `locationName:"NoRootSquash" type:"string"`
}

// String returns the string representation
func (s ModifyNASInstanceInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *ModifyNASInstanceInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "ModifyNASInstanceInput"}

	if s.NASInstanceIdentifier == nil {
		invalidParams.Add(aws.NewErrParamRequired("NASInstanceIdentifier"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type ModifyNASInstanceOutput struct {
	_ struct{} `type:"structure"`

	NASInstance *NASInstance `type:"structure"`
}

// String returns the string representation
func (s ModifyNASInstanceOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opModifyNASInstance = "ModifyNASInstance"

// ModifyNASInstanceRequest returns a request value for making API operation for
// NIFCLOUD NAS.
//
//    // Example sending a request using ModifyNASInstanceRequest.
//    req := client.ModifyNASInstanceRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/nas/ModifyNASInstance.htm
func (c *Client) ModifyNASInstanceRequest(input *ModifyNASInstanceInput) ModifyNASInstanceRequest {
	op := &aws.Operation{
		Name:       opModifyNASInstance,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &ModifyNASInstanceInput{}
	}

	req := c.newRequest(op, input, &ModifyNASInstanceOutput{})

	return ModifyNASInstanceRequest{Request: req, Input: input, Copy: c.ModifyNASInstanceRequest}
}

// ModifyNASInstanceRequest is the request type for the
// ModifyNASInstance API operation.
type ModifyNASInstanceRequest struct {
	*aws.Request
	Input *ModifyNASInstanceInput
	Copy  func(*ModifyNASInstanceInput) ModifyNASInstanceRequest
}

// Send marshals and sends the ModifyNASInstance API request.
func (r ModifyNASInstanceRequest) Send(ctx context.Context) (*ModifyNASInstanceResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &ModifyNASInstanceResponse{
		ModifyNASInstanceOutput: r.Request.Data.(*ModifyNASInstanceOutput),
		response:                &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// ModifyNASInstanceResponse is the response type for the
// ModifyNASInstance API operation.
type ModifyNASInstanceResponse struct {
	*ModifyNASInstanceOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// ModifyNASInstance request.
func (r *ModifyNASInstanceResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
