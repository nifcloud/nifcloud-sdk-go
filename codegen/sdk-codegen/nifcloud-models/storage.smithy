namespace com.nifcloud.api.storage

use aws.auth#sigv4
use aws.api#service
use aws.protocols#restJson1
use aws.protocols#restXml
use aws.protocols#awsQuery
use aws.protocols#ec2Query
use smithy.waiters#waitable
use aws.protocols#ec2QueryName


@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzServerSideEncryptionCustomerAlgorithmOfGetObjectRequest

structure GetObjectRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpQuery("partNumber")
    @xmlName("partNumber")
    PartNumber: String,
    @httpHeader("Range")
    @xmlName("Range")
    Range: String,
    @httpQuery("response-content-disposition")
    @xmlName("response-content-disposition")
    ResponseContentDisposition: String,
    @httpQuery("response-content-encoding")
    @xmlName("response-content-encoding")
    ResponseContentEncoding: String,
    @httpQuery("response-content-type")
    @xmlName("response-content-type")
    ResponseContentType: String,
    @httpQuery("versionId")
    @xmlName("versionId")
    VersionId: String,
    @httpHeader("x-amz-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-server-side-encryption-customer-algorithm")
    XAmzServerSideEncryptionCustomerAlgorithm: XAmzServerSideEncryptionCustomerAlgorithmOfGetObjectRequest,
    @httpHeader("x-amz-server-side-encryption-customer-key")
    @xmlName("x-amz-server-side-encryption-customer-key")
    XAmzServerSideEncryptionCustomerKey: String,
    @httpHeader("x-amz-server-side-encryption-customer-key-MD5")
    @xmlName("x-amz-server-side-encryption-customer-key-MD5")
    XAmzServerSideEncryptionCustomerKeyMd5: String,
}

structure GetObjectResult {
    @httpHeader("Accept-Ranges")
    @xmlName("Accept-Ranges")
    AcceptRanges: String,
    @httpPayload
    @xmlName("Body")
    Body: Blob,
    @httpHeader("Content-Range")
    @xmlName("Content-Range")
    ContentRange: String,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @httpHeader("ETag")
    @xmlName("ETag")
    ETag: String,
    @httpHeader("Last-Modified")
    @xmlName("Last-Modified")
    LastModified: String,
    @httpHeader("x-amz-expiration")
    @xmlName("x-amz-expiration")
    XAmzExpiration: String,
    @httpHeader("x-amz-mp-parts-count")
    @xmlName("x-amz-mp-parts-count")
    XAmzMpPartsCount: String,
    @httpHeader("x-amz-server-side-encryption")
    @xmlName("x-amz-server-side-encryption")
    XAmzServerSideEncryption: String,
}

structure GetObjectACLRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpQuery("versionId")
    @xmlName("versionId")
    VersionId: String,
}

structure GetObjectACLResult {
    @xmlName("AccessControlList")
    AccessControlList: AccessControlList,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("Owner")
    Owner: Owner,
}

structure Owner {
    @xmlName("DisplayName")
    DisplayName: String,
    @xmlName("ID")
    ID: String,
}

structure AccessControlList {
    @xmlName("Grant")
    Grant: Grant,
}

structure Grant {
    @xmlName("Grantee")
    Grantee: Grantee,
    @xmlName("Permission")
    Permission: String,
}

structure Grantee {
    @xmlName("DisplayName")
    DisplayName: String,
    @xmlName("ID")
    ID: String,
}

@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzServerSideEncryptionCustomerAlgorithmOfHeadObjectRequest

structure HeadObjectRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Consistency-Control")
    @xmlName("Consistency-Control")
    ConsistencyControl: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpQuery("partNumber")
    @xmlName("partNumber")
    PartNumber: String,
    @httpQuery("versionId")
    @xmlName("versionId")
    VersionId: String,
    @httpHeader("x-amz-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-server-side-encryption-customer-algorithm")
    XAmzServerSideEncryptionCustomerAlgorithm: XAmzServerSideEncryptionCustomerAlgorithmOfHeadObjectRequest,
    @httpHeader("x-amz-server-side-encryption-customer-key")
    @xmlName("x-amz-server-side-encryption-customer-key")
    XAmzServerSideEncryptionCustomerKey: String,
    @httpHeader("x-amz-server-side-encryption-customer-key-MD5")
    @xmlName("x-amz-server-side-encryption-customer-key-MD5")
    XAmzServerSideEncryptionCustomerKeyMd5: String,
}

structure HeadObjectResult {
    @httpHeader("Accept-Ranges")
    @xmlName("Accept-Ranges")
    AcceptRanges: String,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @httpHeader("ETag")
    @xmlName("ETag")
    ETag: String,
    @httpHeader("Last-Modified")
    @xmlName("Last-Modified")
    LastModified: String,
    @httpHeader("x-amz-expiration")
    @xmlName("x-amz-expiration")
    XAmzExpiration: String,
    @httpHeader("x-amz-mp-parts-count")
    @xmlName("x-amz-mp-parts-count")
    XAmzMpPartsCount: String,
    @httpHeader("x-amz-server-side-encryption")
    @xmlName("x-amz-server-side-encryption")
    XAmzServerSideEncryption: String,
    @httpHeader("x-amz-version-id")
    @xmlName("x-amz-version-id")
    XAmzVersionId: String,
}

@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzServerSideEncryptionOfPutObjectRequest

@enum([
  {
      name: "AWS_CHUNKED",
      value: "aws-chunked",
  },
])
string ContentEncodingOfPutObjectRequest

@enum([
  {
      name: "STANDARD",
      value: "STANDARD",
  },
  {
      name: "REDUCED_REDUNDANCY",
      value: "REDUCED_REDUNDANCY",
  },
])
string XAmzStorageClassOfPutObjectRequest

@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzServerSideEncryptionCustomerAlgorithmOfPutObjectRequest

