package computing

import (
	"bytes"
	"encoding/xml"
	"io"
	"io/ioutil"

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
	err := xmlutil.UnmarshalXML(r.Data, decoder, r.Operation.Name)
	if err != nil {
		r.Error = awserr.New("SerializationError", "failed decoding computing response", err)
		return
	}
}

type responseMetadata struct {
	RequestID        string `xml:"requestId"`
	ResponseMetadata struct {
		RequestID string `xml:"RequestId"`
	} `xml:"ResponseMetadata"`
}

// UnmarshalMeta unmarshals response headers for the EC2 protocol.
func UnmarshalMeta(r *request.Request) {
	bodyBytes, err := ioutil.ReadAll(r.HTTPResponse.Body)
	if err != nil && err != io.EOF {
		r.Error = awserr.New("ReadError", "failed decoding computing response meta data", err)
		return
	}

	buf := bytes.NewBuffer(bodyBytes)

	resp := &responseMetadata{}
	err = xml.NewDecoder(buf).Decode(resp)
	if err != nil && err != io.EOF {
		r.Error = awserr.New("SerializationError", "failed decoding computing response meta data", err)
		return
	}

	if resp.RequestID != "" {
		r.RequestID = resp.RequestID
	}

	// for Loadbalancer API
	if resp.ResponseMetadata.RequestID != "" {
		r.RequestID = resp.ResponseMetadata.RequestID
	}
	r.HTTPResponse.Body = ioutil.NopCloser(bytes.NewBuffer(bodyBytes))
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
