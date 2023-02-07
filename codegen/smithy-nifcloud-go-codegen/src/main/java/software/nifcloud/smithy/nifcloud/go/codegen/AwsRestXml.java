// This code was forked from github.com/aws/aws-sdk-go-v2. DO NOT EDIT.
// URL: https://github.com/aws/aws-sdk-go-v2/tree/v1.17.4/codegen/smithy-aws-go-codegen/src/main/java/software.nifcloud.smithy.nifcloud.go.codegen/AwsRestXml.java

package software.nifcloud.smithy.nifcloud.go.codegen;

import software.amazon.smithy.aws.traits.protocols.RestXmlTrait;
import software.amazon.smithy.model.shapes.ShapeId;

/**
 * Handles generating the aws.rest-xml protocol for services.
 *
 * @inheritDoc
 *
 * @see RestXmlProtocolGenerator
 */
public final class AwsRestXml extends RestXmlProtocolGenerator {

    @Override
    protected String getDocumentContentType() {
        return "application/xml";
    }

    @Override
    public ShapeId getProtocol() {
        return RestXmlTrait.ID;
    }

}