structure PutObjectRequest {
    @httpPayload
    @xmlName("Body")
    Body: Blob,
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-Disposition")
    @xmlName("Content-Disposition")
    ContentDisposition: String,
    @httpHeader("Content-Encoding")
    @xmlName("Content-Encoding")
    ContentEncoding: ContentEncodingOfPutObjectRequest,
    @httpHeader("Content-MD5")
    @xmlName("Content-MD5")
    ContentMd5: String,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpHeader("x-amz-meta-")
    @xmlName("x-amz-meta-")
    XAmzMeta: String,
    @httpHeader("x-amz-server-side-encryption")
    @xmlName("x-amz-server-side-encryption")
    XAmzServerSideEncryption: XAmzServerSideEncryptionOfPutObjectRequest,
    @httpHeader("x-amz-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-server-side-encryption-customer-algorithm")
    XAmzServerSideEncryptionCustomerAlgorithm: XAmzServerSideEncryptionCustomerAlgorithmOfPutObjectRequest,
    @httpHeader("x-amz-server-side-encryption-customer-key")
    @xmlName("x-amz-server-side-encryption-customer-key")
    XAmzServerSideEncryptionCustomerKey: String,
    @httpHeader("x-amz-server-side-encryption-customer-key-MD5")
    @xmlName("x-amz-server-side-encryption-customer-key-MD5")
    XAmzServerSideEncryptionCustomerKeyMd5: String,
    @httpHeader("x-amz-storage-class")
    @xmlName("x-amz-storage-class")
    XAmzStorageClass: XAmzStorageClassOfPutObjectRequest,
    @httpHeader("x-amz-tagging")
    @xmlName("x-amz-tagging")
    XAmzTagging: String,
}

structure PutObjectResult {
    @httpHeader("ETag")
    @xmlName("ETag")
    ETag: String,
    @httpHeader("x-amz-version-id")
    @xmlName("x-amz-version-id")
    XAmzVersionId: String,
}

@enum([
  {
      name: "COPY",
      value: "COPY",
  },
  {
      name: "REPLACE",
      value: "REPLACE",
  },
])
string XAmzMetadataDirectiveOfPutObjectCopyRequest

@enum([
  {
      name: "STANDARD",
      value: "STANDARD",
  },
  {
      name: "REDUCED_REDUNDANCY",
      value: "REDUCED_REDUNDANCY",
  },
])
string XAmzStorageClassOfPutObjectCopyRequest

@enum([
  {
      name: "COPY",
      value: "COPY",
  },
  {
      name: "REPLACE",
      value: "REPLACE",
  },
])
string XAmzTaggingDirectiveOfPutObjectCopyRequest

@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzServerSideEncryptionCustomerAlgorithmOfPutObjectCopyRequest

@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzCopySourceServerSideEncryptionCustomerAlgorithmOfPutObjectCopyRequest

structure PutObjectCopyRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @required
    @httpHeader("x-amz-copy-source")
    @xmlName("x-amz-copy-source")
    XAmzCopySource: String,
    @httpHeader("x-amz-copy-source-if-match")
    @xmlName("x-amz-copy-source-if-match")
    XAmzCopySourceIfMatch: String,
    @httpHeader("x-amz-copy-source-if-modified-since")
    @xmlName("x-amz-copy-source-if-modified-since")
    XAmzCopySourceIfModifiedSince: String,
    @httpHeader("x-amz-copy-source-if-none-match")
    @xmlName("x-amz-copy-source-if-none-match")
    XAmzCopySourceIfNoneMatch: String,
    @httpHeader("x-amz-copy-source-if-unmodified-since")
    @xmlName("x-amz-copy-source-if-unmodified-since")
    XAmzCopySourceIfUnmodifiedSince: String,
    @httpHeader("x-amz-copy-source-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-copy-source-server-side-encryption-customer-algorithm")
    XAmzCopySourceServerSideEncryptionCustomerAlgorithm: XAmzCopySourceServerSideEncryptionCustomerAlgorithmOfPutObjectCopyRequest,
    @httpHeader("x-amz-copy-source-server-side-encryption-customer-key")
    @xmlName("x-amz-copy-source-server-side-encryption-customer-key")
    XAmzCopySourceServerSideEncryptionCustomerKey: String,
    @httpHeader("x-amz-copy-source-server-side-encryption-customer-key-MD5")
    @xmlName("x-amz-copy-source-server-side-encryption-customer-key-MD5")
    XAmzCopySourceServerSideEncryptionCustomerKeyMd5: String,
    @httpHeader("x-amz-metadata-directive")
    @xmlName("x-amz-metadata-directive")
    XAmzMetadataDirective: XAmzMetadataDirectiveOfPutObjectCopyRequest,
    @httpHeader("x-amz-server-side-encryption")
    @xmlName("x-amz-server-side-encryption")
    XAmzServerSideEncryption: String,
    @httpHeader("x-amz-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-server-side-encryption-customer-algorithm")
    XAmzServerSideEncryptionCustomerAlgorithm: XAmzServerSideEncryptionCustomerAlgorithmOfPutObjectCopyRequest,
    @httpHeader("x-amz-server-side-encryption-customer-key")
    @xmlName("x-amz-server-side-encryption-customer-key")
    XAmzServerSideEncryptionCustomerKey: String,
    @httpHeader("x-amz-server-side-encryption-customer-key-MD5")
    @xmlName("x-amz-server-side-encryption-customer-key-MD5")
    XAmzServerSideEncryptionCustomerKeyMd5: String,
    @httpHeader("x-amz-storage-class")
    @xmlName("x-amz-storage-class")
    XAmzStorageClass: XAmzStorageClassOfPutObjectCopyRequest,
    @httpHeader("x-amz-tagging")
    @xmlName("x-amz-tagging")
    XAmzTagging: String,
    @httpHeader("x-amz-tagging-directive")
    @xmlName("x-amz-tagging-directive")
    XAmzTaggingDirective: XAmzTaggingDirectiveOfPutObjectCopyRequest,
}

structure PutObjectCopyResult {
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("ETag")
    ETag: String,
    @xmlName("LastModified")
    LastModified: Timestamp,
}

structure DeleteObjectRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpQuery("versionId")
    @xmlName("versionId")
    VersionId: String,
}

structure DeleteObjectResult {
    @httpHeader("x-amz-version-id")
    @xmlName("x-amz-version-id")
    XAmzVersionId: String,
}

structure RequestObject {
    @required
    @xmlName("Key")
    Key: String,
    @xmlName("Quiet")
    Quiet: Boolean,
    @xmlName("VersionId")
    VersionId: String,
}

list ListOfRequestObject {
    member: RequestObject,
}

structure RequestDelete {
    @required
    @xmlFlattened
    @xmlName("Object")
    ListOfRequestObject: ListOfRequestObject,
}

structure DeleteMultipleObjectsRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpHeader("Content-MD5")
    @xmlName("Content-MD5")
    ContentMd5: String,
    @required
    @httpPayload
    @xmlName("Delete")
    Delete: RequestDelete,
}

structure DeleteMultipleObjectsResult {
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlFlattened
    @xmlName("Deleted")
    Deleted: ListOfDeleted,
}

structure Deleted {
    @xmlName("Key")
    Key: String,
    @xmlName("VersionId")
    VersionId: String,
}

list ListOfDeleted {
    member: Deleted,
}

structure GetObjectTaggingRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpQuery("versionId")
    @xmlName("versionId")
    VersionId: String,
}

structure GetObjectTaggingResult {
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("TagSet")
    TagSet: TagSet,
    @httpHeader("x-amz-version-id")
    @xmlName("x-amz-version-id")
    XAmzVersionId: String,
}

structure TagSet {
    @xmlName("Tag")
    Tag: Tag,
}

structure Tag {
    @xmlName("Key")
    Key: String,
    @xmlName("Value")
    Value: String,
}

structure RequestTag {
    @xmlName("Key")
    Key: String,
    @xmlName("Value")
    Value: String,
}

structure RequestTagSet {
    @xmlName("Tag")
    RequestTag: RequestTag,
}

structure RequestTagging {
    @xmlName("TagSet")
    RequestTagSet: RequestTagSet,
}

structure PutObjectTaggingRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-MD5")
    @xmlName("Content-MD5")
    ContentMd5: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpPayload
    @xmlName("Tagging")
    Tagging: RequestTagging,
    @httpQuery("versionId")
    @xmlName("versionId")
    VersionId: String,
}

structure PutObjectTaggingResult {
    @httpHeader("x-amz-version-id")
    @xmlName("x-amz-version-id")
    XAmzVersionId: String,
}

structure DeleteObjectTaggingRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpQuery("versionId")
    @xmlName("versionId")
    VersionId: String,
}

structure DeleteObjectTaggingResult {
    @httpHeader("x-amz-version-id")
    @xmlName("x-amz-version-id")
    XAmzVersionId: String,
}

@enum([
  {
      name: "STANDARD",
      value: "STANDARD",
  },
  {
      name: "REDUCED_REDUNDANCY",
      value: "REDUCED_REDUNDANCY",
  },
])
string XAmzStorageClassOfInitiateMultipartUploadRequest

@enum([
  {
      name: "COPY",
      value: "COPY",
  },
  {
      name: "REPLACE",
      value: "REPLACE",
  },
])
string XAmzTaggingOfInitiateMultipartUploadRequest

@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzServerSideEncryptionCustomerAlgorithmOfInitiateMultipartUploadRequest

structure InitiateMultipartUploadRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-Disposition")
    @xmlName("Content-Disposition")
    ContentDisposition: String,
    @httpHeader("Content-Encoding")
    @xmlName("Content-Encoding")
    ContentEncoding: String,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpHeader("x-amz-meta-")
    @xmlName("x-amz-meta-")
    XAmzMeta: String,
    @httpHeader("x-amz-server-side-encryption")
    @xmlName("x-amz-server-side-encryption")
    XAmzServerSideEncryption: String,
    @httpHeader("x-amz-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-server-side-encryption-customer-algorithm")
    XAmzServerSideEncryptionCustomerAlgorithm: XAmzServerSideEncryptionCustomerAlgorithmOfInitiateMultipartUploadRequest,
    @httpHeader("x-amz-server-side-encryption-customer-key")
    @xmlName("x-amz-server-side-encryption-customer-key")
    XAmzServerSideEncryptionCustomerKey: String,
    @httpHeader("x-amz-server-side-encryption-customer-key-MD5")
    @xmlName("x-amz-server-side-encryption-customer-key-MD5")
    XAmzServerSideEncryptionCustomerKeyMd5: String,
    @httpHeader("x-amz-storage-class")
    @xmlName("x-amz-storage-class")
    XAmzStorageClass: XAmzStorageClassOfInitiateMultipartUploadRequest,
    @httpHeader("x-amz-tagging")
    @xmlName("x-amz-tagging")
    XAmzTagging: XAmzTaggingOfInitiateMultipartUploadRequest,
}

structure InitiateMultipartUploadResult {
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("Key")
    Key: String,
    @xmlName("UploadId")
    UploadId: String,
}

@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzServerSideEncryptionCustomerAlgorithmOfUploadPartRequest

structure UploadPartRequest {
    @httpPayload
    @xmlName("Body")
    Body: Blob,
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-MD5")
    @xmlName("Content-MD5")
    ContentMd5: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @required
    @httpQuery("partNumber")
    @xmlName("partNumber")
    PartNumber: String,
    @required
    @httpQuery("uploadId")
    @xmlName("uploadId")
    UploadId: String,
    @httpHeader("x-amz-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-server-side-encryption-customer-algorithm")
    XAmzServerSideEncryptionCustomerAlgorithm: XAmzServerSideEncryptionCustomerAlgorithmOfUploadPartRequest,
    @httpHeader("x-amz-server-side-encryption-customer-key")
    @xmlName("x-amz-server-side-encryption-customer-key")
    XAmzServerSideEncryptionCustomerKey: String,
    @httpHeader("x-amz-server-side-encryption-customer-key-MD5")
    @xmlName("x-amz-server-side-encryption-customer-key-MD5")
    XAmzServerSideEncryptionCustomerKeyMd5: String,
}

structure UploadPartResult {
    @httpHeader("ETag")
    @xmlName("ETag")
    ETag: String,
}

@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzServerSideEncryptionCustomerAlgorithmOfUploadPartCopyRequest

@enum([
  {
      name: "AES256",
      value: "AES256",
  },
])
string XAmzCopySourceServerSideEncryptionCustomerAlgorithmOfUploadPartCopyRequest

