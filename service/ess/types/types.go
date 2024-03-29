// Code generated by smithy-go-codegen DO NOT EDIT.


package types

import (
	smithydocument "github.com/aws/smithy-go/document"
	"time"
)

type DkimAttributes struct {
	
	Key *string
	
	Value *ValueOfGetIdentityDkimAttributes
	
	noSmithyDocumentSerde
}

type RequestBody struct {
	
	RequestHtml *RequestHtml
	
	RequestText *RequestText
	
	noSmithyDocumentSerde
}

type RequestDestination struct {
	
	ListOfRequestBccAddresses []string
	
	ListOfRequestCcAddresses []string
	
	ListOfRequestToAddresses []string
	
	noSmithyDocumentSerde
}

type RequestHtml struct {
	
	Charset *string
	
	Data *string
	
	noSmithyDocumentSerde
}

type RequestMessage struct {
	
	RequestBody *RequestBody
	
	RequestSubject *RequestSubject
	
	noSmithyDocumentSerde
}

type RequestRawMessage struct {
	
	// This member is required.
	Data *string
	
	noSmithyDocumentSerde
}

type RequestSubject struct {
	
	Charset *string
	
	Data *string
	
	noSmithyDocumentSerde
}

type RequestText struct {
	
	Charset *string
	
	Data *string
	
	noSmithyDocumentSerde
}

type ResponseMetadata struct {
	
	RequestId *string
	
	noSmithyDocumentSerde
}

type SendDataPoints struct {
	
	Bounces *int32
	
	Complaints *int32
	
	DeliveryAttempts *int32
	
	Rejects *int32
	
	Timestamp *time.Time
	
	noSmithyDocumentSerde
}

type Value struct {
	
	VerificationStatus *string
	
	VerificationToken *string
	
	noSmithyDocumentSerde
}

type ValueOfGetIdentityDkimAttributes struct {
	
	DkimEnabled *bool
	
	DkimTokens []string
	
	DkimVerificationStatus *string
	
	noSmithyDocumentSerde
}

type VerificationAttributes struct {
	
	Key *string
	
	Value *Value
	
	noSmithyDocumentSerde
}

type noSmithyDocumentSerde = smithydocument.NoSerde
