// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type NiftyDescribeAlarmRulesActivitiesInput struct {
	_ struct{} `type:"structure"`

	Rule []RequestRuleOfNiftyDescribeAlarmRulesActivities `locationName:"Rule" type:"list"`
}

// String returns the string representation
func (s NiftyDescribeAlarmRulesActivitiesInput) String() string {
	return nifcloudutil.Prettify(s)
}

type NiftyDescribeAlarmRulesActivitiesOutput struct {
	_ struct{} `type:"structure"`

	RequestId *string `locationName:"requestId" type:"string"`

	ReservationSet []ReservationSetOfNiftyDescribeAlarmRulesActivities `locationName:"reservationSet" locationNameList:"item" type:"list"`
}

// String returns the string representation
func (s NiftyDescribeAlarmRulesActivitiesOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opNiftyDescribeAlarmRulesActivities = "NiftyDescribeAlarmRulesActivities"

// NiftyDescribeAlarmRulesActivitiesRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using NiftyDescribeAlarmRulesActivitiesRequest.
//    req := client.NiftyDescribeAlarmRulesActivitiesRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/NiftyDescribeAlarmRulesActivities.htm
func (c *Client) NiftyDescribeAlarmRulesActivitiesRequest(input *NiftyDescribeAlarmRulesActivitiesInput) NiftyDescribeAlarmRulesActivitiesRequest {
	op := &aws.Operation{
		Name:       opNiftyDescribeAlarmRulesActivities,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &NiftyDescribeAlarmRulesActivitiesInput{}
	}

	req := c.newRequest(op, input, &NiftyDescribeAlarmRulesActivitiesOutput{})

	return NiftyDescribeAlarmRulesActivitiesRequest{Request: req, Input: input, Copy: c.NiftyDescribeAlarmRulesActivitiesRequest}
}

// NiftyDescribeAlarmRulesActivitiesRequest is the request type for the
// NiftyDescribeAlarmRulesActivities API operation.
type NiftyDescribeAlarmRulesActivitiesRequest struct {
	*aws.Request
	Input *NiftyDescribeAlarmRulesActivitiesInput
	Copy  func(*NiftyDescribeAlarmRulesActivitiesInput) NiftyDescribeAlarmRulesActivitiesRequest
}

// Send marshals and sends the NiftyDescribeAlarmRulesActivities API request.
func (r NiftyDescribeAlarmRulesActivitiesRequest) Send(ctx context.Context) (*NiftyDescribeAlarmRulesActivitiesResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &NiftyDescribeAlarmRulesActivitiesResponse{
		NiftyDescribeAlarmRulesActivitiesOutput: r.Request.Data.(*NiftyDescribeAlarmRulesActivitiesOutput),
		response:                                &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// NiftyDescribeAlarmRulesActivitiesResponse is the response type for the
// NiftyDescribeAlarmRulesActivities API operation.
type NiftyDescribeAlarmRulesActivitiesResponse struct {
	*NiftyDescribeAlarmRulesActivitiesOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// NiftyDescribeAlarmRulesActivities request.
func (r *NiftyDescribeAlarmRulesActivitiesResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