structure UploadPartCopyRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @required
    @httpQuery("partNumber")
    @xmlName("partNumber")
    PartNumber: String,
    @required
    @httpQuery("uploadId")
    @xmlName("uploadId")
    UploadId: String,
    @required
    @httpHeader("x-amz-copy-source")
    @xmlName("x-amz-copy-source")
    XAmzCopySource: String,
    @httpHeader("x-amz-copy-source-if-match")
    @xmlName("x-amz-copy-source-if-match")
    XAmzCopySourceIfMatch: String,
    @httpHeader("x-amz-copy-source-if-modified-since")
    @xmlName("x-amz-copy-source-if-modified-since")
    XAmzCopySourceIfModifiedSince: String,
    @httpHeader("x-amz-copy-source-if-none-match")
    @xmlName("x-amz-copy-source-if-none-match")
    XAmzCopySourceIfNoneMatch: String,
    @httpHeader("x-amz-copy-source-if-unmodified-since")
    @xmlName("x-amz-copy-source-if-unmodified-since")
    XAmzCopySourceIfUnmodifiedSince: String,
    @httpHeader("x-amz-copy-source-range")
    @xmlName("x-amz-copy-source-range")
    XAmzCopySourceRange: String,
    @httpHeader("x-amz-copy-source-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-copy-source-server-side-encryption-customer-algorithm")
    XAmzCopySourceServerSideEncryptionCustomerAlgorithm: XAmzCopySourceServerSideEncryptionCustomerAlgorithmOfUploadPartCopyRequest,
    @httpHeader("x-amz-copy-source-server-side-encryption-customer-key")
    @xmlName("x-amz-copy-source-server-side-encryption-customer-key")
    XAmzCopySourceServerSideEncryptionCustomerKey: String,
    @httpHeader("x-amz-copy-source-server-side-encryption-customer-key-MD5")
    @xmlName("x-amz-copy-source-server-side-encryption-customer-key-MD5")
    XAmzCopySourceServerSideEncryptionCustomerKeyMd5: String,
    @httpHeader("x-amz-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-server-side-encryption-customer-algorithm")
    XAmzServerSideEncryptionCustomerAlgorithm: XAmzServerSideEncryptionCustomerAlgorithmOfUploadPartCopyRequest,
    @httpHeader("x-amz-server-side-encryption-customer-key")
    @xmlName("x-amz-server-side-encryption-customer-key")
    XAmzServerSideEncryptionCustomerKey: String,
    @httpHeader("x-amz-server-side-encryption-customer-key-MD5")
    @xmlName("x-amz-server-side-encryption-customer-key-MD5")
    XAmzServerSideEncryptionCustomerKeyMd5: String,
}

structure UploadPartCopyResult {
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("ETag")
    ETag: String,
    @xmlName("LastModified")
    LastModified: Timestamp,
    @httpHeader("x-amz-copy-source-version-id")
    @xmlName("x-amz-copy-source-version-id")
    XAmzCopySourceVersionId: String,
    @httpHeader("x-amz-server-side-encryption")
    @xmlName("x-amz-server-side-encryption")
    XAmzServerSideEncryption: String,
}

structure ListPartsRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpQuery("encoding-type")
    @xmlName("encoding-type")
    EncodingType: String,
    @httpQuery("max-parts")
    @xmlName("max-parts")
    MaxParts: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @httpQuery("part-number-marker")
    @xmlName("part-number-marker")
    PartNumberMarker: String,
    @required
    @httpQuery("uploadId")
    @xmlName("uploadId")
    UploadId: String,
}

structure ListPartsResult {
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("Encoding-Type")
    EncodingType: String,
    @xmlName("Initiator")
    Initiator: Initiator,
    @xmlName("IsTruncated")
    IsTruncated: Boolean,
    @xmlName("Key")
    Key: String,
    @xmlName("MaxParts")
    MaxParts: Integer,
    @xmlName("NextPartNumberMarker")
    NextPartNumberMarker: Integer,
    @xmlName("Owner")
    Owner: Owner,
    @xmlFlattened
    @xmlName("Part")
    Part: ListOfPart,
    @xmlName("PartNumberMarker")
    PartNumberMarker: Integer,
    @xmlName("StorageClass")
    StorageClass: String,
    @xmlName("UploadId")
    UploadId: String,
}

structure Initiator {
    @xmlName("DisplayName")
    DisplayName: String,
    @xmlName("ID")
    ID: String,
}

structure Part {
    @xmlName("ETag")
    ETag: String,
    @xmlName("LastModified")
    LastModified: Timestamp,
    @xmlName("PartNumber")
    PartNumber: Integer,
    @xmlName("Size")
    Size: Integer,
}

list ListOfPart {
    member: Part,
}

structure RequestPart {
    @required
    @xmlName("ETag")
    ETag: String,
    @required
    @xmlName("PartNumber")
    PartNumber: Integer,
}

list ListOfRequestPart {
    member: RequestPart,
}

structure RequestCompleteMultipartUpload {
    @required
    @xmlFlattened
    @xmlName("Part")
    ListOfRequestPart: ListOfRequestPart,
}

structure CompleteMultipartUploadRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpPayload
    @xmlName("CompleteMultipartUpload")
    CompleteMultipartUpload: RequestCompleteMultipartUpload,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @required
    @httpQuery("uploadId")
    @xmlName("uploadId")
    UploadId: String,
}

structure CompleteMultipartUploadResult {
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("ETag")
    ETag: String,
    @xmlName("Key")
    Key: String,
    @xmlName("Location")
    Location: String,
    @httpHeader("x-amz-expiration")
    @xmlName("x-amz-expiration")
    XAmzExpiration: String,
    @httpHeader("x-amz-server-side-encryption")
    @xmlName("x-amz-server-side-encryption")
    XAmzServerSideEncryption: String,
    @httpHeader("x-amz-server-side-encryption-aws-kms-key-id")
    @xmlName("x-amz-server-side-encryption-aws-kms-key-id")
    XAmzServerSideEncryptionAwsKmsKeyId: String,
    @httpHeader("x-amz-server-side-encryption-customer-algorithm")
    @xmlName("x-amz-server-side-encryption-customer-algorithm")
    XAmzServerSideEncryptionCustomerAlgorithm: String,
    @httpHeader("x-amz-version-id")
    @xmlName("x-amz-version-id")
    XAmzVersionId: String,
}

structure AbortMultipartUploadRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpLabel
    @xmlName("Object")
    Object: String,
    @required
    @httpQuery("uploadId")
    @xmlName("uploadId")
    UploadId: String,
}

structure GetServiceRequest {}

structure GetServiceResult {
    @xmlName("Buckets")
    Buckets: ListOfBuckets,
    @xmlName("Owner")
    Owner: Owner,
}

list ListOfBuckets {
    @xmlName("Bucket")
    member: Buckets,
}

structure Buckets {
    @xmlName("CreationDate")
    CreationDate: Timestamp,
    @xmlName("Name")
    Name: String,
}

