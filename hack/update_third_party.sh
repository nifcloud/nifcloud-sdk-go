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
update_third_party::aws_sdk_go_v2::aws
update_third_party::aws_sdk_go_v2::smithy::aws::go::codegen
