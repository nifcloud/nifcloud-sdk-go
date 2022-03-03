//go:build integration
// +build integration

package computing

import (
	"context"
	"testing"
	"time"

	"github.com/nifcloud/nifcloud-sdk-go/service/computing"
	"github.com/nifcloud/nifcloud-sdk-go/service/computing/types"
	"github.com/nifcloud/nifcloud-sdk-go/service/internal/integrationtest"
)

func TestInteg_00_DescribeRegions(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := computing.NewFromConfig(cfg)

	params := &computing.DescribeRegionsInput{}
	_, err := client.DescribeRegions(ctx, params)
	if err != nil {
		t.Errorf("expect no error, got %v", err)
	}
}

func TestInteg_01_NiftyDescribeElasticLoadBalancers(t *testing.T) {
	ctx, cancelFn := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancelFn()

	cfg := integrationtest.LoadConfigWithDefaultRegion("jp-east-1")
	client := computing.NewFromConfig(cfg)

	params := &computing.NiftyDescribeElasticLoadBalancersInput{
		ElasticLoadBalancers: &types.RequestElasticLoadBalancers{
			ListOfRequestElasticLoadBalancerId: []string{
				"fake-id",
			},
		},
	}

	_, err := client.NiftyDescribeElasticLoadBalancers(ctx, params)
	if err == nil {
		t.Fatalf("expect request to fail")
	}
}
