// This code was forked from github.com/aws/aws-sdk-go-v2. DO NOT EDIT.
// URL: https://github.com/aws/aws-sdk-go-v2/tree/v1.16.5/codegen/smithy-aws-go-codegen/src/main/java/software.nifcloud.smithy.nifcloud.go.codegen/customization/S3ControlEndpointResolver.java

package software.nifcloud.smithy.nifcloud.go.codegen.customization;

import java.util.function.Consumer;
import software.nifcloud.smithy.nifcloud.go.codegen.EndpointGenerator;
import software.amazon.smithy.codegen.core.SymbolProvider;
import software.amazon.smithy.go.codegen.GoSettings;
import software.amazon.smithy.go.codegen.GoWriter;
import software.amazon.smithy.go.codegen.TriConsumer;
import software.amazon.smithy.go.codegen.integration.GoIntegration;
import software.amazon.smithy.model.Model;

/**
 * S3ControlEndpointResolverCustomizations adds an internal endpoint resolver
 * for s3 service endpoints
 */
public class S3ControlEndpointResolver implements GoIntegration {

    @Override
    public void writeAdditionalFiles(
            GoSettings settings,
            Model model,
            SymbolProvider symbolProvider,
            TriConsumer<String, String, Consumer<GoWriter>> writerFactory
    ) {
        if (!S3ModelUtils.isServiceS3Control(model, settings.getService(model))) {
            return;
        }

        // Generate S3 internal endpoint resolver for S3 Control service
        EndpointGenerator.builder()
                .settings(settings)
                .model(model)
                .writerFactory(writerFactory)
                .sdkID("storage")
                .endpointPrefix("s3")
                .arnNamespace("s3")
                .internalOnly(true)
                .build()
                .run();
    }
}
