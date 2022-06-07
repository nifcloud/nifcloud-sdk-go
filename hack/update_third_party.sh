#! /bin/bash

set -e

PROJECT_DIR=$(cd $(dirname $0)/..; pwd)
VERSION=$(grep aws-sdk-go-v2 ${PROJECT_DIR}/go.mod | cut -d " " -f 2)
TEMP_HEADER_TXT="/tmp/nifcloud_sdk_go_v2_header.txt"
TEMP_OUTPUT="/tmp/nifcloud_sdl_go_v2_output.go"
TEMP_AWS="/tmp/aws-sdk-go-v2"

replace() {
    if [[ "`uname`" == "Darwin" ]]; then
        sed -i "" -e "s/$1/$2/g" $3
    else
        sed -i -e "s/$1/$2/g" $3
    fi
}

fork_from_aws_sdk_go_v2() {
    DOWNLOAD_URL=$1
    PAGE_URL=$2
    OUTPUT=$3

    mkdir -p `dirname ${OUTPUT}`
    curl -s ${DOWNLOAD_URL} -o ${OUTPUT}
    echo -e "// This code was forked from github.com/aws/aws-sdk-go-v2. DO NOT EDIT.\n// URL: ${PAGE_URL}\n" > ${TEMP_HEADER_TXT}
    cat ${TEMP_HEADER_TXT} ${OUTPUT} > ${TEMP_OUTPUT}
    mv ${TEMP_OUTPUT} ${OUTPUT}
    rm ${TEMP_HEADER_TXT}
}

