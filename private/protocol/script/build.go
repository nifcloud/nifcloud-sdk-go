// Package script provides serialization of NIFCLOUD Script requests and responses.
package script

import (
	"fmt"
	"net/url"

	request "github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/awserr"
	"github.com/nifcloud/nifcloud-sdk-go/private/protocol/query/queryutil"
)

// BuildHandler is a named request handler for building script protocol requests
var BuildHandler = request.NamedHandler{Name: "nifcloudsdk.script.Build", Fn: Build}

// Build builds a request for the script protocol.
func Build(r *request.Request) {
	body := url.Values{}
	if err := queryutil.Parse(body, r.Params, true); err != nil {
		r.Error = awserr.New("SerializationError", "failed encoding NIFCLOUD Script request", err)
	}

	r.HTTPRequest.Method = "POST"
	r.HTTPRequest.Header.Set("Content-Type", "application/x-www-form-urlencoded; charset=utf-8")
	r.HTTPRequest.Header.Set("X-Amz-Target", fmt.Sprintf("%s.%s", r.Metadata.TargetPrefix, r.Operation.Name))
	r.SetBufferBody([]byte(body.Encode()))
}
