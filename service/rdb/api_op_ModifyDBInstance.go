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

func (c *Client) ModifyDBInstance(ctx context.Context, params *ModifyDBInstanceInput, optFns ...func(*Options)) (*ModifyDBInstanceOutput, error) {
	if params == nil {
		params = &ModifyDBInstanceInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "ModifyDBInstance", params, optFns, c.addOperationModifyDBInstanceMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*ModifyDBInstanceOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type ModifyDBInstanceInput struct {

	// This member is required.
	DBInstanceIdentifier *string

	AccountingType types.AccountingTypeOfModifyDBInstanceRequest

	AllocatedStorage *int32

	AllowMajorVersionUpgrade *bool

	ApplyImmediately *bool

	AutoMinorVersionUpgrade *bool

	BackupRetentionPeriod *int32

	BinlogRetentionPeriod *int32

	CACertificateIdentifier *string

	CustomBinlogRetentionPeriod *bool

	DBInstanceClass types.DBInstanceClassOfModifyDBInstanceRequest

	DBParameterGroupName *string

	DBSecurityGroups []string

	EngineVersion *string

	Iops *int32

	MasterUserPassword *string

	MultiAZ *bool

	NewDBInstanceIdentifier *string

	NiftySlavePrivateAddress *string

	OptionGroupName *string

	PreferredBackupWindow *string

	PreferredMaintenanceWindow *string

	VpcSecurityGroupIds []string

	noSmithyDocumentSerde
}

type ModifyDBInstanceOutput struct {
	DBInstance *types.DBInstance

	ResponseMetadata *types.ResponseMetadata

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationModifyDBInstanceMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsAwsquery_serializeOpModifyDBInstance{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsAwsquery_deserializeOpModifyDBInstance{}, middleware.After)
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
	if err = addOpModifyDBInstanceValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opModifyDBInstance(options.Region), middleware.Before); err != nil {
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

func newServiceMetadataMiddleware_opModifyDBInstance(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		SigningName:   "rdb",
		OperationName: "ModifyDBInstance",
	}
}