structure PutBucketRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure PutBucketResult {
    @httpHeader("Location")
    @xmlName("Location")
    Location: String,
}

structure DeleteBucketRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure GetBucketRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpQuery("delimiter")
    @xmlName("delimiter")
    Delimiter: String,
    @httpQuery("encoding-type")
    @xmlName("encoding-type")
    EncodingType: String,
    @httpQuery("marker")
    @xmlName("marker")
    Marker: String,
    @httpQuery("max-keys")
    @xmlName("max-keys")
    MaxKeys: String,
    @httpQuery("prefix")
    @xmlName("prefix")
    Prefix: String,
}

structure GetBucketResult {
    @xmlName("CommonPrefixes")
    CommonPrefixes: String,
    @xmlFlattened
    @xmlName("Contents")
    Contents: ListOfContents,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("Delimiter")
    Delimiter: String,
    @xmlName("Encoding-Type")
    EncodingType: String,
    @xmlName("IsTruncated")
    IsTruncated: Boolean,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxKeys")
    MaxKeys: String,
    @xmlName("Name")
    Name: String,
    @xmlName("NextMarker")
    NextMarker: String,
    @xmlName("Prefix")
    Prefix: String,
}

structure Contents {
    @xmlName("DisplayName")
    DisplayName: String,
    @xmlName("ETag")
    ETag: String,
    @xmlName("ID")
    ID: String,
    @xmlName("Key")
    Key: String,
    @xmlName("LastModified")
    LastModified: Timestamp,
    @xmlName("Owner")
    Owner: Owner,
    @xmlName("Size")
    Size: String,
    @xmlName("StorageClass")
    StorageClass: String,
}

list ListOfContents {
    member: Contents,
}

structure GetBucketVersion2Request {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpQuery("continuation-token")
    @xmlName("continuation-token")
    ContinuationToken: String,
    @httpQuery("delimiter")
    @xmlName("delimiter")
    Delimiter: String,
    @httpQuery("encoding-type")
    @xmlName("encoding-type")
    EncodingType: String,
    @httpQuery("fetch-owner")
    @xmlName("fetch-owner")
    FetchOwner: String,
    @required
    @httpQuery("list-type")
    @xmlName("list-type")
    ListType: String,
    @httpQuery("marker")
    @xmlName("marker")
    Marker: String,
    @httpQuery("max-keys")
    @xmlName("max-keys")
    MaxKeys: String,
    @httpQuery("prefix")
    @xmlName("prefix")
    Prefix: String,
    @httpQuery("start-after")
    @xmlName("start-after")
    StartAfter: String,
}

structure GetBucketVersion2Result {
    @xmlName("CommonPrefixes")
    CommonPrefixes: String,
    @xmlFlattened
    @xmlName("Contents")
    Contents: ListOfContents,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("ContinuationToken")
    ContinuationToken: String,
    @xmlName("Delimiter")
    Delimiter: String,
    @xmlName("Encoding-Type")
    EncodingType: String,
    @xmlName("IsTruncated")
    IsTruncated: Boolean,
    @xmlName("KeyCount")
    KeyCount: String,
    @xmlName("MaxKeys")
    MaxKeys: String,
    @xmlName("Name")
    Name: String,
    @xmlName("NextContinuationToken")
    NextContinuationToken: String,
    @xmlName("Prefix")
    Prefix: String,
    @xmlName("StartAfter")
    StartAfter: String,
}

structure GetBucketObjectVersionsRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpQuery("delimiter")
    @xmlName("delimiter")
    Delimiter: String,
    @httpQuery("encoding-type")
    @xmlName("encoding-type")
    EncodingType: String,
    @httpQuery("key-marker")
    @xmlName("key-marker")
    KeyMarker: String,
    @httpQuery("max-keys")
    @xmlName("max-keys")
    MaxKeys: String,
    @httpQuery("prefix")
    @xmlName("prefix")
    Prefix: String,
    @httpQuery("version-id-marker")
    @xmlName("version-id-marker")
    VersionIdMarker: String,
}

structure GetBucketObjectVersionsResult {
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("IsTruncated")
    IsTruncated: Boolean,
    @xmlName("KeyMarker")
    KeyMarker: String,
    @xmlName("MaxKeys")
    MaxKeys: String,
    @xmlName("Name")
    Name: String,
    @xmlName("Prefix")
    Prefix: String,
    @xmlFlattened
    @xmlName("Version")
    Version: ListOfVersion,
    @xmlName("VersionIdMarker")
    VersionIdMarker: String,
}

structure Version {
    @xmlName("DisplayName")
    DisplayName: String,
    @xmlName("ETag")
    ETag: String,
    @xmlName("ID")
    ID: String,
    @xmlName("IsLatest")
    IsLatest: Boolean,
    @xmlName("Key")
    Key: String,
    @xmlName("LastModified")
    LastModified: Timestamp,
    @xmlName("Owner")
    Owner: Owner,
    @xmlName("Size")
    Size: String,
    @xmlName("StorageClass")
    StorageClass: String,
    @xmlName("VersionId")
    VersionId: String,
}

list ListOfVersion {
    member: Version,
}

structure ListMultipartUploadsRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("encoding-type")
    @xmlName("encoding-type")
    EncodingType: String,
    @httpHeader("key-marker")
    @xmlName("key-marker")
    KeyMarker: String,
    @httpHeader("max-uploads")
    @xmlName("max-uploads")
    MaxUploads: Integer,
    @httpHeader("prefix")
    @xmlName("prefix")
    Prefix: String,
    @httpHeader("upload-id-marker")
    @xmlName("upload-id-marker")
    UploadIdMarker: String,
}

structure ListMultipartUploadsResult {
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("IsTruncated")
    IsTruncated: Boolean,
    @xmlName("KeyMarker")
    KeyMarker: String,
    @xmlName("MaxUploads")
    MaxUploads: Integer,
    @xmlName("NextKeyMarker")
    NextKeyMarker: String,
    @xmlName("NextUploadIdMarker")
    NextUploadIdMarker: String,
    @xmlFlattened
    @xmlName("Upload")
    Upload: ListOfUpload,
    @xmlName("UploadIdMarker")
    UploadIdMarker: String,
}

