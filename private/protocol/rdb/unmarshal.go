package rdb

import (
	"encoding/xml"
	"io"

	request "github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/awserr"
	"github.com/nifcloud/nifcloud-sdk-go/private/protocol/xml/xmlutil"
)

// UnmarshalHandler is a named request handler for unmarshaling rdb protocol requests
var UnmarshalHandler = request.NamedHandler{Name: "nifcloudsdk.rdb.Unmarshal", Fn: Unmarshal}

// UnmarshalMetaHandler is a named request handler for unmarshaling rdb protocol request metadata
var UnmarshalMetaHandler = request.NamedHandler{Name: "nifcloudsdk.rdb.UnmarshalMeta", Fn: UnmarshalMeta}

// UnmarshalErrorHandler is a named request handler for unmarshaling rdb protocol request errors
var UnmarshalErrorHandler = request.NamedHandler{Name: "nifcloudsdk.rdb.UnmarshalError", Fn: UnmarshalError}

// Unmarshal unmarshals a response body for the RDB protocol.
func Unmarshal(r *request.Request) {
	defer func() {
		err := r.HTTPResponse.Body.Close()
		if err != nil {
			r.Error = awserr.New("CloseError", "failed to close response body", err)
		}
	}()

	decoder := xml.NewDecoder(r.HTTPResponse.Body)
	err := xmlutil.UnmarshalXML(r.Data, decoder, r.Operation.Name+"Result")
	if err != nil {
		r.Error = awserr.New("SerializationError", "failed decoding RDB response", err)
		return
	}
}

// UnmarshalMeta unmarshals response headers for the RDB protocol.
func UnmarshalMeta(r *request.Request) {
	// TODO implement unmarshaling of request IDs
}

type xmlErrorResponse struct {
	XMLName   xml.Name `xml:"ErrorResponse"`
	Code      string   `xml:"Error>Code"`
	Message   string   `xml:"Error>Message"`
	RequestID string   `xml:"RequestId"`
}

// UnmarshalError unmarshals a response error for the RDB protocol.
func UnmarshalError(r *request.Request) {
	defer func() {
		err := r.HTTPResponse.Body.Close()
		if err != nil {
			r.Error = awserr.New("CloseError", "failed to close response body", err)
		}
	}()

	resp := &xmlErrorResponse{}
	err := xml.NewDecoder(r.HTTPResponse.Body).Decode(resp)
	if err != nil && err != io.EOF {
		r.Error = awserr.New("SerializationError", "failed decoding RDB error response", err)
	} else {
		r.Error = awserr.NewRequestFailure(
			awserr.New(resp.Code, resp.Message, nil),
			r.HTTPResponse.StatusCode,
			resp.RequestID,
		)
	}
}
