// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package ess

import (
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

var _ aws.Config
var _ = nifcloudutil.Prettify

type DkimAttributes struct {
	_ struct{} `type:"structure"`

	Key *string `locationName:"key" type:"string"`

	Value *ValueOfGetIdentityDkimAttributes `locationName:"value" type:"structure"`
}

// String returns the string representation
func (s DkimAttributes) String() string {
	return nifcloudutil.Prettify(s)
}

type RequestBody struct {
	_ struct{} `type:"structure"`

	RequestHtml *RequestHtml `locationName:"Html" type:"structure"`

	RequestText *RequestText `locationName:"Text" type:"structure"`
}

// String returns the string representation
func (s RequestBody) String() string {
	return nifcloudutil.Prettify(s)
}

type RequestDestination struct {
	_ struct{} `type:"structure"`

	ListOfRequestBccAddresses []string `locationName:"BccAddresses" locationNameList:"member" type:"list"`

	ListOfRequestCcAddresses []string `locationName:"CcAddresses" locationNameList:"member" type:"list"`

	ListOfRequestToAddresses []string `locationName:"ToAddresses" locationNameList:"member" type:"list"`
}

// String returns the string representation
func (s RequestDestination) String() string {
	return nifcloudutil.Prettify(s)
}

type RequestHtml struct {
	_ struct{} `type:"structure"`

	Charset *string `locationName:"Charset" type:"string"`

	Data *string `locationName:"Data" type:"string"`
}

// String returns the string representation
func (s RequestHtml) String() string {
	return nifcloudutil.Prettify(s)
}

type RequestMessage struct {
	_ struct{} `type:"structure"`

	RequestBody *RequestBody `locationName:"Body" type:"structure"`

	RequestSubject *RequestSubject `locationName:"Subject" type:"structure"`
}

// String returns the string representation
func (s RequestMessage) String() string {
	return nifcloudutil.Prettify(s)
}

type RequestRawMessage struct {
	_ struct{} `type:"structure"`

	// Data is a required field
	Data *string `locationName:"Data" type:"string" required:"true"`
}

// String returns the string representation
func (s RequestRawMessage) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *RequestRawMessage) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "RequestRawMessage"}

	if s.Data == nil {
		invalidParams.Add(aws.NewErrParamRequired("Data"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type RequestSubject struct {
	_ struct{} `type:"structure"`

	Charset *string `locationName:"Charset" type:"string"`

	Data *string `locationName:"Data" type:"string"`
}

// String returns the string representation
func (s RequestSubject) String() string {
	return nifcloudutil.Prettify(s)
}

type RequestText struct {
	_ struct{} `type:"structure"`

	Charset *string `locationName:"Charset" type:"string"`

	Data *string `locationName:"Data" type:"string"`
}

// String returns the string representation
func (s RequestText) String() string {
	return nifcloudutil.Prettify(s)
}

type ResponseMetadata struct {
	_ struct{} `type:"structure"`

	RequestId *string `locationName:"RequestId" type:"string"`
}

// String returns the string representation
func (s ResponseMetadata) String() string {
	return nifcloudutil.Prettify(s)
}

type SendDataPoints struct {
	_ struct{} `type:"structure"`

	Bounces *int64 `locationName:"Bounces" type:"integer"`

	Complaints *int64 `locationName:"Complaints" type:"integer"`

	DeliveryAttempts *int64 `locationName:"DeliveryAttempts" type:"integer"`

	Rejects *int64 `locationName:"Rejects" type:"integer"`

	Timestamp *time.Time `locationName:"Timestamp" type:"timestamp"`
}

// String returns the string representation
func (s SendDataPoints) String() string {
	return nifcloudutil.Prettify(s)
}

type Value struct {
	_ struct{} `type:"structure"`

	VerificationStatus *string `locationName:"VerificationStatus" type:"string"`

	VerificationToken *string `locationName:"VerificationToken" type:"string"`
}

// String returns the string representation
func (s Value) String() string {
	return nifcloudutil.Prettify(s)
}

type ValueOfGetIdentityDkimAttributes struct {
	_ struct{} `type:"structure"`

	DkimEnabled *bool `locationName:"DkimEnabled" type:"boolean"`

	DkimTokens []string `locationName:"DkimTokens" locationNameList:"member" type:"list"`

	DkimVerificationStatus *string `locationName:"DkimVerificationStatus" type:"string"`
}

// String returns the string representation
func (s ValueOfGetIdentityDkimAttributes) String() string {
	return nifcloudutil.Prettify(s)
}

type VerificationAttributes struct {
	_ struct{} `type:"structure"`

	Key *string `locationName:"key" type:"string"`

	Value *Value `locationName:"value" type:"structure"`
}

// String returns the string representation
func (s VerificationAttributes) String() string {
	return nifcloudutil.Prettify(s)
}