structure Upload {
    @xmlName("DisplayName")
    DisplayName: String,
    @xmlName("ID")
    ID: String,
    @xmlName("Initiated")
    Initiated: Timestamp,
    @xmlName("Initiator")
    Initiator: Initiator,
    @xmlName("Key")
    Key: String,
    @xmlName("Owner")
    Owner: Owner,
    @xmlName("StorageClass")
    StorageClass: String,
    @xmlName("UploadId")
    UploadId: String,
}

list ListOfUpload {
    member: Upload,
}

structure HeadBucketRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure GetBucketACLRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure GetBucketACLResult {
    @xmlName("AccessControlList")
    AccessControlList: ListOfAccessControlListOfGetBucketACL,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("Owner")
    Owner: Owner,
}

list ListOfAccessControlListOfGetBucketACL {
    @xmlName("Grant")
    member: AccessControlListOfGetBucketACL,
}

structure AccessControlListOfGetBucketACL {
    @xmlName("Grantee")
    Grantee: Grantee,
    @xmlName("Permission")
    Permission: String,
}

structure RequestCORSRule {
    @xmlName("AllowedHeader")
    AllowedHeader: String,
    @required
    @xmlName("AllowedOrigin")
    AllowedOrigin: String,
    @xmlName("ExposeHeader")
    ExposeHeader: String,
    @xmlName("ID")
    ID: String,
    @required
    @xmlFlattened
    @xmlName("AllowedMethod")
    ListOfRequestAllowedMethod: ListOfRequestAllowedMethod,
    @xmlName("MaxAgeSeconds")
    MaxAgeSeconds: Integer,
}

list ListOfRequestCORSRule {
    member: RequestCORSRule,
}

structure RequestCORSConfiguration {
    @required
    @xmlFlattened
    @xmlName("CORSRule")
    ListOfRequestCORSRule: ListOfRequestCORSRule,
}

list ListOfRequestAllowedMethod {
    member: String,
}

structure PutBucketCorsRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpPayload
    @xmlName("CORSConfiguration")
    CORSConfiguration: RequestCORSConfiguration,
}

structure GetBucketCorsRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure GetBucketCorsResult {
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlFlattened
    @xmlName("CORSRule")
    CORSRule: ListOfCORSRule,
}

structure CORSRule {
    @xmlName("AllowedHeader")
    AllowedHeader: String,
    @xmlName("AllowedMethod")
    AllowedMethod: ListOfAllowedMethod,
    @xmlName("AllowedOrigin")
    AllowedOrigin: String,
    @xmlName("ExposeHeader")
    ExposeHeader: String,
    @xmlName("MaxAgeSeconds")
    MaxAgeSeconds: Integer,
}

list ListOfCORSRule {
    member: CORSRule,
}

list ListOfAllowedMethod {
    @xmlName("member")
    member: String,
}

structure DeleteBucketCorsRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure PutBucketPolicyRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-MD5")
    @xmlName("Content-MD5")
    ContentMd5: String,
    @httpPayload
    @xmlName("Id")
    Policy: String,
}

structure GetBucketPolicyRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure GetBucketPolicyResult {
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @httpPayload
    @xmlName("Policy")
    Policy: String,
}

structure DeleteBucketPolicyRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

@enum([
  {
      name: "Suspended",
      value: "Suspended",
  },
  {
      name: "Enabled",
      value: "Enabled",
  },
])
string StatusOfVersioningConfigurationForPutBucketVersioning

structure RequestVersioningConfiguration {
    @xmlName("Status")
    Status: StatusOfVersioningConfigurationForPutBucketVersioning,
}

structure PutBucketVersioningRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-MD5")
    @xmlName("Content-MD5")
    ContentMd5: String,
    @httpPayload
    @xmlName("VersioningConfiguration")
    VersioningConfiguration: RequestVersioningConfiguration,
}

structure GetBucketVersioningRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure GetBucketVersioningResult {
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("Status")
    Status: String,
}

structure RequestRule {
    @required
    @xmlName("ID")
    ID: String,
    @xmlName("Prefix")
    Prefix: String,
    @xmlName("Expiration")
    RequestExpiration: RequestExpiration,
    @xmlName("Filter")
    RequestFilter: RequestFilter,
    @xmlName("NoncurrentVersionExpiration")
    RequestNoncurrentVersionExpiration: RequestNoncurrentVersionExpiration,
    @xmlName("Status")
    Status: StatusOfLifecycleConfigurationForPutBucketLifecycleConfiguration,
}

list ListOfRequestRule {
    member: RequestRule,
}

structure RequestLifecycleConfiguration {
    @required
    @xmlFlattened
    @xmlName("Rule")
    ListOfRequestRule: ListOfRequestRule,
}

@enum([
  {
      name: "Enabled",
      value: "Enabled",
  },
  {
      name: "Disabled",
      value: "Disabled",
  },
])
string StatusOfLifecycleConfigurationForPutBucketLifecycleConfiguration

structure RequestExpiration {
    @xmlName("Date")
    Date: Timestamp,
    @xmlName("Days")
    Days: Integer,
}

structure RequestAnd {
    @xmlName("Tag")
    RequestTag: RequestTag,
}

structure RequestFilter {
    @xmlName("And")
    RequestAnd: RequestAnd,
}

structure RequestNoncurrentVersionExpiration {
    @xmlName("NoncurrentDays")
    NoncurrentDays: Integer,
}

structure PutBucketLifecycleConfigurationRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpPayload
    @xmlName("LifecycleConfiguration")
    LifecycleConfiguration: RequestLifecycleConfiguration,
}

structure GetBucketLifecycleConfigurationRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

list ListOfRule {
    member: Rule,
}

structure GetBucketLifecycleConfigurationResult {
    @xmlFlattened
    @xmlName("Rule")
    Rule: ListOfRule,
}

structure Rule {
    @xmlName("Expiration")
    Expiration: Expiration,
    @xmlName("Filter")
    Filter: Filter,
    @xmlName("ID")
    ID: String,
    @xmlName("NoncurrentVersionExpiration")
    NoncurrentVersionExpiration: NoncurrentVersionExpiration,
    @xmlName("Prefix")
    Prefix: String,
    @xmlName("Status")
    Status: String,
}

structure Expiration {
    @xmlName("Date")
    Date: Timestamp,
    @xmlName("Days")
    Days: Integer,
}

structure Filter {
    @xmlName("And")
    And: And,
}

structure And {
    @xmlName("Tag")
    Tag: Tag,
}

