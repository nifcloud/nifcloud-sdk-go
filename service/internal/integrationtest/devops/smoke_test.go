//go:build integration
// +build integration

package devops

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
	"github.com/nifcloud/nifcloud-sdk-go/service/devops"
)

func TestInteg_00_ListFirewallGroups(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := devops.NewFromConfig(cfg)

	params := &devops.ListFirewallGroupsInput{}
	_, err := client.ListFirewallGroups(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_01_GetInstance(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := devops.NewFromConfig(cfg)

	params := &devops.GetInstanceInput{
		InstanceId: nifcloud.String("fake-id"),
	}

	_, err := client.GetInstance(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}
