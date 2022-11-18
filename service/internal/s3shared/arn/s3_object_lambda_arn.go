// This code was forked from github.com/aws/aws-sdk-go-v2. DO NOT EDIT.
// URL: https://github.com/aws/aws-sdk-go-v2/tree/v1.17.1/service/internal/s3shared/arn/s3_object_lambda_arn.go

package arn

// S3ObjectLambdaARN represents an ARN for the s3-object-lambda service
type S3ObjectLambdaARN interface {
	Resource

	isS3ObjectLambdasARN()
}

// S3ObjectLambdaAccessPointARN is an S3ObjectLambdaARN for the Access Point resource type
type S3ObjectLambdaAccessPointARN struct {
	AccessPointARN
}

func (s S3ObjectLambdaAccessPointARN) isS3ObjectLambdasARN() {}
