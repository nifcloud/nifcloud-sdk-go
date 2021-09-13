package v3

import (
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudtesting"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudtesting/unit"
)

func TestSignSDKRequest(t *testing.T) {
	cfg := unit.Config()
	cfg.Credentials = aws.NewStaticCredentialsProvider("AKID", "SECRET", "SESSION")
	cfg.Region = "ap-southeast-2"

	svc := nifcloudtesting.NewClient(cfg)
	r := svc.NewRequest(
		&aws.Operation{
			Name:       "OpName",
			HTTPMethod: "GET",
			HTTPPath:   "/",
		},
		nil,
		nil,
	)

	if err := r.Build(); err != nil {
		t.Fatalf("expect no error, got %v", r.Error)
	}

	SignSDKRequest(r)
	if r.Error != nil {
		t.Fatalf("expect no error, got %v", r.Error)
	}

	req := r.HTTPRequest

	if a := req.Header.Get("X-Nifty-Authorization"); len(a) == 0 {
		t.Fatalf("expect signature to be set, was not")
	}
}