update_third_party::aws_sdk_go_v2::internal::endpoints() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/internal/endpoints/v2/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/internal/endpoints/v2/"
    BASE_OUTPUT="${PROJECT_DIR}/internal/endpoints/v2/"
    declare -a TARGETS=("endpoints.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::internal::configsources() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/internal/configsources/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/internal/configsources/"
    BASE_OUTPUT="${PROJECT_DIR}/internal/configsources/"
    declare -a TARGETS=("config.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::internal::strings() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/internal/strings/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/internal/strings/"
    BASE_OUTPUT="${PROJECT_DIR}/internal/strings/"
    declare -a TARGETS=("strings.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}


update_third_party::aws_sdk_go_v2::service::internal::acceptencoding() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/service/internal/accept-encoding/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/service/internal/accept-encoding/"
    BASE_OUTPUT="${PROJECT_DIR}/service/internal/accept-encoding/"
    declare -a TARGETS=("accept_encoding_gzip.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::service::internal::s3shared() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/service/internal/s3shared/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/service/internal/s3shared/"
    BASE_OUTPUT="${PROJECT_DIR}/service/internal/s3shared/"
    declare -a TARGETS=("host_id.go metadata_retriever.go response_error_middleware.go xml_utils.go response_error.go arn_lookup.go resource_request.go endpoint_error.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::service::internal::s3shared::arn() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/service/internal/s3shared/arn/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/service/internal/s3shared/arn/"
    BASE_OUTPUT="${PROJECT_DIR}/service/internal/s3shared/arn/"
    declare -a TARGETS=("s3_object_lambda_arn.go arn.go accesspoint_arn.go outpost_arn.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::service::internal::s3shared::config() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/service/internal/s3shared/config/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/service/internal/s3shared/config/"
    BASE_OUTPUT="${PROJECT_DIR}/service/internal/s3shared/config/"
    declare -a TARGETS=("config.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::service::internal::sdk() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/internal/sdk/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/service/sdk/"
    BASE_OUTPUT="${PROJECT_DIR}/internal/sdk/"
    declare -a TARGETS=("time.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::service::s3::internal::arn() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/service/s3/internal/arn/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/service/s3/internal/arn/"
    BASE_OUTPUT="${PROJECT_DIR}/service/storage/internal/arn/"
    declare -a TARGETS=("arn_parser.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::service::s3::internal::customizations() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/service/s3/internal/customizations/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/service/s3/internal/customizations/"
    BASE_OUTPUT="${PROJECT_DIR}/service/storage/internal/customizations/"
    declare -a TARGETS=("signer_wrapper.go update_endpoint.go process_arn_resource.go remove_bucket_middleware.go host.go s3_object_lambda.go handle_200_error.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::internal::v4a() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/internal/v4a/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/internal/v4a/"
    BASE_OUTPUT="${PROJECT_DIR}/internal/v4a/"
    declare -a TARGETS=("credentials.go v4a.go middleware.go error.go presign_middleware.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::internal::v4a::internal::crypto() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/internal/v4a/internal/crypto/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/internal/v4a/internal/crypto/"
    BASE_OUTPUT="${PROJECT_DIR}/internal/v4a/internal/crypto/"
    declare -a TARGETS=("ecc.go compare.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::internal::v4a::internal::v4() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/internal/v4a/internal/v4/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/internal/v4a/internal/v4/"
    BASE_OUTPUT="${PROJECT_DIR}/internal/v4a/internal/v4/"
    declare -a TARGETS=("const.go header_rules.go headers.go hmac.go host.go time.go util.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::aws() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/aws/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/aws/"
    BASE_OUTPUT="${PROJECT_DIR}/nifcloud/"
    declare -a TARGETS=("to_ptr.go from_ptr.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
        replace "package aws" "package nifcloud" ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::smithy::aws::go::codegen() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}"
    BASE_OUTPUT="${PROJECT_DIR}"

    rm -rf ${TEMP_AWS}
    git clone -b ${VERSION} https://github.com/aws/aws-sdk-go-v2.git ${TEMP_AWS} --depth 1 >& /dev/null

    TARGETS=`find "${TEMP_AWS}/codegen/smithy-aws-go-codegen/src/main/java/software/amazon/smithy/aws/go/codegen/" -maxdepth 2 -type f`

    for TARGET in ${TARGETS[@]}; do
        TARGET=`echo ${TARGET//$TEMP_AWS/""}`
        OUTPUT=`echo ${TARGET//"amazon"/"nifcloud"}`
        OUTPUT=`echo ${OUTPUT//"aws"/"nifcloud"}`
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${OUTPUT}
		replace "software.amazon.smithy.aws.go.codegen" "software.nifcloud.smithy.nifcloud.go.codegen" ${OUTPUT}
		replace "\"S3\"" "\"storage\"" ${OUTPUT}
    done

	OUTPUT="${PROJECT_DIR}/codegen/smithy-nifcloud-go-codegen/src/main/resources/META-INF/services/software.amazon.smithy.go.codegen.integration.GoIntegration"
    TARGET="/codegen/smithy-aws-go-codegen/src/main/resources/META-INF/services/software.amazon.smithy.go.codegen.integration.GoIntegration"
    fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${OUTPUT}
    mkdir -p `dirname ${OUTPUT}`
    curl -s ${BASE_DOWNLOAD_URL}${TARGET} -o ${OUTPUT}
	replace "software.amazon.smithy.aws.go.codegen" "software.nifcloud.smithy.nifcloud.go.codegen" ${OUTPUT}
}

update_third_party::aws_sdk_go_v2::internal::endpoints
update_third_party::aws_sdk_go_v2::internal::configsources
update_third_party::aws_sdk_go_v2::internal::strings
update_third_party::aws_sdk_go_v2::service::internal::sdk
update_third_party::aws_sdk_go_v2::service::internal::acceptencoding
update_third_party::aws_sdk_go_v2::service::internal::s3shared
update_third_party::aws_sdk_go_v2::service::internal::s3shared::arn
update_third_party::aws_sdk_go_v2::service::internal::s3shared::config
update_third_party::aws_sdk_go_v2::service::s3::internal::customizations
update_third_party::aws_sdk_go_v2::service::s3::internal::arn
update_third_party::aws_sdk_go_v2::internal::v4a
update_third_party::aws_sdk_go_v2::internal::v4a::internal::crypto
update_third_party::aws_sdk_go_v2::internal::v4a::internal::v4
update_third_party::aws_sdk_go_v2::aws
update_third_party::aws_sdk_go_v2::smithy::aws::go::codegen
