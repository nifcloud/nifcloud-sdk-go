// Package nas provides serialization of NIFCLOUD NAS requests and responses.
package nas

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

// BuildHandler is a named request handler for building nas protocol requests
var BuildHandler = request.NamedHandler{Name: "nifcloudsdk.nas.Build", Fn: Build}

// Build builds a request for the nas protocol.
func Build(r *request.Request) {
	body := url.Values{
		"Action":  {r.Operation.Name},
		"Version": {r.Metadata.APIVersion},
	}

	if err := queryutil.Parse(body, r.Params, false); err != nil {
		r.Error = awserr.New("SerializationError", "failed encoding NIFCLOUD NAS request", err)
	}

	// Fix request parameters of GetMetricStatistics for NIFCLOUD
	if r.Operation.Name == "GetMetricStatistics" {
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
