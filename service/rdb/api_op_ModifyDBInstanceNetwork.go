// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package rdb

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type ModifyDBInstanceNetworkInput struct {
	_ struct{} `type:"structure"`

	// DBInstanceIdentifier is a required field
	DBInstanceIdentifier *string `locationName:"DBInstanceIdentifier" type:"string" required:"true"`

	NiftyMasterPrivateAddress *string `locationName:"NiftyMasterPrivateAddress" type:"string"`

	NiftyNetworkId *string `locationName:"NiftyNetworkId" type:"string"`

	NiftySlavePrivateAddress *string `locationName:"NiftySlavePrivateAddress" type:"string"`

	NiftyVirtualPrivateAddress *string `locationName:"NiftyVirtualPrivateAddress" type:"string"`
}

// String returns the string representation
func (s ModifyDBInstanceNetworkInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *ModifyDBInstanceNetworkInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "ModifyDBInstanceNetworkInput"}

	if s.DBInstanceIdentifier == nil {
		invalidParams.Add(aws.NewErrParamRequired("DBInstanceIdentifier"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type ModifyDBInstanceNetworkOutput struct {
	_ struct{} `type:"structure"`

	DBInstance *DBInstance `locationName:"DBInstance" type:"structure"`

	ResponseMetadata *ResponseMetadata `locationName:"ResponseMetadata" type:"structure"`
}

// String returns the string representation
func (s ModifyDBInstanceNetworkOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opModifyDBInstanceNetwork = "ModifyDBInstanceNetwork"

// ModifyDBInstanceNetworkRequest returns a request value for making API operation for
// NIFCLOUD RDB.
//
//    // Example sending a request using ModifyDBInstanceNetworkRequest.
//    req := client.ModifyDBInstanceNetworkRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rdb/ModifyDBInstanceNetwork.htm
func (c *Client) ModifyDBInstanceNetworkRequest(input *ModifyDBInstanceNetworkInput) ModifyDBInstanceNetworkRequest {
	op := &aws.Operation{
		Name:       opModifyDBInstanceNetwork,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &ModifyDBInstanceNetworkInput{}
	}

	req := c.newRequest(op, input, &ModifyDBInstanceNetworkOutput{})

	return ModifyDBInstanceNetworkRequest{Request: req, Input: input, Copy: c.ModifyDBInstanceNetworkRequest}
}

// ModifyDBInstanceNetworkRequest is the request type for the
// ModifyDBInstanceNetwork API operation.
type ModifyDBInstanceNetworkRequest struct {
	*aws.Request
	Input *ModifyDBInstanceNetworkInput
	Copy  func(*ModifyDBInstanceNetworkInput) ModifyDBInstanceNetworkRequest
}

// Send marshals and sends the ModifyDBInstanceNetwork API request.
func (r ModifyDBInstanceNetworkRequest) Send(ctx context.Context) (*ModifyDBInstanceNetworkResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &ModifyDBInstanceNetworkResponse{
		ModifyDBInstanceNetworkOutput: r.Request.Data.(*ModifyDBInstanceNetworkOutput),
		response:                      &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// ModifyDBInstanceNetworkResponse is the response type for the
// ModifyDBInstanceNetwork API operation.
type ModifyDBInstanceNetworkResponse struct {
	*ModifyDBInstanceNetworkOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// ModifyDBInstanceNetwork request.
func (r *ModifyDBInstanceNetworkResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
