// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package rdb

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type ResetDBParameterGroupInput struct {
	_ struct{} `type:"structure"`

	// DBParameterGroupName is a required field
	DBParameterGroupName *string `locationName:"DBParameterGroupName" type:"string" required:"true"`

	Parameters []RequestParametersOfResetDBParameterGroup `locationName:"Parameters" locationNameList:"member" type:"list"`

	ResetAllParameters *bool `locationName:"ResetAllParameters" type:"boolean"`
}

// String returns the string representation
func (s ResetDBParameterGroupInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *ResetDBParameterGroupInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "ResetDBParameterGroupInput"}

	if s.DBParameterGroupName == nil {
		invalidParams.Add(aws.NewErrParamRequired("DBParameterGroupName"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type ResetDBParameterGroupOutput struct {
	_ struct{} `type:"structure"`

	DBParameterGroupName *string `type:"string"`
}

// String returns the string representation
func (s ResetDBParameterGroupOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opResetDBParameterGroup = "ResetDBParameterGroup"

// ResetDBParameterGroupRequest returns a request value for making API operation for
// NIFCLOUD RDB.
//
//    // Example sending a request using ResetDBParameterGroupRequest.
//    req := client.ResetDBParameterGroupRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rdb/ResetDBParameterGroup.htm
func (c *Client) ResetDBParameterGroupRequest(input *ResetDBParameterGroupInput) ResetDBParameterGroupRequest {
	op := &aws.Operation{
		Name:       opResetDBParameterGroup,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &ResetDBParameterGroupInput{}
	}

	req := c.newRequest(op, input, &ResetDBParameterGroupOutput{})

	return ResetDBParameterGroupRequest{Request: req, Input: input, Copy: c.ResetDBParameterGroupRequest}
}

// ResetDBParameterGroupRequest is the request type for the
// ResetDBParameterGroup API operation.
type ResetDBParameterGroupRequest struct {
	*aws.Request
	Input *ResetDBParameterGroupInput
	Copy  func(*ResetDBParameterGroupInput) ResetDBParameterGroupRequest
}

// Send marshals and sends the ResetDBParameterGroup API request.
func (r ResetDBParameterGroupRequest) Send(ctx context.Context) (*ResetDBParameterGroupResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &ResetDBParameterGroupResponse{
		ResetDBParameterGroupOutput: r.Request.Data.(*ResetDBParameterGroupOutput),
		response:                    &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// ResetDBParameterGroupResponse is the response type for the
// ResetDBParameterGroup API operation.
type ResetDBParameterGroupResponse struct {
	*ResetDBParameterGroupOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// ResetDBParameterGroup request.
func (r *ResetDBParameterGroupResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
