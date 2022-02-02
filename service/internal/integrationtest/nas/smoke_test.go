//go:build integration
// +build integration

package nas

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
	"github.com/nifcloud/nifcloud-sdk-go/service/nas"
)

func TestInteg_00_DescribeNASSecurityGroups(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := nas.NewFromConfig(cfg)

	params := &nas.DescribeNASSecurityGroupsInput{}
	_, err := client.DescribeNASSecurityGroups(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_01_DescribeNASInstances(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := nas.NewFromConfig(cfg)

	params := &nas.DescribeNASInstancesInput{
		NASInstanceIdentifier: nifcloud.String("fake-id"),
	}

	_, err := client.DescribeNASInstances(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}
