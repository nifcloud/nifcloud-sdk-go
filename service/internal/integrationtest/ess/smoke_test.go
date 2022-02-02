//go:build integration
// +build integration

package ess

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/service/ess"
	"github.com/nifcloud/nifcloud-sdk-go/service/ess/types"
	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
)

func TestInteg_00_ListIdentities(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := ess.NewFromConfig(cfg)

	params := &ess.ListIdentitiesInput{
		IdentityType: types.IdentityTypeOfListIdentitiesRequest("fake-type"),
	}
	_, err := client.ListIdentities(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}

func TestInteg_01_GetSendQuota(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := ess.NewFromConfig(cfg)

	params := &ess.GetSendQuotaInput{}
	_, err := client.GetSendQuota(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_02_GetSendStatistics(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := ess.NewFromConfig(cfg)

	params := &ess.GetSendStatisticsInput{}

	_, err := client.GetSendStatistics(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}
