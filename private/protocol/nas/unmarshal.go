package nas

import (
	"encoding/xml"
	"io"

	request "github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/awserr"
	"github.com/nifcloud/nifcloud-sdk-go/private/protocol/xml/xmlutil"
)

// UnmarshalHandler is a named request handler for unmarshaling nas protocol requests
var UnmarshalHandler = request.NamedHandler{Name: "nifcloudsdk.nas.Unmarshal", Fn: Unmarshal}

// UnmarshalMetaHandler is a named request handler for unmarshaling nas protocol request metadata
var UnmarshalMetaHandler = request.NamedHandler{Name: "nifcloudsdk.nas.UnmarshalMeta", Fn: UnmarshalMeta}

// UnmarshalErrorHandler is a named request handler for unmarshaling nas protocol request errors
var UnmarshalErrorHandler = request.NamedHandler{Name: "nifcloudsdk.nas.UnmarshalError", Fn: UnmarshalError}

// Unmarshal unmarshals a response body for the NAS protocol.
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
		r.Error = awserr.New("SerializationError", "failed decoding NAS response", err)
		return
	}
}

// UnmarshalMeta unmarshals response headers for the NAS protocol.
func UnmarshalMeta(r *request.Request) {
	// TODO implement unmarshaling of request IDs
}

type xmlErrorResponse struct {
	XMLName   xml.Name `xml:"ErrorResponse"`
	Code      string   `xml:"Error>Code"`
	Message   string   `xml:"Error>Message"`
	RequestID string   `xml:"RequestId"`
}

// UnmarshalError unmarshals a response error for the NAS protocol.
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
		r.Error = awserr.New("SerializationError", "failed decoding NAS error response", err)
	} else {
		r.Error = awserr.NewRequestFailure(
			awserr.New(resp.Code, resp.Message, nil),
			r.HTTPResponse.StatusCode,
			resp.RequestID,
		)
	}
}
