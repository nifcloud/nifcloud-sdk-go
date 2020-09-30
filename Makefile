GOBIN=$(shell pwd)/bin

SDK_CORE_PKGS=./nifcloud/... ./private/... ./internal/...
SDK_MODELS_PKGS=./models/...
SDK_CLIENT_PKGS=./service/...
SDK_ALL_PKGS=${SDK_CLIENT_PKGS} ${SDK_CORE_PKGS} ${SDK_MODELS_PKGS}

all: install-deps generate update-third-party


###################
# Code Generation #
###################
generate: gen-endpoints gen-services

gen-endpoints:
	go generate ./models/endpoints

gen-services:
	go generate ./service

update-third-party:
	./hack/update_third_party.sh



###########
# Testing #
###########
test: lint core-unit client-integ

#######################
# Integration Testing #
#######################
client-integ:
	@echo "Integration Testing SDK clients"
	go test -count=1 -tags "integration" -v -run '^TestInteg_' ${SDK_CLIENT_PKGS}

################
# Unit Testing #
################
core-unit:
	@echo "go test SDK and vendor packages"
	go test -covermode count -coverprofile coverage.out ${SDK_CORE_PKGS}
	go tool cover -func=coverage.out | grep total | awk '{print "total_covers:"$$3}'

##################
# Linting/Verify #
##################
lint:
	${GOBIN}/golangci-lint run

##################
# Install tools  #
##################
install-deps:
	mkdir -p ${GOBIN}
	GOBIN=${GOBIN} go install --tags codegen github.com/aws/aws-sdk-go-v2/private/model/cli/gen-endpoints
	GOBIN=${GOBIN} go install --tags codegen github.com/aws/aws-sdk-go-v2/private/model/cli/gen-api
	GOBIN=${GOBIN} go install github.com/golangci/golangci-lint/cmd/golangci-lint