structure NoncurrentVersionExpiration {
    @xmlName("NoncurrentDays")
    NoncurrentDays: Integer,
}

structure DeleteBucketLifecycleRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

list ListOfRequestTagSet {
    member: RequestTagSet,
}

structure RequestTaggingOfPutBucketTagging {
    @xmlFlattened
    @xmlName("TagSet")
    ListOfRequestTagSet: ListOfRequestTagSet,
}

structure PutBucketTaggingRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @httpHeader("Content-MD5")
    @xmlName("Content-MD5")
    ContentMd5: String,
    @httpPayload
    @xmlName("Tagging")
    Tagging: RequestTaggingOfPutBucketTagging,
}

structure GetBucketTaggingRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure GetBucketTaggingResult {
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
    @xmlName("TagSet")
    TagSet: ListOfTagSetOfGetBucketTagging,
}

list ListOfTagSetOfGetBucketTagging {
    @xmlName("Tag")
    member: TagSetOfGetBucketTagging,
}

structure TagSetOfGetBucketTagging {
    @xmlName("Key")
    Key: String,
    @xmlName("Value")
    Value: String,
}

structure DeleteBucketTaggingRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure GetBucketConsistencyRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
}

structure GetBucketConsistencyResult {
    @httpPayload
    @xmlName("Consistency")
    Consistency: String,
    @httpHeader("Content-Type")
    @xmlName("Content-Type")
    ContentType: String,
}

@enum([
  {
      name: "READ_AFTER_NEW_WRITE",
      value: "read-after-new-write",
  },
  {
      name: "available",
      value: "available",
  },
])
string XNtapSgConsistencyOfPutBucketConsistencyRequest

structure PutBucketConsistencyRequest {
    @required
    @httpLabel
    @xmlName("Bucket")
    Bucket: String,
    @required
    @httpQuery("x-ntap-sg-consistency")
    @xmlName("x-ntap-sg-consistency")
    XNtapSgConsistency: XNtapSgConsistencyOfPutBucketConsistencyRequest,
}

structure PutBucketConsistencyResult {
    @httpHeader("Comtent-Type")
    @xmlName("Comtent-Type")
    ComtentType: String,
}

@restXml
@sigv4(name: "s3")
@xmlNamespace(uri: "http://s3.amazonaws.com/doc/2006-03-01/")
@service(
    sdkId: "storage",
    arnNamespace: "storage",
    endpointPrefix: "storage"
)
service ObjectStorageService {
    version: "2006-03-01",
    operations: [
        GetObject,
        GetObjectACL,
        HeadObject,
        PutObject,
        PutObjectCopy,
        DeleteObject,
        DeleteMultipleObjects,
        GetObjectTagging,
        PutObjectTagging,
        DeleteObjectTagging,
        InitiateMultipartUpload,
        UploadPart,
        UploadPartCopy,
        ListParts,
        CompleteMultipartUpload,
        AbortMultipartUpload,
        GetService,
        PutBucket,
        DeleteBucket,
        GetBucket,
        GetBucketVersion2,
        GetBucketObjectVersions,
        ListMultipartUploads,
        HeadBucket,
        GetBucketACL,
        PutBucketCors,
        GetBucketCors,
        DeleteBucketCors,
        PutBucketPolicy,
        GetBucketPolicy,
        DeleteBucketPolicy,
        PutBucketVersioning,
        GetBucketVersioning,
        PutBucketLifecycleConfiguration,
        GetBucketLifecycleConfiguration,
        DeleteBucketLifecycle,
        PutBucketTagging,
        GetBucketTagging,
        DeleteBucketTagging,
        GetBucketConsistency,
        PutBucketConsistency,
    ],
}


@http(method: "GET", uri: "/{Bucket}/{Object+}?x-id=GetObject" )
@readonly
operation GetObject {
    input: GetObjectRequest,
    output: GetObjectResult,
}

@http(method: "GET", uri: "/{Bucket}/{Object+}?acl&x-id=GetObjectACL" )
@readonly
operation GetObjectACL {
    input: GetObjectACLRequest,
    output: GetObjectACLResult,
}

@http(method: "HEAD", uri: "/{Bucket}/{Object+}?x-id=HeadObject" )
operation HeadObject {
    input: HeadObjectRequest,
    output: HeadObjectResult,
}

@http(method: "PUT", uri: "/{Bucket}/{Object+}?x-id=PutObject" )
@idempotent
operation PutObject {
    input: PutObjectRequest,
    output: PutObjectResult,
}

@http(method: "PUT", uri: "/{Bucket}/{Object+}?x-id=PutObjectCopy" )
@idempotent
operation PutObjectCopy {
    input: PutObjectCopyRequest,
    output: PutObjectCopyResult,
}

@http(method: "DELETE", uri: "/{Bucket}/{Object+}?x-id=DeleteObject" )
@idempotent
operation DeleteObject {
    input: DeleteObjectRequest,
    output: DeleteObjectResult,
}

@http(method: "POST", uri: "/{Bucket}?delete&x-id=DeleteMultipleObjects" )
operation DeleteMultipleObjects {
    input: DeleteMultipleObjectsRequest,
    output: DeleteMultipleObjectsResult,
}

@http(method: "GET", uri: "/{Bucket}/{Object+}?tagging&x-id=GetObjectTagging" )
@readonly
operation GetObjectTagging {
    input: GetObjectTaggingRequest,
    output: GetObjectTaggingResult,
}

@http(method: "PUT", uri: "/{Bucket}/{Object+}?tagging&x-id=PutObjectTagging" )
@idempotent
operation PutObjectTagging {
    input: PutObjectTaggingRequest,
    output: PutObjectTaggingResult,
}

@http(method: "DELETE", uri: "/{Bucket}/{Object+}?tagging&x-id=DeleteObjectTagging" )
@idempotent
operation DeleteObjectTagging {
    input: DeleteObjectTaggingRequest,
    output: DeleteObjectTaggingResult,
}

@http(method: "POST", uri: "/{Bucket}/{Object+}?uploads&x-id=InitiateMultipartUpload" )
operation InitiateMultipartUpload {
    input: InitiateMultipartUploadRequest,
    output: InitiateMultipartUploadResult,
}

@http(method: "PUT", uri: "/{Bucket}/{Object+}?x-id=UploadPart" )
@idempotent
operation UploadPart {
    input: UploadPartRequest,
    output: UploadPartResult,
}

