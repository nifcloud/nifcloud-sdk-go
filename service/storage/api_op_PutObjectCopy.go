// Code generated by smithy-go-codegen DO NOT EDIT.

package storage

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
	s3cust "github.com/nifcloud/nifcloud-sdk-go/service/storage/internal/customizations"
	"github.com/nifcloud/nifcloud-sdk-go/service/storage/types"
	"time"
)

func (c *Client) PutObjectCopy(ctx context.Context, params *PutObjectCopyInput, optFns ...func(*Options)) (*PutObjectCopyOutput, error) {
	if params == nil {
		params = &PutObjectCopyInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "PutObjectCopy", params, optFns, c.addOperationPutObjectCopyMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*PutObjectCopyOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type PutObjectCopyInput struct {

	// This member is required.
	Bucket *string

	// This member is required.
	Object *string

	// This member is required.
	XAmzCopySource *string

	XAmzCopySourceIfMatch *string

	XAmzCopySourceIfModifiedSince *string

	XAmzCopySourceIfNoneMatch *string

	XAmzCopySourceIfUnmodifiedSince *string

	XAmzCopySourceServerSideEncryptionCustomerAlgorithm types.XAmzCopySourceServerSideEncryptionCustomerAlgorithmOfPutObjectCopyRequest

	XAmzCopySourceServerSideEncryptionCustomerKey *string

	XAmzCopySourceServerSideEncryptionCustomerKeyMd5 *string

	XAmzMetadataDirective types.XAmzMetadataDirectiveOfPutObjectCopyRequest

	XAmzServerSideEncryption *string

	XAmzServerSideEncryptionCustomerAlgorithm types.XAmzServerSideEncryptionCustomerAlgorithmOfPutObjectCopyRequest

	XAmzServerSideEncryptionCustomerKey *string

	XAmzServerSideEncryptionCustomerKeyMd5 *string

	XAmzStorageClass types.XAmzStorageClassOfPutObjectCopyRequest

	XAmzTagging *string

	XAmzTaggingDirective types.XAmzTaggingDirectiveOfPutObjectCopyRequest

	noSmithyDocumentSerde
}

type PutObjectCopyOutput struct {
	ContentType *string

	ETag *string

	LastModified *time.Time

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationPutObjectCopyMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsRestxml_serializeOpPutObjectCopy{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsRestxml_deserializeOpPutObjectCopy{}, middleware.After)
	if err != nil {
		return err
	}
	if err = addSetLoggerMiddleware(stack, options); err != nil {
		return err
	}
	if err = awsmiddleware.AddClientRequestIDMiddleware(stack); err != nil {
		return err
	}
	if err = smithyhttp.AddComputeContentLengthMiddleware(stack); err != nil {
		return err
	}
	if err = addResolveEndpointMiddleware(stack, options); err != nil {
		return err
	}
	if err = v4.AddComputePayloadSHA256Middleware(stack); err != nil {
		return err
	}
	if err = addRetryMiddlewares(stack, options); err != nil {
		return err
	}
	if err = addHTTPSignerV4Middleware(stack, options); err != nil {
		return err
	}
	if err = awsmiddleware.AddRawResponseToMetadata(stack); err != nil {
		return err
	}
	if err = awsmiddleware.AddRecordResponseTiming(stack); err != nil {
		return err
	}
	if err = addClientUserAgent(stack); err != nil {
		return err
	}
	if err = smithyhttp.AddErrorCloseResponseBodyMiddleware(stack); err != nil {
		return err
	}
	if err = smithyhttp.AddCloseResponseBodyMiddleware(stack); err != nil {
		return err
	}
	if err = swapWithCustomHTTPSignerMiddleware(stack, options); err != nil {
		return err
	}
	if err = addOpPutObjectCopyValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opPutObjectCopy(options.Region), middleware.Before); err != nil {
		return err
	}
	if err = addMetadataRetrieverMiddleware(stack); err != nil {
		return err
	}
	if err = addPutObjectCopyUpdateEndpoint(stack, options); err != nil {
		return err
	}
	if err = addResponseErrorMiddleware(stack); err != nil {
		return err
	}
	if err = v4.AddContentSHA256HeaderMiddleware(stack); err != nil {
		return err
	}
	if err = disableAcceptEncodingGzip(stack); err != nil {
		return err
	}
	if err = addRequestResponseLogging(stack, options); err != nil {
		return err
	}
	return nil
}

func newServiceMetadataMiddleware_opPutObjectCopy(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		SigningName:   "s3",
		OperationName: "PutObjectCopy",
	}
}

func addPutObjectCopyUpdateEndpoint(stack *middleware.Stack, options Options) error {
	return s3cust.UpdateEndpoint(stack, s3cust.UpdateEndpointOptions{
		Accessor: s3cust.UpdateEndpointParameterAccessor{
			GetBucketFromInput: nopGetBucketAccessor,
		},
		UsePathStyle:                   options.UsePathStyle,
		UseAccelerate:                  options.UseAccelerate,
		SupportsAccelerate:             true,
		TargetS3ObjectLambda:           false,
		EndpointResolver:               options.EndpointResolver,
		EndpointResolverOptions:        options.EndpointOptions,
		UseARNRegion:                   options.UseARNRegion,
		DisableMultiRegionAccessPoints: options.DisableMultiRegionAccessPoints,
	})
}