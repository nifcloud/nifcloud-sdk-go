//go:build integration
// +build integration

package dns

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	"github.com/nifcloud/nifcloud-sdk-go/service/dns"
	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
)

func TestInteg_00_ListHostedZones(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := dns.NewFromConfig(cfg)

	params := &dns.ListHostedZonesInput{}
	_, err := client.ListHostedZones(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_01_GetHostedZone(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := dns.NewFromConfig(cfg)

	params := &dns.GetHostedZoneInput{
		ZoneID: nifcloud.String("fake-id"),
	}

	_, err := client.GetHostedZone(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}
