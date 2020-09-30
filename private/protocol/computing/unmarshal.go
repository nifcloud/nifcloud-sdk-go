package computing

import (
	"encoding/xml"
	"io"

	request "github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/awserr"
	"github.com/nifcloud/nifcloud-sdk-go/private/protocol/xml/xmlutil"
)

// UnmarshalHandler is a named request handler for unmarshaling computing protocol requests
var UnmarshalHandler = request.NamedHandler{Name: "awssdk.computing.Unmarshal", Fn: Unmarshal}

// UnmarshalMetaHandler is a named request handler for unmarshaling computing protocol request metadata
var UnmarshalMetaHandler = request.NamedHandler{Name: "awssdk.computing.UnmarshalMeta", Fn: UnmarshalMeta}

// UnmarshalErrorHandler is a named request handler for unmarshaling computing protocol request errors
var UnmarshalErrorHandler = request.NamedHandler{Name: "awssdk.computing.UnmarshalError", Fn: UnmarshalError}

// Unmarshal unmarshals a response body for the EC2 protocol.
func Unmarshal(r *request.Request) {
	defer func() {
		err := r.HTTPResponse.Body.Close()
		if err != nil {
			r.Error = awserr.New("CloseError", "failed to close response body", err)
		}
	}()

	decoder := xml.NewDecoder(r.HTTPResponse.Body)
	err := xmlutil.UnmarshalXML(r.Data, decoder, "")
	if err != nil {
		r.Error = awserr.New("SerializationError", "failed decoding computing response", err)
		return
	}
}

// UnmarshalMeta unmarshals response headers for the EC2 protocol.
func UnmarshalMeta(r *request.Request) {
	// TODO implement unmarshaling of request IDs
}

type xmlErrorResponse struct {
	XMLName   xml.Name `xml:"Response"`
	Code      string   `xml:"Errors>Error>Code"`
	Message   string   `xml:"Errors>Error>Message"`
	RequestID string   `xml:"RequestID"`
}

// UnmarshalError unmarshals a response error for the EC2 protocol.
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
		r.Error = awserr.New("SerializationError", "failed decoding computing error response", err)
	} else {
		r.Error = awserr.NewRequestFailure(
			awserr.New(resp.Code, resp.Message, nil),
			r.HTTPResponse.StatusCode,
			resp.RequestID,
		)
	}
}
