// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package computing

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type ConfigureHealthCheckInput struct {
	_ struct{} `type:"structure"`

	// HealthCheck is a required field
	HealthCheck *RequestHealthCheck `locationName:"HealthCheck" type:"structure" required:"true"`

	// InstancePort is a required field
	InstancePort *int64 `locationName:"InstancePort" type:"integer" required:"true"`

	// LoadBalancerName is a required field
	LoadBalancerName *string `locationName:"LoadBalancerName" type:"string" required:"true"`

	// LoadBalancerPort is a required field
	LoadBalancerPort *int64 `locationName:"LoadBalancerPort" type:"integer" required:"true"`
}

// String returns the string representation
func (s ConfigureHealthCheckInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *ConfigureHealthCheckInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "ConfigureHealthCheckInput"}

	if s.HealthCheck == nil {
		invalidParams.Add(aws.NewErrParamRequired("HealthCheck"))
	}

	if s.InstancePort == nil {
		invalidParams.Add(aws.NewErrParamRequired("InstancePort"))
	}

	if s.LoadBalancerName == nil {
		invalidParams.Add(aws.NewErrParamRequired("LoadBalancerName"))
	}

	if s.LoadBalancerPort == nil {
		invalidParams.Add(aws.NewErrParamRequired("LoadBalancerPort"))
	}
	if s.HealthCheck != nil {
		if err := s.HealthCheck.Validate(); err != nil {
			invalidParams.AddNested("HealthCheck", err.(aws.ErrInvalidParams))
		}
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type ConfigureHealthCheckOutput struct {
	_ struct{} `type:"structure"`

	HealthCheck *HealthCheck `locationName:"HealthCheck" type:"structure"`

	ResponseMetadata *ResponseMetadata `locationName:"ResponseMetadata" type:"structure"`
}

// String returns the string representation
func (s ConfigureHealthCheckOutput) String() string {
	return nifcloudutil.Prettify(s)
}

const opConfigureHealthCheck = "ConfigureHealthCheck"

// ConfigureHealthCheckRequest returns a request value for making API operation for
// NIFCLOUD Computing.
//
//    // Example sending a request using ConfigureHealthCheckRequest.
//    req := client.ConfigureHealthCheckRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/rest/ConfigureHealthCheck.htm
func (c *Client) ConfigureHealthCheckRequest(input *ConfigureHealthCheckInput) ConfigureHealthCheckRequest {
	op := &aws.Operation{
		Name:       opConfigureHealthCheck,
		HTTPMethod: "POST",
		HTTPPath:   "/api/",
	}

	if input == nil {
		input = &ConfigureHealthCheckInput{}
	}

	req := c.newRequest(op, input, &ConfigureHealthCheckOutput{})

	return ConfigureHealthCheckRequest{Request: req, Input: input, Copy: c.ConfigureHealthCheckRequest}
}

// ConfigureHealthCheckRequest is the request type for the
// ConfigureHealthCheck API operation.
type ConfigureHealthCheckRequest struct {
	*aws.Request
	Input *ConfigureHealthCheckInput
	Copy  func(*ConfigureHealthCheckInput) ConfigureHealthCheckRequest
}

// Send marshals and sends the ConfigureHealthCheck API request.
func (r ConfigureHealthCheckRequest) Send(ctx context.Context) (*ConfigureHealthCheckResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &ConfigureHealthCheckResponse{
		ConfigureHealthCheckOutput: r.Request.Data.(*ConfigureHealthCheckOutput),
		response:                   &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// ConfigureHealthCheckResponse is the response type for the
// ConfigureHealthCheck API operation.
type ConfigureHealthCheckResponse struct {
	*ConfigureHealthCheckOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// ConfigureHealthCheck request.
func (r *ConfigureHealthCheckResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
