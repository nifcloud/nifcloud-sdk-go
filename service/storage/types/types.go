// Code generated by smithy-go-codegen DO NOT EDIT.


package types

import (
	smithydocument "github.com/aws/smithy-go/document"
	"time"
)

type AccessControlList struct {
	
	Grant *Grant
	
	noSmithyDocumentSerde
}

type AccessControlListOfGetBucketACL struct {
	
	Grantee *Grantee
	
	Permission *string
	
	noSmithyDocumentSerde
}

type And struct {
	
	Tag []Tag
	
	noSmithyDocumentSerde
}

type Buckets struct {
	
	CreationDate *time.Time
	
	Name *string
	
	noSmithyDocumentSerde
}

type Contents struct {
	
	ETag *string
	
	Key *string
	
	LastModified *time.Time
	
	Owner *Owner
	
	Size *string
	
	StorageClass *string
	
	noSmithyDocumentSerde
}

type CORSRule struct {
	
	AllowedHeader *string
	
	AllowedMethod []string
	
	AllowedOrigin *string
	
	ExposeHeader *string
	
	MaxAgeSeconds *int32
	
	noSmithyDocumentSerde
}

type Deleted struct {
	
	Key *string
	
	VersionId *string
	
	noSmithyDocumentSerde
}

type Expiration struct {
	
	Date *time.Time
	
	Days *int32
	
	noSmithyDocumentSerde
}

type Filter struct {
	
	And *And
	
	noSmithyDocumentSerde
}

type Grant struct {
	
	Grantee *Grantee
	
	Permission *string
	
	noSmithyDocumentSerde
}

type Grantee struct {
	
	DisplayName *string
	
	ID *string
	
	noSmithyDocumentSerde
}

type Initiator struct {
	
	DisplayName *string
	
	ID *string
	
	noSmithyDocumentSerde
}

type NoncurrentVersionExpiration struct {
	
	NoncurrentDays *int32
	
	noSmithyDocumentSerde
}

type Owner struct {
	
	DisplayName *string
	
	ID *string
	
	noSmithyDocumentSerde
}

type Part struct {
	
	ETag *string
	
	LastModified *time.Time
	
	PartNumber *int32
	
	Size *int32
	
	noSmithyDocumentSerde
}

type RequestAnd struct {
	
	ListOfRequestTag []RequestTag
	
	noSmithyDocumentSerde
}

type RequestCompleteMultipartUpload struct {
	
	// This member is required.
	ListOfRequestPart []RequestPart
	
	noSmithyDocumentSerde
}

type RequestCORSConfiguration struct {
	
	// This member is required.
	ListOfRequestCORSRule []RequestCORSRule
	
	noSmithyDocumentSerde
}

type RequestCORSRule struct {
	
	// This member is required.
	AllowedOrigin *string
	
	// This member is required.
	ListOfRequestAllowedMethod []string
	
	AllowedHeader *string
	
	ExposeHeader *string
	
	ID *string
	
	MaxAgeSeconds *int32
	
	noSmithyDocumentSerde
}

type RequestDelete struct {
	
	// This member is required.
	ListOfRequestObject []RequestObject
	
	noSmithyDocumentSerde
}

type RequestExpiration struct {
	
	Date *time.Time
	
	Days *int32
	
	noSmithyDocumentSerde
}

type RequestFilter struct {
	
	RequestAnd *RequestAnd
	
	noSmithyDocumentSerde
}

type RequestLifecycleConfiguration struct {
	
	// This member is required.
	ListOfRequestRule []RequestRule
	
	noSmithyDocumentSerde
}

type RequestNoncurrentVersionExpiration struct {
	
	NoncurrentDays *int32
	
	noSmithyDocumentSerde
}

type RequestObject struct {
	
	// This member is required.
	Key *string
	
	Quiet *bool
	
	VersionId *string
	
	noSmithyDocumentSerde
}

type RequestPart struct {
	
	// This member is required.
	ETag *string
	
	// This member is required.
	PartNumber *int32
	
	noSmithyDocumentSerde
}

type RequestRule struct {
	
	// This member is required.
	ID *string
	
	Prefix *string
	
	RequestExpiration *RequestExpiration
	
	RequestFilter *RequestFilter
	
	RequestNoncurrentVersionExpiration *RequestNoncurrentVersionExpiration
	
	Status StatusOfLifecycleConfigurationForPutBucketLifecycleConfiguration
	
	noSmithyDocumentSerde
}

type RequestTag struct {
	
	Key *string
	
	Value *string
	
	noSmithyDocumentSerde
}

type RequestTagging struct {
	
	RequestTagSet *RequestTagSet
	
	noSmithyDocumentSerde
}

type RequestTaggingOfPutBucketTagging struct {
	
	ListOfRequestTagSet []RequestTagSet
	
	noSmithyDocumentSerde
}

type RequestTagSet struct {
	
	RequestTag *RequestTag
	
	noSmithyDocumentSerde
}

type RequestVersioningConfiguration struct {
	
	Status StatusOfVersioningConfigurationForPutBucketVersioning
	
	noSmithyDocumentSerde
}

type Rule struct {
	
	Expiration *Expiration
	
	Filter *Filter
	
	ID *string
	
	NoncurrentVersionExpiration *NoncurrentVersionExpiration
	
	Prefix *string
	
	Status *string
	
	noSmithyDocumentSerde
}

type Tag struct {
	
	Key *string
	
	Value *string
	
	noSmithyDocumentSerde
}

type TagSet struct {
	
	Tag *Tag
	
	noSmithyDocumentSerde
}

type TagSetOfGetBucketTagging struct {
	
	Key *string
	
	Value *string
	
	noSmithyDocumentSerde
}

type Upload struct {
	
	Initiated *time.Time
	
	Initiator *Initiator
	
	Key *string
	
	Owner *Owner
	
	StorageClass *string
	
	UploadId *string
	
	noSmithyDocumentSerde
}

type Version struct {
	
	ETag *string
	
	IsLatest *bool
	
	Key *string
	
	LastModified *time.Time
	
	Owner *Owner
	
	Size *string
	
	StorageClass *string
	
	VersionId *string
	
	noSmithyDocumentSerde
}

type noSmithyDocumentSerde = smithydocument.NoSerde
