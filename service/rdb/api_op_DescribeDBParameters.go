// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package rdb

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type DescribeDBParametersInput struct {
	_ struct{} `type:"structure"`

	// DBParameterGroupName is a required field
	DBParameterGroupName *string `locationName:"DBParameterGroupName" type:"string" required:"true"`

	Marker *string `locationName:"Marker" type:"string"`

	MaxRecords *int64 `locationName:"MaxRecords" type:"integer"`

	Source *string `locationName:"Source" type:"string"`
}

// String returns the string representation
func (s DescribeDBParametersInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *DescribeDBParametersInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "DescribeDBParametersInput"}

	if s.DBParameterGroupName == nil {
		invalidParams.Add(aws.NewErrParamRequired("DBParameterGroupName"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type DescribeDBParametersOutput struct {
	_ struct{} `type:"structure"`

	Marker *string `type:"string"`

	Parameters []Parameter `locationNameList:"Parameter" type:"list"`
}

// String returns the string representation
func (s DescribeDBParametersOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opDescribeDBParameters = "DescribeDBParameters"

// DescribeDBParametersRequest returns a request value for making API operation for
// NIFCLOUD RDB.
//
//    // Example sending a request using DescribeDBParametersRequest.
//    req := client.DescribeDBParametersRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rdb/DescribeDBParameters.htm
func (c *Client) DescribeDBParametersRequest(input *DescribeDBParametersInput) DescribeDBParametersRequest {
	op := &aws.Operation{
		Name:       opDescribeDBParameters,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &DescribeDBParametersInput{}
	}

	req := c.newRequest(op, input, &DescribeDBParametersOutput{})

	return DescribeDBParametersRequest{Request: req, Input: input, Copy: c.DescribeDBParametersRequest}
}

// DescribeDBParametersRequest is the request type for the
// DescribeDBParameters API operation.
type DescribeDBParametersRequest struct {
	*aws.Request
	Input *DescribeDBParametersInput
	Copy  func(*DescribeDBParametersInput) DescribeDBParametersRequest
}

// Send marshals and sends the DescribeDBParameters API request.
func (r DescribeDBParametersRequest) Send(ctx context.Context) (*DescribeDBParametersResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &DescribeDBParametersResponse{
		DescribeDBParametersOutput: r.Request.Data.(*DescribeDBParametersOutput),
		response:                   &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// DescribeDBParametersResponse is the response type for the
// DescribeDBParameters API operation.
type DescribeDBParametersResponse struct {
	*DescribeDBParametersOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// DescribeDBParameters request.
func (r *DescribeDBParametersResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
