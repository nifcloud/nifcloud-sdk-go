// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package rdb

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type StartReplicationInput struct {
	_ struct{} `type:"structure"`

	// DBInstanceIdentifier is a required field
	DBInstanceIdentifier *string `locationName:"DBInstanceIdentifier" type:"string" required:"true"`
}

// String returns the string representation
func (s StartReplicationInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *StartReplicationInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "StartReplicationInput"}

	if s.DBInstanceIdentifier == nil {
		invalidParams.Add(aws.NewErrParamRequired("DBInstanceIdentifier"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type StartReplicationOutput struct {
	_ struct{} `type:"structure"`

	DBInstance *DBInstance `type:"structure"`
}

// String returns the string representation
func (s StartReplicationOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opStartReplication = "StartReplication"

// StartReplicationRequest returns a request value for making API operation for
// NIFCLOUD RDB.
//
//    // Example sending a request using StartReplicationRequest.
//    req := client.StartReplicationRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rdb/StartReplication.htm
func (c *Client) StartReplicationRequest(input *StartReplicationInput) StartReplicationRequest {
	op := &aws.Operation{
		Name:       opStartReplication,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &StartReplicationInput{}
	}

	req := c.newRequest(op, input, &StartReplicationOutput{})

	return StartReplicationRequest{Request: req, Input: input, Copy: c.StartReplicationRequest}
}

// StartReplicationRequest is the request type for the
// StartReplication API operation.
type StartReplicationRequest struct {
	*aws.Request
	Input *StartReplicationInput
	Copy  func(*StartReplicationInput) StartReplicationRequest
}

// Send marshals and sends the StartReplication API request.
func (r StartReplicationRequest) Send(ctx context.Context) (*StartReplicationResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &StartReplicationResponse{
		StartReplicationOutput: r.Request.Data.(*StartReplicationOutput),
		response:               &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// StartReplicationResponse is the response type for the
// StartReplication API operation.
type StartReplicationResponse struct {
	*StartReplicationOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// StartReplication request.
func (r *StartReplicationResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
