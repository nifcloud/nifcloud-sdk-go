// +build tools

package main

import (
	_ "github.com/aws/aws-sdk-go-v2/private/model/cli/gen-api"
	_ "github.com/aws/aws-sdk-go-v2/private/model/cli/gen-endpoints"
	_ "github.com/golangci/golangci-lint/cmd/golangci-lint"
)
