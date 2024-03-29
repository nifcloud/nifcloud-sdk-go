// Code generated by smithy-go-codegen DO NOT EDIT.

package computing

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
	"github.com/nifcloud/nifcloud-sdk-go/service/computing/types"
)

func (c *Client) NiftyCreateNatRule(ctx context.Context, params *NiftyCreateNatRuleInput, optFns ...func(*Options)) (*NiftyCreateNatRuleOutput, error) {
	if params == nil {
		params = &NiftyCreateNatRuleInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "NiftyCreateNatRule", params, optFns, c.addOperationNiftyCreateNatRuleMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*NiftyCreateNatRuleOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type NiftyCreateNatRuleInput struct {

	// This member is required.
	NatTableId *string

	// This member is required.
	NatType types.NatTypeOfNiftyCreateNatRuleRequest

	// This member is required.
	Protocol types.ProtocolOfNiftyCreateNatRuleRequest

	// This member is required.
	RuleNumber *string

	Description *string

	Destination *types.RequestDestination

	InboundInterface *types.RequestInboundInterface

	OutboundInterface *types.RequestOutboundInterface

	Source *types.RequestSource

	Translation *types.RequestTranslation

	noSmithyDocumentSerde
}

type NiftyCreateNatRuleOutput struct {
	NatRule *types.NatRule

	NatTableId *string

	RequestId *string

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationNiftyCreateNatRuleMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsEc2query_serializeOpNiftyCreateNatRule{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsEc2query_deserializeOpNiftyCreateNatRule{}, middleware.After)
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
	if err = addOpNiftyCreateNatRuleValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opNiftyCreateNatRule(options.Region), middleware.Before); err != nil {
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

func newServiceMetadataMiddleware_opNiftyCreateNatRule(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		OperationName: "NiftyCreateNatRule",
	}
}
