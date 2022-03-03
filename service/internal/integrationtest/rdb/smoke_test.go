//go:build integration
// +build integration

package rdb

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
	"github.com/nifcloud/nifcloud-sdk-go/service/rdb"
)

func TestInteg_00_DescribeDBEngineVersions(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := rdb.NewFromConfig(cfg)

	params := &rdb.DescribeDBEngineVersionsInput{}
	_, err := client.DescribeDBEngineVersions(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_01_DescribeDBInstances(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := rdb.NewFromConfig(cfg)

	params := &rdb.DescribeDBInstancesInput{
		DBInstanceIdentifier: nifcloud.String("fake-id"),
	}

	_, err := client.DescribeDBInstances(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}
