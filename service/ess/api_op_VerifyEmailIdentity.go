// Code generated by smithy-go-codegen DO NOT EDIT.

package ess

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
	"github.com/nifcloud/nifcloud-sdk-go/service/ess/types"
)

func (c *Client) VerifyEmailIdentity(ctx context.Context, params *VerifyEmailIdentityInput, optFns ...func(*Options)) (*VerifyEmailIdentityOutput, error) {
	if params == nil {
		params = &VerifyEmailIdentityInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "VerifyEmailIdentity", params, optFns, c.addOperationVerifyEmailIdentityMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*VerifyEmailIdentityOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type VerifyEmailIdentityInput struct {

	// This member is required.
	EmailAddress *string

	noSmithyDocumentSerde
}

type VerifyEmailIdentityOutput struct {
	ResponseMetadata *types.ResponseMetadata

	VerifyEmailIdentityResult *string

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationVerifyEmailIdentityMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsAwsquery_serializeOpVerifyEmailIdentity{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsAwsquery_deserializeOpVerifyEmailIdentity{}, middleware.After)
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
	if err = addOpVerifyEmailIdentityValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opVerifyEmailIdentity(options.Region), middleware.Before); err != nil {
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

func newServiceMetadataMiddleware_opVerifyEmailIdentity(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		SigningName:   "email",
		OperationName: "VerifyEmailIdentity",
	}
}
