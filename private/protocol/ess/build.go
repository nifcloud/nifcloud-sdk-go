// Package ess provides serialization of NIFCLOUD ESS requests and responses.
package ess

import (
	"net/url"
	"time"

	request "github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/awserr"
	"github.com/nifcloud/nifcloud-sdk-go/private/protocol/query/queryutil"
)

const (
	timestampLayout        = "2006-01-02T15:04:05Z"
	convertTimestampLayout = "2006-01-02T15:04"
)

// BuildHandler is a named request handler for building ess protocol requests
var BuildHandler = request.NamedHandler{Name: "nifcloudsdk.ess.Build", Fn: Build}

// Build builds a request for the ess protocol.
func Build(r *request.Request) {
	body := url.Values{
		"Action":  {r.Operation.Name},
		"Version": {r.Metadata.APIVersion},
	}

	if err := queryutil.Parse(body, r.Params, false); err != nil {
		r.Error = awserr.New("SerializationError", "failed encoding NIFCLOUD ESS request", err)
	}

	// Fix request parameters of GetDeliveryLog for NIFCLOUD
	if r.Operation.Name == "GetDeliveryLog" {
		startDate := body.Get("StartDate")
		endDate := body.Get("EndDate")
		if startDate != "" {
			body.Set("StartDate", ConvertDate(startDate))
		}
		if endDate != "" {
			body.Set("EndDate", ConvertDate(endDate))
		}
	}

	r.SetBufferBody([]byte(body.Encode()))
}

// ConvertDate from %Y-%m-%dT%H:%M:%SZ to %Y-%m-%dT%H:%M
func ConvertDate(operationTime string) string {
	operationTimeISO8601, _ := time.Parse(timestampLayout, operationTime)
	operationTimeConvert := operationTimeISO8601.Format(convertTimestampLayout)
	return operationTimeConvert
}
