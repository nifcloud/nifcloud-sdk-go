#! /bin/bash

set -e

PROJECT_DIR=$(cd $(dirname $0)/..; pwd)
VERSION=$(grep aws-sdk-go-v2 ${PROJECT_DIR}/go.mod | cut -d " " -f 2)
TEMP_HEADER_TXT="/tmp/nifcloud_sdk_go_v2_header.txt"
TEMP_OUTPUT="/tmp/nifcloud_sdl_go_v2_output.go"

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
    curl -s ${DOWNLOAD_URL} -o ${OUTPUT}
    echo -e "// This code was forked from github.com/aws/aws-sdk-go-v2. DO NOT EDIT.\n// URL: ${PAGE_URL}\n" > ${TEMP_HEADER_TXT}
    cat ${TEMP_HEADER_TXT} ${OUTPUT} > ${TEMP_OUTPUT}
    mv ${TEMP_OUTPUT} ${OUTPUT}
    rm ${TEMP_HEADER_TXT}
}

update_third_party::aws_sdk_go_v2::internal::awsutil() {
    DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/internal/awsutil/prettify.go"
    PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/internal/awsutil/prettify.go"
    OUTPUT="${PROJECT_DIR}/internal/nifcloudutil/prettify.go"
    fork_from_aws_sdk_go_v2 ${DOWNLOAD_URL} ${PAGE_URL} ${OUTPUT}
    replace "package awsutil" "package nifcloudutil" ${OUTPUT}
}

update_third_party::aws_sdk_go_v2::aws::endpoints() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/aws/endpoints/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/aws/endpoints/"
    BASE_OUTPUT="${PROJECT_DIR}/nifcloud/endpoints/"
    declare -a TARGETS=("resolver.go" "v3model.go" "v3model_test.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::aws::signer::v2() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/aws/signer/v2/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/aws/signer/v2/"
    BASE_OUTPUT="${PROJECT_DIR}/nifcloud/signer/v2/"
    declare -a TARGETS=("v2.go" "v2_test.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
        replace "AWSAccessKeyId" "AccessKeyId" ${OUTPUT}
        replace "awstesting" "nifcloudtesting" ${OUTPUT}
        replace "github.com\/aws\/aws-sdk-go-v2\/internal" "github.com\/nifcloud\/nifcloud-sdk-go\/internal" ${BASE_OUTPUT}${TARGET}
        replace "tm4dX8Ks7pzFSVHz7qHdoJVXKRLuC4gWz9eti60d8ks=" "YrCPeKXsjy0M8FLhSXGG9Bgd9SwNCLHG3MsB5\/8kd+A=" ${BASE_OUTPUT}${TARGET}
        replace "Ch6qv3rzXB1SLqY2vFhsgA1WQ9rnQIE2WJCigOvAJwI=" "q4T0AwffHVlwAAHvxxbHDMCS+XH7lQoqNEeN5QoFv3k=" ${BASE_OUTPUT}${TARGET}
        replace "WNdE62UJKLKoA6XncVY\/9RDbrKmcVMdQPQOTAs8SgwQ=" "6QIdpE4CQxfzi42oCJGtz1N\/PeMlWGCRbM9zbXE33XM=" ${BASE_OUTPUT}${TARGET}
        replace "string(len(body))" "fmt.Sprintf(\"%d\", len(body))" ${BASE_OUTPUT}${TARGET}
    done
    replace "\"context\"" "\"context\"\n	\"fmt\"" "${BASE_OUTPUT}v2_test.go"
}

update_third_party::aws_sdk_go_v2::aws() {
    BASE_DOWNLOAD_URL="https://raw.githubusercontent.com/aws/aws-sdk-go-v2/${VERSION}/aws/"
    BASE_PAGE_URL="https://github.com/aws/aws-sdk-go-v2/tree/${VERSION}/aws/"
    BASE_OUTPUT="${PROJECT_DIR}/nifcloud/"
    declare -a TARGETS=("convert_types.go" "convert_types_test.go")

    for TARGET in ${TARGETS[@]}; do
        fork_from_aws_sdk_go_v2 ${BASE_DOWNLOAD_URL}${TARGET} ${BASE_PAGE_URL}${TARGET} ${BASE_OUTPUT}${TARGET}
        replace "package aws" "package nifcloud" ${BASE_OUTPUT}${TARGET}
    done
}

update_third_party::aws_sdk_go_v2::aws::endpoints
update_third_party::aws_sdk_go_v2::internal::awsutil
update_third_party::aws_sdk_go_v2::aws::signer::v2
update_third_party::aws_sdk_go_v2::aws
