package nas

import (
	"bytes"
	"io/ioutil"
	"net/http"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/awserr"
)

func TestUnmarshal(t *testing.T) {
	buf := bytes.NewReader([]byte(`
	<TestResponse>
	  <TestResult>
		<Element>test</Element>
	  </TestResult>
	</TestResponse>`))

	op := &aws.Operation{
		Name:     "Test",
		HTTPPath: "/",
	}

	type TestInput struct{}
	req := &aws.Request{Operation: op}
	req.Data = &TestInput{}

	req.HTTPResponse = &http.Response{StatusCode: http.StatusOK, Body: ioutil.NopCloser(buf), Header: http.Header{}}

	// unmarshal response
	UnmarshalMeta(req)
	Unmarshal(req)
	if req.Error != nil {
		t.Errorf("expect not error, got %v", req.Error)
	}
}

func TestUnmarshalError(t *testing.T) {
	buf := bytes.NewReader([]byte(`
	<ErrorResponse>
	  <Error>
		<Code>a</Code>
		<Message>b</Message>
	  </Error>
	  <RequestId>c</RequestId>
	</ErrorResponse>`))

	op := &aws.Operation{
		Name:     "Test",
		HTTPPath: "/",
	}

	type TestInput struct{}
	req := &aws.Request{Operation: op}
	req.Data = &TestInput{}

	req.HTTPResponse = &http.Response{
		StatusCode: http.StatusInternalServerError,
		Body:       ioutil.NopCloser(buf),
		Header:     http.Header{},
	}

	// unmarshal error response
	UnmarshalError(req)
	if req.Error == nil {
		t.Errorf("expect request to fail")
	}

	aerr, ok := req.Error.(awserr.RequestFailure)
	if !ok {
		t.Errorf("expect awserr, was %T", aerr)
	}
}
