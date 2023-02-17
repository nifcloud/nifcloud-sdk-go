// Code generated by smithy-go-codegen DO NOT EDIT.

package serviceactivity

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
	"github.com/nifcloud/nifcloud-sdk-go/service/serviceactivity/types"
)

func (c *Client) DescribeEventAttributes(ctx context.Context, params *DescribeEventAttributesInput, optFns ...func(*Options)) (*DescribeEventAttributesOutput, error) {
	if params == nil {
		params = &DescribeEventAttributesInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "DescribeEventAttributes", params, optFns, c.addOperationDescribeEventAttributesMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*DescribeEventAttributesOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type DescribeEventAttributesInput struct {

	// This member is required.
	YearMonth *string

	Location *string

	Mode types.ModeOfDescribeEventAttributesRequest

	noSmithyDocumentSerde
}

type DescribeEventAttributesOutput struct {
	Data *types.DataOfDescribeEventAttributes

	Datetime *string

	RequestID *string

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationDescribeEventAttributesMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsRestjson1_serializeOpDescribeEventAttributes{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsRestjson1_deserializeOpDescribeEventAttributes{}, middleware.After)
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
	if err = addOpDescribeEventAttributesValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opDescribeEventAttributes(options.Region), middleware.Before); err != nil {
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

func newServiceMetadataMiddleware_opDescribeEventAttributes(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		SigningName:   "service-activity",
		OperationName: "DescribeEventAttributes",
	}
}
