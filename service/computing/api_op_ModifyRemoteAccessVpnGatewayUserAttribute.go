// Code generated by smithy-go-codegen DO NOT EDIT.

package computing

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
)

func (c *Client) ModifyRemoteAccessVpnGatewayUserAttribute(ctx context.Context, params *ModifyRemoteAccessVpnGatewayUserAttributeInput, optFns ...func(*Options)) (*ModifyRemoteAccessVpnGatewayUserAttributeOutput, error) {
	if params == nil {
		params = &ModifyRemoteAccessVpnGatewayUserAttributeInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "ModifyRemoteAccessVpnGatewayUserAttribute", params, optFns, c.addOperationModifyRemoteAccessVpnGatewayUserAttributeMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*ModifyRemoteAccessVpnGatewayUserAttributeOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type ModifyRemoteAccessVpnGatewayUserAttributeInput struct {

	// This member is required.
	RemoteAccessVpnGatewayId *string

	// This member is required.
	UserName *string

	Description *string

	Password *string

	noSmithyDocumentSerde
}

type ModifyRemoteAccessVpnGatewayUserAttributeOutput struct {
	RequestId *string

	Return *bool

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationModifyRemoteAccessVpnGatewayUserAttributeMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsEc2query_serializeOpModifyRemoteAccessVpnGatewayUserAttribute{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsEc2query_deserializeOpModifyRemoteAccessVpnGatewayUserAttribute{}, middleware.After)
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
	if err = addRetryMiddlewares(stack, options); err != nil {
		return err
	}
	if err = addHTTPSignerV2Middleware(stack, options); err != nil {
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
	if err = addOpModifyRemoteAccessVpnGatewayUserAttributeValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opModifyRemoteAccessVpnGatewayUserAttribute(options.Region), middleware.Before); err != nil {
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

func newServiceMetadataMiddleware_opModifyRemoteAccessVpnGatewayUserAttribute(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		OperationName: "ModifyRemoteAccessVpnGatewayUserAttribute",
	}
}