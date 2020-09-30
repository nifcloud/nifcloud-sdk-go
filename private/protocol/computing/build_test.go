package computing

import (
	"io/ioutil"
	"net/url"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudtesting/unit"
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	v2 "github.com/nifcloud/nifcloud-sdk-go/nifcloud/signer/v2"
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
	svc.Handlers.Sign.PushBackNamed(v2.SignRequestHandler)
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

type DescribeLoadBalancersTestInput struct {
	_ struct{} `type:"structure"`

	LoadBalancerNames []struct {
		_ struct{} `type:"structure"`

		InstancePort     *int64
		LoadBalancerName *string
		LoadBalancerPort *int64
	} `locationName:"LoadBalancerNames" locationNameList:"member" type:"list"`
}

type DescribeLoadBalancersTestRequest struct {
	*aws.Request
	Input *DescribeLoadBalancersTestInput
	Copy  func(*DescribeLoadBalancersTestInput) DescribeLoadBalancersTestRequest
}

func (c *TestService) DescribeLoadBalancersTestRequest(
	input *DescribeLoadBalancersTestInput) DescribeLoadBalancersTestRequest {
	op := &aws.Operation{
		Name: "DescribeLoadBalancers",

		HTTPPath: "/",
	}

	req := c.NewRequest(op, input, &TestOutput{})
	req.Handlers.Unmarshal.Remove(UnmarshalHandler)
	req.Handlers.Unmarshal.PushBackNamed(protocol.UnmarshalDiscardBodyHandler)

	return DescribeLoadBalancersTestRequest{Request: req, Input: input, Copy: c.DescribeLoadBalancersTestRequest}
}

type RunInstancesTestInput struct {
	_ struct{} `type:"structure"`

	UserData struct {
		Content string
	}
}

type RunInstancesTestRequest struct {
	*aws.Request
	Input *RunInstancesTestInput
	Copy  func(*RunInstancesTestInput) RunInstancesTestRequest
}

func (c *TestService) RunInstancesTestRequest(input *RunInstancesTestInput) RunInstancesTestRequest {
	op := &aws.Operation{
		Name: "RunInstances",

		HTTPPath: "/",
	}

	req := c.NewRequest(op, input, &TestOutput{})
	req.Handlers.Unmarshal.Remove(UnmarshalHandler)
	req.Handlers.Unmarshal.PushBackNamed(protocol.UnmarshalDiscardBodyHandler)

	return RunInstancesTestRequest{Request: req, Input: input, Copy: c.RunInstancesTestRequest}
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

func TestBuildForDescribeLoadBalancers(t *testing.T) {
	svc := NewTestService()

	input := &DescribeLoadBalancersTestInput{
		LoadBalancerNames: []struct {
			_ struct{} `type:"structure"`

			InstancePort     *int64
			LoadBalancerName *string
			LoadBalancerPort *int64
		}{
			{
				InstancePort:     nifcloud.Int64(8080),
				LoadBalancerName: nifcloud.String("test"),
				LoadBalancerPort: nifcloud.Int64(8081),
			},
		},
	}

	req := svc.DescribeLoadBalancersTestRequest(input)
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

	body, _ := ioutil.ReadAll(r.Body)
	query, _ := url.ParseQuery(string(body))

	// assert customize params
	if e, a := "test", query.Get("LoadBalancerNames.member.1"); e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
	if e, a := "8080", query.Get("LoadBalancerNames.InstancePort.1"); e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
	if e, a := "8081", query.Get("LoadBalancerNames.LoadBalancerPort.1"); e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
}

func TestBuildForRunInstances(t *testing.T) {
	svc := NewTestService()

	input := &RunInstancesTestInput{
		UserData: struct {
			Content string
		}{
			Content: "test",
		},
	}

	req := svc.RunInstancesTestRequest(input)
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

	body, _ := ioutil.ReadAll(r.Body)
	query, _ := url.ParseQuery(string(body))

	// assert customize params
	if e, a := "test", query.Get("UserData"); e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
}
