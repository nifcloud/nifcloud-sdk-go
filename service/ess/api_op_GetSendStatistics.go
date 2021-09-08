// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package ess

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type GetSendStatisticsInput struct {
	_ struct{} `type:"structure"`
}

// String returns the string representation
func (s GetSendStatisticsInput) String() string {
	return nifcloudutil.Prettify(s)
}

type GetSendStatisticsOutput struct {
	_ struct{} `type:"structure"`

	ResponseMetadata *ResponseMetadata `locationName:"ResponseMetadata" type:"structure"`

	SendDataPoints []SendDataPoints `locationName:"SendDataPoints" locationNameList:"member" type:"list"`
}

// String returns the string representation
func (s GetSendStatisticsOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opGetSendStatistics = "GetSendStatistics"

// GetSendStatisticsRequest returns a request value for making API operation for
// NIFCLOUD ESS.
//
//    // Example sending a request using GetSendStatisticsRequest.
//    req := client.GetSendStatisticsRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/ess/GetSendStatistics.htm
func (c *Client) GetSendStatisticsRequest(input *GetSendStatisticsInput) GetSendStatisticsRequest {
	op := &aws.Operation{
		Name:       opGetSendStatistics,
		HTTPMethod: "POST",
		HTTPPath:   "/",
	}

	if input == nil {
		input = &GetSendStatisticsInput{}
	}

	req := c.newRequest(op, input, &GetSendStatisticsOutput{})

	return GetSendStatisticsRequest{Request: req, Input: input, Copy: c.GetSendStatisticsRequest}
}

// GetSendStatisticsRequest is the request type for the
// GetSendStatistics API operation.
type GetSendStatisticsRequest struct {
	*aws.Request
	Input *GetSendStatisticsInput
	Copy  func(*GetSendStatisticsInput) GetSendStatisticsRequest
}

// Send marshals and sends the GetSendStatistics API request.
func (r GetSendStatisticsRequest) Send(ctx context.Context) (*GetSendStatisticsResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &GetSendStatisticsResponse{
		GetSendStatisticsOutput: r.Request.Data.(*GetSendStatisticsOutput),
		response:                &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// GetSendStatisticsResponse is the response type for the
// GetSendStatistics API operation.
type GetSendStatisticsResponse struct {
	*GetSendStatisticsOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// GetSendStatistics request.
func (r *GetSendStatisticsResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}