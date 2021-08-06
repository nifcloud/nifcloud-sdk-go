// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package hatoba

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

type DeleteNodePoolInput struct {
	_ struct{} `type:"structure"`

	// ClusterName is a required field
	ClusterName *string `location:"uri" locationName:"cluster_name" type:"string" required:"true"`

	// NodePoolName is a required field
	NodePoolName *string `location:"uri" locationName:"node_pool_name" type:"string" required:"true"`
}

// String returns the string representation
func (s DeleteNodePoolInput) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *DeleteNodePoolInput) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "DeleteNodePoolInput"}

	if s.ClusterName == nil {
		invalidParams.Add(aws.NewErrParamRequired("ClusterName"))
	}

	if s.NodePoolName == nil {
		invalidParams.Add(aws.NewErrParamRequired("NodePoolName"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s DeleteNodePoolInput) MarshalFields(e protocol.FieldEncoder) error {
	e.SetValue(protocol.HeaderTarget, "Content-Type", protocol.StringValue("application/json"), protocol.Metadata{})

	if s.ClusterName != nil {
		v := *s.ClusterName

		metadata := protocol.Metadata{}
		e.SetValue(protocol.PathTarget, "cluster_name", protocol.QuotedValue{ValueMarshaler: protocol.StringValue(v)}, metadata)
	}
	if s.NodePoolName != nil {
		v := *s.NodePoolName

		metadata := protocol.Metadata{}
		e.SetValue(protocol.PathTarget, "node_pool_name", protocol.QuotedValue{ValueMarshaler: protocol.StringValue(v)}, metadata)
	}
	return nil
}

type DeleteNodePoolOutput struct {
	_ struct{} `type:"structure"`

	NodePool *NodePool `locationName:"nodePool" type:"structure"`
}

// String returns the string representation
func (s DeleteNodePoolOutput) String() string {
	return nifcloudutil.Prettify(s)
}

// MarshalFields encodes the AWS API shape using the passed in protocol encoder.
func (s DeleteNodePoolOutput) MarshalFields(e protocol.FieldEncoder) error {
	if s.NodePool != nil {
		v := s.NodePool

		metadata := protocol.Metadata{}
		e.SetFields(protocol.BodyTarget, "nodePool", v, metadata)
	}
	return nil
}

const opDeleteNodePool = "DeleteNodePool"

// DeleteNodePoolRequest returns a request value for making API operation for
// NIFCLOUD Kubernetes Service Hatoba.
//
//    // Example sending a request using DeleteNodePoolRequest.
//    req := client.DeleteNodePoolRequest(params)
//    resp, err := req.Send(context.TODO())
//    if err == nil {
//        fmt.Println(resp)
//    }
//
// Please also see https://pfs.nifcloud.com/api/hatoba/DeleteNodePool.htm
func (c *Client) DeleteNodePoolRequest(input *DeleteNodePoolInput) DeleteNodePoolRequest {
	op := &aws.Operation{
		Name:       opDeleteNodePool,
		HTTPMethod: "DELETE",
		HTTPPath:   "/v1/clusters/{cluster_name}/nodePools/{node_pool_name}",
	}

	if input == nil {
		input = &DeleteNodePoolInput{}
	}

	req := c.newRequest(op, input, &DeleteNodePoolOutput{})

	return DeleteNodePoolRequest{Request: req, Input: input, Copy: c.DeleteNodePoolRequest}
}

// DeleteNodePoolRequest is the request type for the
// DeleteNodePool API operation.
type DeleteNodePoolRequest struct {
	*aws.Request
	Input *DeleteNodePoolInput
	Copy  func(*DeleteNodePoolInput) DeleteNodePoolRequest
}

// Send marshals and sends the DeleteNodePool API request.
func (r DeleteNodePoolRequest) Send(ctx context.Context) (*DeleteNodePoolResponse, error) {
	r.Request.SetContext(ctx)
	err := r.Request.Send()
	if err != nil {
		return nil, err
	}

	resp := &DeleteNodePoolResponse{
		DeleteNodePoolOutput: r.Request.Data.(*DeleteNodePoolOutput),
		response:             &aws.Response{Request: r.Request},
	}

	return resp, nil
}

// DeleteNodePoolResponse is the response type for the
// DeleteNodePool API operation.
type DeleteNodePoolResponse struct {
	*DeleteNodePoolOutput

	response *aws.Response
}

// SDKResponseMetdata returns the response metadata for the
// DeleteNodePool request.
func (r *DeleteNodePoolResponse) SDKResponseMetdata() *aws.Response {
	return r.response
}
