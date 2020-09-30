// Package endpoints contains the models for endpoints that should be used
// to generate endpoint definition files for the SDK.
package endpoints

//go:generate ../../bin/gen-endpoints -model ./endpoints.json -out ../../nifcloud/endpoints/defaults.go
//go:generate gofmt -s -w ../../nifcloud/endpoints
