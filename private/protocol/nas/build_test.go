package nas

import (
	"io/ioutil"
	"net/url"
	"testing"
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
	v4 "github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	"github.com/aws/aws-sdk-go-v2/private/protocol"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudtesting/unit"
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
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

type GetMetricStatisticsTestInput struct {
	_ struct{} `type:"structure"`

	StartTime  *time.Time `type:"time.Time"`
	EndTime    *time.Time `type:"time.Time"`
	MetricName *string    `type:"string"`
	Dimensions []struct {
		_ struct{} `type:"structure"`

		Name  *string
		Value *string
	} `locationName:"Dimensions" locationNameList:"member" type:"list"`
}

type GetMetricStatisticsTestRequest struct {
	*aws.Request
	Input *GetMetricStatisticsTestInput
	Copy  func(*GetMetricStatisticsTestInput) GetMetricStatisticsTestRequest
}

func (c *TestService) GetMetricStatisticsTestRequest(
	input *GetMetricStatisticsTestInput) GetMetricStatisticsTestRequest {
	op := &aws.Operation{
		Name: "GetMetricStatistics",

		HTTPPath: "/",
	}

	req := c.NewRequest(op, input, &TestOutput{})
	req.Handlers.Unmarshal.Remove(UnmarshalHandler)
	req.Handlers.Unmarshal.PushBackNamed(protocol.UnmarshalDiscardBodyHandler)

	return GetMetricStatisticsTestRequest{Request: req, Input: input, Copy: c.GetMetricStatisticsTestRequest}
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

func TestBuildForGetMetricStatistics(t *testing.T) {
	svc := NewTestService()

	startTime := time.Now().Add(time.Duration(-3) * time.Minute)
	endTime := time.Now()
	convertTimestampLayout := "2006-01-02 15:04"

	input := &GetMetricStatisticsTestInput{
		StartTime:  nifcloud.Time(startTime),
		EndTime:    nifcloud.Time(endTime),
		MetricName: nifcloud.String("FreeStorageSpace"),
		Dimensions: []struct {
			_ struct{} `type:"structure"`

			Name  *string
			Value *string
		}{
			{
				Name:  nifcloud.String("NASInstanceIdentifier"),
				Value: nifcloud.String("sdktestnas001"),
			},
		},
	}

	req := svc.GetMetricStatisticsTestRequest(input)
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
	if e, a := startTime.UTC().Format(convertTimestampLayout), query.Get("StartTime"); e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
	if e, a := endTime.UTC().Format(convertTimestampLayout), query.Get("EndTime"); e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
	if e, a := "FreeStorageSpace", query.Get("MetricName"); e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
	if e, a := "NASInstanceIdentifier", query.Get("Dimensions.member.1.Name"); e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
	if e, a := "sdktestnas001", query.Get("Dimensions.member.1.Value"); e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
}
