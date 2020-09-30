// Package rdb provides serialization of NIFCLOUD RDB requests and responses.
package rdb

import (
	"net/url"
	"time"

	request "github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/awserr"
	"github.com/nifcloud/nifcloud-sdk-go/private/protocol/query/queryutil"
)

const (
	timestampLayout        = "2006-01-02T15:04:05Z"
	convertTimestampLayout = "2006-01-02 15:04"
)

// BuildHandler is a named request handler for building rdb protocol requests
var BuildHandler = request.NamedHandler{Name: "nifcloudsdk.rdb.Build", Fn: Build}

// Build builds a request for the rdb protocol.
func Build(r *request.Request) {
	body := url.Values{
		"Action":  {r.Operation.Name},
		"Version": {r.Metadata.APIVersion},
	}

	if err := queryutil.Parse(body, r.Params, false); err != nil {
		r.Error = awserr.New("SerializationError", "failed encoding NIFCLOUD RDB request", err)
	}

	// Fix request parameters of NiftyGetMetricStatistics for NIFCLOUD
	if r.Operation.Name == "NiftyGetMetricStatistics" {
		startTime := body.Get("StartTime")
		endTime := body.Get("EndTime")
		if startTime != "" {
			body.Set("StartTime", ConvertTime(startTime))
		}
		if endTime != "" {
			body.Set("EndTime", ConvertTime(endTime))
		}
	}

	r.SetBufferBody([]byte(body.Encode()))
}

// ConvertTime from %Y-%m-%dT%H:%M:%SZ to %Y-%m-%d %H:%M
func ConvertTime(operationTime string) string {
	operationTimeISO8601, _ := time.Parse(timestampLayout, operationTime)
	operationTimeConvert := operationTimeISO8601.Format(convertTimestampLayout)
	return operationTimeConvert
}
