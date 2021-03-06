// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package rdb

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type RevokeDBSecurityGroupIngressInput struct {
	_ struct{} `type:"structure"`

	CIDRIP *string `locationName:"CIDRIP" type:"string"`

	// DBSecurityGroupName is a required field
	DBSecurityGroupName *string `locationName:"DBSecurityGroupName" type:"string" required:"true"`

	EC2SecurityGroupName *string `locationName:"EC2SecurityGroupName" type:"string"`
}

// String returns the string representation
func (s RevokeDBSecurityGroupIngressInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *RevokeDBSecurityGroupIngressInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "RevokeDBSecurityGroupIngressInput"}

	if s.DBSecurityGroupName == nil {
		invalidParams.Add(aws.NewErrParamRequired("DBSecurityGroupName"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type RevokeDBSecurityGroupIngressOutput struct {
	_ struct{} `type:"structure"`

	DBSecurityGroup *DBSecurityGroup `type:"structure"`
}

// String returns the string representation
func (s RevokeDBSecurityGroupIngressOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opRevokeDBSecurityGroupIngress = "RevokeDBSecurityGroupIngress"

// RevokeDBSecurityGroupIngressRequest returns a request value for making API operation for
// NIFCLOUD RDB.
//
//    // Example sending a request using RevokeDBSecurityGroupIngressRequest.
//    req := client.RevokeDBSecurityGroupIngressRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rdb/RevokeDBSecurityGroupIngress.htm
func (c *Client) RevokeDBSecurityGroupIngressRequest(input *RevokeDBSecurityGroupIngressInput) RevokeDBSecurityGroupIngressRequest {
	op := &aws.Operation{
		Name:       opRevokeDBSecurityGroupIngress,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &RevokeDBSecurityGroupIngressInput{}
	}

	req := c.newRequest(op, input, &RevokeDBSecurityGroupIngressOutput{})

	return RevokeDBSecurityGroupIngressRequest{Request: req, Input: input, Copy: c.RevokeDBSecurityGroupIngressRequest}
}

// RevokeDBSecurityGroupIngressRequest is the request type for the
// RevokeDBSecurityGroupIngress API operation.
type RevokeDBSecurityGroupIngressRequest struct {
	*aws.Request
	Input *RevokeDBSecurityGroupIngressInput
	Copy  func(*RevokeDBSecurityGroupIngressInput) RevokeDBSecurityGroupIngressRequest
}

// Send marshals and sends the RevokeDBSecurityGroupIngress API request.
func (r RevokeDBSecurityGroupIngressRequest) Send(ctx context.Context) (*RevokeDBSecurityGroupIngressResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &RevokeDBSecurityGroupIngressResponse{
		RevokeDBSecurityGroupIngressOutput: r.Request.Data.(*RevokeDBSecurityGroupIngressOutput),
		response:                           &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// RevokeDBSecurityGroupIngressResponse is the response type for the
// RevokeDBSecurityGroupIngress API operation.
type RevokeDBSecurityGroupIngressResponse struct {
	*RevokeDBSecurityGroupIngressOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// RevokeDBSecurityGroupIngress request.
func (r *RevokeDBSecurityGroupIngressResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
