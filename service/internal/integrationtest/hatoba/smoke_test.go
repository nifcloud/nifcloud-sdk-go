//go:build integration
// +build integration

package hatoba

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
	"github.com/nifcloud/nifcloud-sdk-go/service/hatoba"
	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
)

func TestInteg_00_ListClusters(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := hatoba.NewFromConfig(cfg)

	params := &hatoba.ListClustersInput{}
	_, err := client.ListClusters(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_01_GetCluster(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := hatoba.NewFromConfig(cfg)

	params := &hatoba.GetClusterInput{
		ClusterName: nifcloud.String("fake-name"),
	}

	_, err := client.GetCluster(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}
