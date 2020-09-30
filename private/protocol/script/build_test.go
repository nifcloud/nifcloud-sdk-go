package script

import (
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	v4 "github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudtesting/unit"
)

type TestService struct {
	*aws.Client
}

type TestOutput struct {
	_ struct{} `type:"structure"`
}

func NewTestService() *TestService {
	cfg := unit.Config()

	svc := &TestService{
		Client: aws.NewClient(
			cfg.AWSConfig(),
			aws.Metadata{},
		),
	}

	// Handlers
	svc.Handlers.Sign.PushBackNamed(v4.SignRequestHandler)
	svc.Handlers.Build.PushBackNamed(BuildHandler)
	svc.Handlers.Unmarshal.PushBackNamed(UnmarshalHandler)
	svc.Handlers.UnmarshalMeta.PushBackNamed(UnmarshalMetaHandler)
	svc.Handlers.UnmarshalError.PushBackNamed(UnmarshalErrorHandler)
	return svc
}

type CommonOperationTestInput struct {
	_ struct{} `type:"structure"`

	Bar *string `type:"string"`
	Foo *string `type:"string"`
}

type CommonOperationTestRequest struct {
	*aws.Request
	Input *CommonOperationTestInput
	Copy  func(*CommonOperationTestInput) CommonOperationTestRequest
}

func (c *TestService) CommonOperationTestRequest(input *CommonOperationTestInput) CommonOperationTestRequest {
	op := &aws.Operation{
		Name: "CommonOperationTest",

		HTTPPath: "/",
	}

	req := c.NewRequest(op, input, &TestOutput{})
	req.Handlers.Unmarshal.Remove(UnmarshalHandler)
	req.Handlers.Unmarshal.PushBackNamed(protocol.UnmarshalDiscardBodyHandler)

	return CommonOperationTestRequest{Request: req, Input: input, Copy: c.CommonOperationTestRequest}
}

func TestBuildForCommonOperation(t *testing.T) {
	svc := NewTestService()

	input := &CommonOperationTestInput{
		Bar: aws.String("val2"),
		Foo: aws.String("val1"),
	}

	req := svc.CommonOperationTestRequest(input)
	r := req.HTTPRequest

	// build request
	err := req.Build()

	if err != nil {
		t.Errorf("expect no error, got %v", req.Error)
	}

	if req.Error != nil {
		t.Errorf("expect no error, got %v", req.Error)
	}

	// assert body
	if r.Body == nil {
		t.Errorf("expect body not to be nil")
	}
}
