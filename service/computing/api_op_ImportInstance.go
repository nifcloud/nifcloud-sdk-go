// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type ImportInstanceInput struct {
	_ struct{} `type:"structure"`

	AccountingType AccountingTypeOfImportInstanceRequest `locationName:"AccountingType" type:"string" enum:"true"`

	Architecture *string `locationName:"Architecture" type:"string"`

	Description *string `locationName:"Description" type:"string"`

	DiskImage []RequestDiskImage `locationName:"DiskImage" type:"list"`

	InstanceId *string `locationName:"InstanceId" type:"string"`

	InstanceInitiatedShutdownBehavior *string `locationName:"InstanceInitiatedShutdownBehavior" type:"string"`

	InstanceType InstanceTypeOfImportInstanceRequest `locationName:"InstanceType" type:"string" enum:"true"`

	IpType IpTypeOfImportInstanceRequest `locationName:"IpType" type:"string" enum:"true"`

	Monitoring *RequestMonitoringOfImportInstance `locationName:"Monitoring" type:"structure"`

	NetworkInterface []RequestNetworkInterface `locationName:"NetworkInterface" type:"list"`

	// Ovf is a required field
	Ovf *string `locationName:"Ovf" type:"string" required:"true"`

	Placement *RequestPlacementOfImportInstance `locationName:"Placement" type:"structure"`

	Platform *string `locationName:"Platform" type:"string"`

	PrivateIpAddress *string `locationName:"PrivateIpAddress" type:"string"`

	PublicIp *string `locationName:"PublicIp" type:"string"`

	SecurityGroup []string `locationName:"SecurityGroup" type:"list"`

	SubnetId *string `locationName:"SubnetId" type:"string"`

	UserData *RequestUserDataOfImportInstance `locationName:"UserData" type:"structure"`
}

// String returns the string representation
func (s ImportInstanceInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *ImportInstanceInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "ImportInstanceInput"}

	if s.Ovf == nil {
		invalidParams.Add(aws.NewErrParamRequired("Ovf"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type ImportInstanceOutput struct {
	_ struct{} `type:"structure"`

	ConversionTask *ConversionTask `locationName:"conversionTask" type:"structure"`
}

// String returns the string representation
func (s ImportInstanceOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opImportInstance = "ImportInstance"

// ImportInstanceRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using ImportInstanceRequest.
//    req := client.ImportInstanceRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/ImportInstance.htm
func (c *Client) ImportInstanceRequest(input *ImportInstanceInput) ImportInstanceRequest {
	op := &aws.Operation{
		Name:       opImportInstance,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &ImportInstanceInput{}
	}

	req := c.newRequest(op, input, &ImportInstanceOutput{})

	return ImportInstanceRequest{Request: req, Input: input, Copy: c.ImportInstanceRequest}
}

// ImportInstanceRequest is the request type for the
// ImportInstance API operation.
type ImportInstanceRequest struct {
	*aws.Request
	Input *ImportInstanceInput
	Copy  func(*ImportInstanceInput) ImportInstanceRequest
}

// Send marshals and sends the ImportInstance API request.
func (r ImportInstanceRequest) Send(ctx context.Context) (*ImportInstanceResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &ImportInstanceResponse{
		ImportInstanceOutput: r.Request.Data.(*ImportInstanceOutput),
		response:             &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// ImportInstanceResponse is the response type for the
// ImportInstance API operation.
type ImportInstanceResponse struct {
	*ImportInstanceOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// ImportInstance request.
func (r *ImportInstanceResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
