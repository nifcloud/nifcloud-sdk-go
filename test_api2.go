package main

import (
	"context"
	"fmt"

	"github.com/nifcloud/nifcloud-sdk-go/service/serviceactivity"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
)

func main() {
	// Create config with credentials and region.
	cfg := nifcloud.NewConfig(
		"USNDJEO8JJMITZZN4Y5Z",
		"oQv4bfI7pPMTfMvrihOIWljGISENOoAAa7S3tRul",
		"jp-east-1",
	)

	// Create the Computing client with Config value.
	svc := serviceactivity.NewFromConfig(cfg)

	// Send the request
	resp, err := svc.DescribeServiceStatuses(context.TODO(), nil)
	if err != nil {
		panic(err)
	}
	// Send the request
	fmt.Println("Instances:")
	for _, serviceMenu := range resp.Data.ServiceMenu {

		fmt.Println(nifcloud.ToString(serviceMenu.Name))
	}
}
