#!/usr/bin/env bash

set -xe

SDK_ROOT=$1
CODGEN_ROOT=$2

REPOTOOLS_VERSION="${REPOTOOLS_VERSION:-latest}"

cd "$SDK_ROOT"
go run github.com/awslabs/aws-go-multi-module-repository-tools/cmd/gomodgen@${REPOTOOLS_VERSION} -build "$CODGEN_ROOT"
find ./service -name go.mod -type f -delete
go run github.com/awslabs/aws-go-multi-module-repository-tools/cmd/updatemodulemeta@${REPOTOOLS_VERSION}
