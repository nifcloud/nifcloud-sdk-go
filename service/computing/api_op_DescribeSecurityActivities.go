// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type DescribeSecurityActivitiesInput struct {
	_ struct{} `type:"structure"`

	ActivityDate *string `locationName:"ActivityDate" type:"string"`

	// GroupName is a required field
	GroupName *string `locationName:"GroupName" type:"string" required:"true"`

	Range *RequestRange `locationName:"Range" type:"structure"`
}

// String returns the string representation
func (s DescribeSecurityActivitiesInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *DescribeSecurityActivitiesInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "DescribeSecurityActivitiesInput"}

	if s.GroupName == nil {
		invalidParams.Add(aws.NewErrParamRequired("GroupName"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type DescribeSecurityActivitiesOutput struct {
	_ struct{} `type:"structure"`

	GroupName *string `locationName:"groupName" type:"string"`

	Log *string `locationName:"log" type:"string"`

	RequestId *string `locationName:"requestId" type:"string"`
}

// String returns the string representation
func (s DescribeSecurityActivitiesOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opDescribeSecurityActivities = "DescribeSecurityActivities"

// DescribeSecurityActivitiesRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using DescribeSecurityActivitiesRequest.
//    req := client.DescribeSecurityActivitiesRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/DescribeSecurityActivities.htm
func (c *Client) DescribeSecurityActivitiesRequest(input *DescribeSecurityActivitiesInput) DescribeSecurityActivitiesRequest {
	op := &aws.Operation{
		Name:       opDescribeSecurityActivities,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &DescribeSecurityActivitiesInput{}
	}

	req := c.newRequest(op, input, &DescribeSecurityActivitiesOutput{})

	return DescribeSecurityActivitiesRequest{Request: req, Input: input, Copy: c.DescribeSecurityActivitiesRequest}
}

// DescribeSecurityActivitiesRequest is the request type for the
// DescribeSecurityActivities API operation.
type DescribeSecurityActivitiesRequest struct {
	*aws.Request
	Input *DescribeSecurityActivitiesInput
	Copy  func(*DescribeSecurityActivitiesInput) DescribeSecurityActivitiesRequest
}

// Send marshals and sends the DescribeSecurityActivities API request.
func (r DescribeSecurityActivitiesRequest) Send(ctx context.Context) (*DescribeSecurityActivitiesResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &DescribeSecurityActivitiesResponse{
		DescribeSecurityActivitiesOutput: r.Request.Data.(*DescribeSecurityActivitiesOutput),
		response:                         &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// DescribeSecurityActivitiesResponse is the response type for the
// DescribeSecurityActivities API operation.
type DescribeSecurityActivitiesResponse struct {
	*DescribeSecurityActivitiesOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// DescribeSecurityActivities request.
func (r *DescribeSecurityActivitiesResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
