// Code generated by smithy-go-codegen DO NOT EDIT.

package computing

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
)

func (c *Client) IncreaseMultiIpAddressCount(ctx context.Context, params *IncreaseMultiIpAddressCountInput, optFns ...func(*Options)) (*IncreaseMultiIpAddressCountOutput, error) {
	if params == nil {
		params = &IncreaseMultiIpAddressCountInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "IncreaseMultiIpAddressCount", params, optFns, c.addOperationIncreaseMultiIpAddressCountMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*IncreaseMultiIpAddressCountOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type IncreaseMultiIpAddressCountInput struct {

	// This member is required.
	IpAddressCount *int32

	// This member is required.
	MultiIpAddressGroupId *string

	noSmithyDocumentSerde
}

type IncreaseMultiIpAddressCountOutput struct {
	RequestId *string

	Return *bool

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationIncreaseMultiIpAddressCountMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsEc2query_serializeOpIncreaseMultiIpAddressCount{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsEc2query_deserializeOpIncreaseMultiIpAddressCount{}, middleware.After)
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
	if err = addOpIncreaseMultiIpAddressCountValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opIncreaseMultiIpAddressCount(options.Region), middleware.Before); err != nil {
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

func newServiceMetadataMiddleware_opIncreaseMultiIpAddressCount(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		OperationName: "IncreaseMultiIpAddressCount",
	}
}
