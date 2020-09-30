package nifcloud

import (
	"context"
	"testing"
)

func TestStaticCredentialsProviderGet(t *testing.T) {
	s := NewStaticCredentialsProvider(
		"AKID",
		"SECRET",
	)

	creds, err := s.Retrieve(context.Background())
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
	if e, a := "AKID", creds.AccessKeyID; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
	if e, a := "SECRET", creds.SecretAccessKey; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
}
