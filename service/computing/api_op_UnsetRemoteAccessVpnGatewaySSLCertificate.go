// Code generated by smithy-go-codegen DO NOT EDIT.

package computing

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
)

func (c *Client) UnsetRemoteAccessVpnGatewaySSLCertificate(ctx context.Context, params *UnsetRemoteAccessVpnGatewaySSLCertificateInput, optFns ...func(*Options)) (*UnsetRemoteAccessVpnGatewaySSLCertificateOutput, error) {
	if params == nil {
		params = &UnsetRemoteAccessVpnGatewaySSLCertificateInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "UnsetRemoteAccessVpnGatewaySSLCertificate", params, optFns, c.addOperationUnsetRemoteAccessVpnGatewaySSLCertificateMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*UnsetRemoteAccessVpnGatewaySSLCertificateOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type UnsetRemoteAccessVpnGatewaySSLCertificateInput struct {

	// This member is required.
	RemoteAccessVpnGatewayId *string

	noSmithyDocumentSerde
}

type UnsetRemoteAccessVpnGatewaySSLCertificateOutput struct {
	RequestId *string

	Return *bool

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationUnsetRemoteAccessVpnGatewaySSLCertificateMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsEc2query_serializeOpUnsetRemoteAccessVpnGatewaySSLCertificate{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsEc2query_deserializeOpUnsetRemoteAccessVpnGatewaySSLCertificate{}, middleware.After)
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
	if err = addOpUnsetRemoteAccessVpnGatewaySSLCertificateValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opUnsetRemoteAccessVpnGatewaySSLCertificate(options.Region), middleware.Before); err != nil {
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

func newServiceMetadataMiddleware_opUnsetRemoteAccessVpnGatewaySSLCertificate(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		OperationName: "UnsetRemoteAccessVpnGatewaySSLCertificate",
	}
}