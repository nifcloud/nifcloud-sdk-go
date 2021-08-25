package ess

import (
	"bytes"
	"encoding/xml"
	"io"
	"io/ioutil"

	request "github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/awserr"
	"github.com/nifcloud/nifcloud-sdk-go/private/protocol/xml/xmlutil"
)

// UnmarshalHandler is a named request handler for unmarshaling ess protocol requests
var UnmarshalHandler = request.NamedHandler{Name: "nifcloudsdk.ess.Unmarshal", Fn: Unmarshal}

// UnmarshalMetaHandler is a named request handler for unmarshaling ess protocol request metadata
var UnmarshalMetaHandler = request.NamedHandler{Name: "nifcloudsdk.ess.UnmarshalMeta", Fn: UnmarshalMeta}

// UnmarshalErrorHandler is a named request handler for unmarshaling ess protocol request errors
var UnmarshalErrorHandler = request.NamedHandler{Name: "nifcloudsdk.ess.UnmarshalError", Fn: UnmarshalError}

// Unmarshal unmarshals a response body for the ess protocol.
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
		r.Error = awserr.New("SerializationError", "failed decoding ESS response", err)
		return
	}
}

type responseMetadata struct {
	ResponseMetadata struct {
		RequestID string `xml:"RequestId"`
	} `xml:"ResponseMetadata"`
}

// UnmarshalMeta unmarshals response headers for the ESS protocol.
func UnmarshalMeta(r *request.Request) {
	bodyBytes, err := ioutil.ReadAll(r.HTTPResponse.Body)
	if err != nil && err != io.EOF {
		r.Error = awserr.New("ReadError", "failed decoding ess response meta data", err)
		return
	}

	buf := bytes.NewBuffer(bodyBytes)

	resp := &responseMetadata{}
	err = xml.NewDecoder(buf).Decode(resp)
	if err != nil && err != io.EOF {
		r.Error = awserr.New("SerializationError", "failed decoding ess response meta data", err)
		return
	}

	if resp.ResponseMetadata.RequestID != "" {
		r.RequestID = resp.ResponseMetadata.RequestID
	}
	r.HTTPResponse.Body = ioutil.NopCloser(bytes.NewBuffer(bodyBytes))
}

type xmlErrorResponse struct {
	XMLName   xml.Name `xml:"ErrorResponse"`
	Code      string   `xml:"Error>Code"`
	Message   string   `xml:"Error>Message"`
	RequestID string   `xml:"RequestId"`
}

// UnmarshalError unmarshals a response error for the ess protocol.
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
		r.Error = awserr.New("SerializationError", "failed decoding ESS error response", err)
	} else {
		r.Error = awserr.NewRequestFailure(
			awserr.New(resp.Code, resp.Message, nil),
			r.HTTPResponse.StatusCode,
			resp.RequestID,
		)
	}
}
