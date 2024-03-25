//go:build integration
// +build integration

package devopsrunner

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
	"github.com/nifcloud/nifcloud-sdk-go/service/devopsrunner"
)

func TestInteg_00_ListParameterGroups(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := devopsrunner.NewFromConfig(cfg)

	params := &devopsrunner.ListRunnerParameterGroupsInput{}
	_, err := client.ListRunnerParameterGroups(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_01_GetRunner(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := devopsrunner.NewFromConfig(cfg)

	params := &devopsrunner.GetRunnerInput{
		RunnerName: nifcloud.String("fake-name"),
	}

	_, err := client.GetRunner(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}
