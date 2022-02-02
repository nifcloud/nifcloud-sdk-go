import software.amazon.smithy.model.Model
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.gradle.tasks.SmithyBuild
import software.amazon.smithy.aws.traits.ServiceTrait

val smithyVersion: String by project

buildscript {
    val smithyVersion: String by project
    repositories {
        mavenCentral()
    }
    dependencies {
        "classpath"("software.amazon.smithy:smithy-cli:$smithyVersion")
        "classpath"("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
    }
}

plugins {
    id("software.amazon.smithy") version "0.5.3"
}

dependencies {
    implementation(project(":smithy-nifcloud-go-codegen"))
}

// This project doesn't produce a JAR.
tasks["jar"].enabled = false
tasks["smithyBuildJar"].enabled = false

tasks.create<SmithyBuild>("buildSdk") {
    addRuntimeClasspath = true
}

// Generates a smithy-build.json file by creating a new projection for every
// JSON file found in nifcloud-models/. The generated smithy-build.json file is
// not committed to git since it's rebuilt each time codegen is performed.
tasks.register("generate-smithy-build") {
    doLast {
        val projectionsBuilder = Node.objectNodeBuilder()
        val modelsDirProp: String by project
        val models = project.file(modelsDirProp);

        fileTree(models).filter { it.isFile }.files.forEach eachFile@{ file ->
            val model = Model.assembler()
                    .addImport(file.absolutePath)
                    // Grab the result directly rather than worrying about checking for errors via unwrap.
                    // All we care about here is the service shape, any unchecked errors will be exposed
                    // as part of the actual build task done by the smithy gradle plugin.
                    .assemble().result.get();
            val services = model.shapes(ServiceShape::class.javaObjectType).sorted().toList();
            if (services.size != 1) {
                throw Exception("There must be exactly one service in each aws model file, but found " +
                        "${services.size} in ${file.name}: ${services.map { it.id }}");
            }
            val service = services[0]

            var filteredServices: String = System.getenv("SMITHY_GO_BUILD_API")?: ""
            if (filteredServices.isNotEmpty()) {
                for (filteredService in filteredServices.split(",")) {
                    if (!service.id.toString().startsWith(filteredService)) {
                        return@eachFile
                    }
                }
            }

            val serviceTrait = service.getTrait(ServiceTrait::class.javaObjectType).get();

            val sdkId = serviceTrait.sdkId
                    .replace("-", "")
                    .replace(" ", "")
                    .toLowerCase();
            val projectionContents = Node.objectNodeBuilder()
                    .withMember("imports", Node.fromStrings("${models.absolutePath}${File.separator}${file.name}"))
                    .withMember("plugins", Node.objectNode()
                            .withMember("go-codegen", Node.objectNodeBuilder()
                                    .withMember("service", service.id.toString())
                                    .withMember("module", "github.com/nifcloud/nifcloud-sdk-go/service/$sdkId")
                                    .build()))
                    .build()
            projectionsBuilder.withMember(sdkId + "." + service.version.toLowerCase(), projectionContents)
        }

        file("smithy-build.json").writeText(Node.prettyPrintJson(Node.objectNodeBuilder()
                .withMember("version", "1.0")
                .withMember("projections", projectionsBuilder.build())
                .build()))
    }
}

// Run the `buildSdk` automatically.
tasks["build"]
        .dependsOn(tasks["generate-smithy-build"])
        .finalizedBy(tasks["buildSdk"])

// ensure built artifacts are put into the SDK's folders
tasks.create<Exec>("copyGoCodegen") {
    dependsOn ("buildSdk")
    commandLine ("$rootDir/copy_go_codegen.sh", "$rootDir/..", (tasks["buildSdk"] as SmithyBuild).outputDirectory.absolutePath)
}
tasks["buildSdk"].finalizedBy(tasks["copyGoCodegen"])

tasks.create<Exec>("modapi") {
    dependsOn ("copyGoCodegen")
    commandLine ("go", "run", "-tags", "codegen", "$rootDir/../private/model/cli/mod-api/main.go", "-path", "$rootDir/../service")
}
tasks["copyGoCodegen"].finalizedBy(tasks["modapi"])
