// Code generated by smithy-go-codegen DO NOT EDIT.

package computing

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
	"github.com/nifcloud/nifcloud-sdk-go/service/computing/types"
)

func (c *Client) NiftyDescribePerformanceChart(ctx context.Context, params *NiftyDescribePerformanceChartInput, optFns ...func(*Options)) (*NiftyDescribePerformanceChartOutput, error) {
	if params == nil {
		params = &NiftyDescribePerformanceChartInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "NiftyDescribePerformanceChart", params, optFns, c.addOperationNiftyDescribePerformanceChartMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*NiftyDescribePerformanceChartOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type NiftyDescribePerformanceChartInput struct {

	// This member is required.
	FunctionName types.FunctionNameOfNiftyDescribePerformanceChartRequest

	// This member is required.
	ResourceName []string

	DataType []string

	FromDate *string

	ToDate *string

	ValueType types.ValueTypeOfNiftyDescribePerformanceChartRequest

	noSmithyDocumentSerde
}

type NiftyDescribePerformanceChartOutput struct {
	FunctionName *string

	PerformanceChartSet []types.PerformanceChartSet

	RequestId *string

	ValueType *string

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationNiftyDescribePerformanceChartMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsEc2query_serializeOpNiftyDescribePerformanceChart{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsEc2query_deserializeOpNiftyDescribePerformanceChart{}, middleware.After)
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
	if err = addOpNiftyDescribePerformanceChartValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opNiftyDescribePerformanceChart(options.Region), middleware.Before); err != nil {
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

func newServiceMetadataMiddleware_opNiftyDescribePerformanceChart(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		OperationName: "NiftyDescribePerformanceChart",
	}
}
