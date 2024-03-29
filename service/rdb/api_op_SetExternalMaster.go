// Code generated by smithy-go-codegen DO NOT EDIT.

package rdb

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
	"github.com/nifcloud/nifcloud-sdk-go/service/rdb/types"
)

func (c *Client) SetExternalMaster(ctx context.Context, params *SetExternalMasterInput, optFns ...func(*Options)) (*SetExternalMasterOutput, error) {
	if params == nil {
		params = &SetExternalMasterInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "SetExternalMaster", params, optFns, c.addOperationSetExternalMasterMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*SetExternalMasterOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type SetExternalMasterInput struct {

	// This member is required.
	BinlogFileName *string

	// This member is required.
	BinlogPosition *int32

	// This member is required.
	DBInstanceIdentifier *string

	// This member is required.
	MasterHost *string

	// This member is required.
	ReplicationUserName *string

	// This member is required.
	ReplicationUserPassword *string

	MasterPort *int32

	noSmithyDocumentSerde
}

type SetExternalMasterOutput struct {
	DBInstance *types.DBInstance

	ResponseMetadata *types.ResponseMetadata

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationSetExternalMasterMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsAwsquery_serializeOpSetExternalMaster{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsAwsquery_deserializeOpSetExternalMaster{}, middleware.After)
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
	if err = addOpSetExternalMasterValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opSetExternalMaster(options.Region), middleware.Before); err != nil {
		return err
	}
	if err = addRequestIDRetrieverMiddleware(stack); err != nil {
		return err
	}
	if err = addResponseErrorMiddleware(stack); err != nil {
		return err
	}
	if err = addRequestResponseLogging(stack, options); err != nil {
		return err
	}
	return nil
}

func newServiceMetadataMiddleware_opSetExternalMaster(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		SigningName:   "rdb",
		OperationName: "SetExternalMaster",
	}
}
