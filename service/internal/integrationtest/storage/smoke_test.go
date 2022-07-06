//go:build integration
// +build integration

package storage

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
	"github.com/nifcloud/nifcloud-sdk-go/service/storage"
)

func TestInteg_00_GetService(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithStorageDefaultRegion("jp-east-1")
	client := storage.NewFromConfig(cfg)

	params := &storage.GetServiceInput{}
	_, err := client.GetService(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_01_GetBucket(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithStorageDefaultRegion("jp-east-1")
	client := storage.NewFromConfig(cfg)

	params := &storage.GetBucketInput{
		Bucket: nifcloud.String("fake-id"),
	}

	_, err := client.GetBucket(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}
