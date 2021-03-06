// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package hatoba

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type CreateClusterInput struct {
	_ struct{} `type:"structure"`

	// Cluster is a required field
	Cluster *CreateClusterRequestCluster `locationName:"cluster" type:"structure" required:"true"`
}

// String returns the string representation
func (s CreateClusterInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *CreateClusterInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "CreateClusterInput"}

	if s.Cluster == nil {
		invalidParams.Add(aws.NewErrParamRequired("Cluster"))
	}
	if s.Cluster != nil {
		if err := s.Cluster.Validate(); err != nil {
			invalidParams.AddNested("Cluster", err.(aws.ErrInvalidParams))
		}
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s CreateClusterInput) MarshalFields(e protocol.FieldEncoder) error {
	e.SetValue(protocol.HeaderTarget, "Content-Type", protocol.StringValue("application/json"), protocol.Metadata{})

	if s.Cluster != nil {
		v := s.Cluster

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "cluster", v, metadata)
	}
	return nil
}

type CreateClusterOutput struct {
	_ struct{} `type:"structure"`

	Cluster *Cluster `locationName:"cluster" type:"structure"`

	RequestId *string `locationName:"requestId" type:"string"`
}

// String returns the string representation
func (s CreateClusterOutput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s CreateClusterOutput) MarshalFields(e protocol.FieldEncoder) error {
	if s.Cluster != nil {
		v := s.Cluster

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "cluster", v, metadata)
	}
	if s.RequestId != nil {
		v := *s.RequestId

		metadata := protocol.Metadata{}
		e.SetValue(protocol.BodyTarget, "requestId", protocol.QuotedValue{ValueMarshaler: protocol.StringValue(v)}, metadata)
	}
	return nil
}

const opCreateCluster = "CreateCluster"

// CreateClusterRequest returns a request value for making API operation for
// NIFCLOUD Hatoba beta.
//
//    // Example sending a request using CreateClusterRequest.
//    req := client.CreateClusterRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/hatoba/CreateCluster.htm
func (c *Client) CreateClusterRequest(input *CreateClusterInput) CreateClusterRequest {
	op := &aws.Operation{
		Name:       opCreateCluster,
		HTTPMethod: "POST",
		HTTPPath:   "/v1/clusters",
	}

	if input == nil {
		input = &CreateClusterInput{}
	}

	req := c.newRequest(op, input, &CreateClusterOutput{})

	return CreateClusterRequest{Request: req, Input: input, Copy: c.CreateClusterRequest}
}

// CreateClusterRequest is the request type for the
// CreateCluster API operation.
type CreateClusterRequest struct {
	*aws.Request
	Input *CreateClusterInput
	Copy  func(*CreateClusterInput) CreateClusterRequest
}

// Send marshals and sends the CreateCluster API request.
func (r CreateClusterRequest) Send(ctx context.Context) (*CreateClusterResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &CreateClusterResponse{
		CreateClusterOutput: r.Request.Data.(*CreateClusterOutput),
		response:            &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// CreateClusterResponse is the response type for the
// CreateCluster API operation.
type CreateClusterResponse struct {
	*CreateClusterOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// CreateCluster request.
func (r *CreateClusterResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
