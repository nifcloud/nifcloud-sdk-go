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

func (c *Client) VerifyDomainIdentity(ctx context.Context, params *VerifyDomainIdentityInput, optFns ...func(*Options)) (*VerifyDomainIdentityOutput, error) {
	if params == nil {
		params = &VerifyDomainIdentityInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "VerifyDomainIdentity", params, optFns, c.addOperationVerifyDomainIdentityMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*VerifyDomainIdentityOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type VerifyDomainIdentityInput struct {

	// This member is required.
	Domain *string

	noSmithyDocumentSerde
}

type VerifyDomainIdentityOutput struct {
	ResponseMetadata *types.ResponseMetadata

	VerificationToken *string

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationVerifyDomainIdentityMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsAwsquery_serializeOpVerifyDomainIdentity{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsAwsquery_deserializeOpVerifyDomainIdentity{}, middleware.After)
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
	if err = addOpVerifyDomainIdentityValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opVerifyDomainIdentity(options.Region), middleware.Before); err != nil {
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

func newServiceMetadataMiddleware_opVerifyDomainIdentity(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		SigningName:   "email",
		OperationName: "VerifyDomainIdentity",
	}
}
