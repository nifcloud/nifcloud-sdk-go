//go:build integration
// +build integration

package serviceactivity

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/service/serviceactivity"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"

	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
)

func TestInteg_00_DescribeServiceStatuses(t *testing.T) {
	// Set longer timeout seconds as DescribeServiceStatuses takes around 10 seconds.
	ctx, cancelFn := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := serviceactivity.NewFromConfig(cfg)

	params := &serviceactivity.DescribeServiceStatusesInput{}
	_, err := client.DescribeServiceStatuses(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_01_DescribeEventCalendar(t *testing.T) {
	// Set longer timeout seconds as DescribeServiceStatuses takes around 15 seconds.
	ctx, cancelFn := context.WithTimeout(context.Background(), 15*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := serviceactivity.NewFromConfig(cfg)

	params := &serviceactivity.DescribeEventCalendarInput{
		YearMonth: nifcloud.String("fake-yearMonth"),
	}

	_, err := client.DescribeEventCalendar(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}