@http(method: "PUT", uri: "/{Bucket}/{Object+}?x-id=UploadPartCopy" )
@idempotent
operation UploadPartCopy {
    input: UploadPartCopyRequest,
    output: UploadPartCopyResult,
}

@http(method: "GET", uri: "/{Bucket}/{Object+}?x-id=ListParts" )
@readonly
operation ListParts {
    input: ListPartsRequest,
    output: ListPartsResult,
}

@http(method: "POST", uri: "/{Bucket}/{Object+}?x-id=CompleteMultipartUpload" )
operation CompleteMultipartUpload {
    input: CompleteMultipartUploadRequest,
    output: CompleteMultipartUploadResult,
}

@http(method: "DELETE", uri: "/{Bucket}/{Object+}?x-id=AbortMultipartUpload" )
@idempotent
operation AbortMultipartUpload {
    input: AbortMultipartUploadRequest,
}

@http(method: "GET", uri: "/?x-id=GetService" )
@readonly
operation GetService {
    input: GetServiceRequest,
    output: GetServiceResult,
}

@http(method: "PUT", uri: "/{Bucket}?x-id=PutBucket" )
@idempotent
operation PutBucket {
    input: PutBucketRequest,
    output: PutBucketResult,
}

@http(method: "DELETE", uri: "/{Bucket}?x-id=DeleteBucket" )
@idempotent
operation DeleteBucket {
    input: DeleteBucketRequest,
}

@http(method: "GET", uri: "/{Bucket}?x-id=GetBucket" )
@readonly
operation GetBucket {
    input: GetBucketRequest,
    output: GetBucketResult,
}

@http(method: "GET", uri: "/{Bucket}?x-id=GetBucketVersion2" )
@readonly
operation GetBucketVersion2 {
    input: GetBucketVersion2Request,
    output: GetBucketVersion2Result,
}

@http(method: "GET", uri: "/{Bucket}?versions&x-id=GetBucketObjectVersions" )
@readonly
operation GetBucketObjectVersions {
    input: GetBucketObjectVersionsRequest,
    output: GetBucketObjectVersionsResult,
}

@http(method: "GET", uri: "/{Bucket}?uploads&x-id=ListMultipartUploads" )
@readonly
operation ListMultipartUploads {
    input: ListMultipartUploadsRequest,
    output: ListMultipartUploadsResult,
}

@http(method: "HEAD", uri: "/{Bucket}?x-id=HeadBucket" )
operation HeadBucket {
    input: HeadBucketRequest,
}

@http(method: "GET", uri: "/{Bucket}?acl&x-id=GetBucketACL" )
@readonly
operation GetBucketACL {
    input: GetBucketACLRequest,
    output: GetBucketACLResult,
}

@http(method: "PUT", uri: "/{Bucket}?cors&x-id=PutBucketCors" )
@idempotent
operation PutBucketCors {
    input: PutBucketCorsRequest,
}

@http(method: "GET", uri: "/{Bucket}?cors&x-id=GetBucketCors" )
@readonly
operation GetBucketCors {
    input: GetBucketCorsRequest,
    output: GetBucketCorsResult,
}

@http(method: "DELETE", uri: "/{Bucket}?cors&x-id=DeleteBucketCors" )
@idempotent
operation DeleteBucketCors {
    input: DeleteBucketCorsRequest,
}

@http(method: "PUT", uri: "/{Bucket}?policy&x-id=PutBucketPolicy" )
@idempotent
operation PutBucketPolicy {
    input: PutBucketPolicyRequest,
}

@http(method: "GET", uri: "/{Bucket}?policy&x-id=GetBucketPolicy" )
@readonly
operation GetBucketPolicy {
    input: GetBucketPolicyRequest,
    output: GetBucketPolicyResult,
}

@http(method: "DELETE", uri: "/{Bucket}?policy&x-id=DeleteBucketPolicy" )
@idempotent
operation DeleteBucketPolicy {
    input: DeleteBucketPolicyRequest,
}

@http(method: "PUT", uri: "/{Bucket}?versioning&x-id=PutBucketVersioning" )
@idempotent
operation PutBucketVersioning {
    input: PutBucketVersioningRequest,
}

@http(method: "GET", uri: "/{Bucket}?versioning&x-id=GetBucketVersioning" )
@readonly
operation GetBucketVersioning {
    input: GetBucketVersioningRequest,
    output: GetBucketVersioningResult,
}

@http(method: "PUT", uri: "/{Bucket}?lifecycle&x-id=PutBucketLifecycleConfiguration" )
@idempotent
operation PutBucketLifecycleConfiguration {
    input: PutBucketLifecycleConfigurationRequest,
}

@http(method: "GET", uri: "/{Bucket}?lifecycle&x-id=GetBucketLifecycleConfiguration" )
@readonly
operation GetBucketLifecycleConfiguration {
    input: GetBucketLifecycleConfigurationRequest,
    output: GetBucketLifecycleConfigurationResult,
}

@http(method: "DELETE", uri: "/{Bucket}?lifecycle&x-id=DeleteBucketLifecycle" )
@idempotent
operation DeleteBucketLifecycle {
    input: DeleteBucketLifecycleRequest,
}

@http(method: "PUT", uri: "/{Bucket}?tagging&x-id=PutBucketTagging" )
@idempotent
operation PutBucketTagging {
    input: PutBucketTaggingRequest,
}

@http(method: "GET", uri: "/{Bucket}?tagging&x-id=GetBucketTagging" )
@readonly
operation GetBucketTagging {
    input: GetBucketTaggingRequest,
    output: GetBucketTaggingResult,
}

@http(method: "DELETE", uri: "/{Bucket}?tagging&x-id=DeleteBucketTagging" )
@idempotent
operation DeleteBucketTagging {
    input: DeleteBucketTaggingRequest,
}

@http(method: "GET", uri: "/{Bucket}?x-ntap-sg-consistency&x-id=GetBucketConsistency" )
@readonly
operation GetBucketConsistency {
    input: GetBucketConsistencyRequest,
    output: GetBucketConsistencyResult,
}

@http(method: "PUT", uri: "/{Bucket}?x-id=PutBucketConsistency" )
@idempotent
operation PutBucketConsistency {
    input: PutBucketConsistencyRequest,
    output: PutBucketConsistencyResult,
}
