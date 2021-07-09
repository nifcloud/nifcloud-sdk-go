// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package rdb

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type DescribeEngineDefaultParametersInput struct {
	_ struct{} `type:"structure"`

	// DBParameterGroupFamily is a required field
	DBParameterGroupFamily *string `locationName:"DBParameterGroupFamily" type:"string" required:"true"`

	Marker *string `locationName:"Marker" type:"string"`

	MaxRecords *int64 `locationName:"MaxRecords" type:"integer"`
}

// String returns the string representation
func (s DescribeEngineDefaultParametersInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *DescribeEngineDefaultParametersInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "DescribeEngineDefaultParametersInput"}

	if s.DBParameterGroupFamily == nil {
		invalidParams.Add(aws.NewErrParamRequired("DBParameterGroupFamily"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type DescribeEngineDefaultParametersOutput struct {
	_ struct{} `type:"structure"`

	EngineDefaults *EngineDefaults `locationName:"EngineDefaults" type:"structure"`

	ResponseMetadata *ResponseMetadata `locationName:"ResponseMetadata" type:"structure"`
}

// String returns the string representation
func (s DescribeEngineDefaultParametersOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opDescribeEngineDefaultParameters = "DescribeEngineDefaultParameters"

// DescribeEngineDefaultParametersRequest returns a request value for making API operation for
// NIFCLOUD RDB.
//
//    // Example sending a request using DescribeEngineDefaultParametersRequest.
//    req := client.DescribeEngineDefaultParametersRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rdb/DescribeEngineDefaultParameters.htm
func (c *Client) DescribeEngineDefaultParametersRequest(input *DescribeEngineDefaultParametersInput) DescribeEngineDefaultParametersRequest {
	op := &aws.Operation{
		Name:       opDescribeEngineDefaultParameters,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &DescribeEngineDefaultParametersInput{}
	}

	req := c.newRequest(op, input, &DescribeEngineDefaultParametersOutput{})

	return DescribeEngineDefaultParametersRequest{Request: req, Input: input, Copy: c.DescribeEngineDefaultParametersRequest}
}

// DescribeEngineDefaultParametersRequest is the request type for the
// DescribeEngineDefaultParameters API operation.
type DescribeEngineDefaultParametersRequest struct {
	*aws.Request
	Input *DescribeEngineDefaultParametersInput
	Copy  func(*DescribeEngineDefaultParametersInput) DescribeEngineDefaultParametersRequest
}

// Send marshals and sends the DescribeEngineDefaultParameters API request.
func (r DescribeEngineDefaultParametersRequest) Send(ctx context.Context) (*DescribeEngineDefaultParametersResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &DescribeEngineDefaultParametersResponse{
		DescribeEngineDefaultParametersOutput: r.Request.Data.(*DescribeEngineDefaultParametersOutput),
		response:                              &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// DescribeEngineDefaultParametersResponse is the response type for the
// DescribeEngineDefaultParameters API operation.
type DescribeEngineDefaultParametersResponse struct {
	*DescribeEngineDefaultParametersOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// DescribeEngineDefaultParameters request.
func (r *DescribeEngineDefaultParametersResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
