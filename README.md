# NIFCLOUD SDK for Go

![build](https://github.com/nifcloud/nifcloud-sdk-go/workflows/Build/badge.svg)
[![Github stars](https://img.shields.io/github/stars/nifcloud/nifcloud-sdk-go)](https://github.com/nifcloud/nifcloud-sdk-go/stargazers)
[![Github top language](https://img.shields.io/github/languages/top/nifcloud/nifcloud-sdk-go)](https://github.com/nifcloud/nifcloud-sdk-go/)
[![Github license](https://img.shields.io/github/license/nifcloud/nifcloud-sdk-go)](https://github.com/nifcloud/nifcloud-sdk-go/)

nifcloud-sdk-go is data-driven SDK for the Go programming language.
It works by feeding AWS-SDK-compatible model JSONs to [github.com/aws/aws-sdk-go-v2](https://github.com/aws/aws-sdk-go-v2).

## Features

* :heavy_check_mark: Support for NIFCLOUD Computing / RDB / NAS / ESS / DNS / ObjectStorageService / ServiceActivity APIs
* :heavy_check_mark: AWS-SDK-compatible data-driven architecture

# Getting started

## Requirements

* Go 1.17 or later.

## Installing

```sh
go get -u github.com/nifcloud/nifcloud-sdk-go
```

## Example

This example shows [DescribeInstances](https://pfs.nifcloud.com/api/rest/DescribeInstances.htm).

```go
package main

import (
        "fmt"
        "context"

        "github.com/nifcloud/nifcloud-sdk-go/nifcloud"
        "github.com/nifcloud/nifcloud-sdk-go/service/computing"
)

func main() {
    // Create config with credentials and region.
    cfg := nifcloud.NewConfig(
            "YOUR_ACCESS_KEY_ID",
            "YOUR_SECRET_ACCESS_KEY",
            "jp-east-1",
    )

    // Create the Computing client with Config value.
    svc := computing.NewFromConfig(cfg)

    // Send the request
    resp, err := svc.DescribeInstances(context.TODO(), nil)
    if err != nil {
            panic(err)
    }
    
    fmt.Println("Instances:")
    for _, reservationSet := range resp.ReservationSet {
        for _, instancesSet := range reservationSet.InstancesSet {
            fmt.Println(nifcloud.ToString(instancesSet.InstanceId))
        }
    }
}
```

## Resources

- [API References](https://pfs.nifcloud.com/api/)

## LICENCES

See [LICENSE](LICENSE).
