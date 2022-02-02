GOBIN=$(shell pwd)/bin

SDK_CORE_PKGS=./nifcloud/... ./internal/...
SDK_CLIENT_PKGS=./service/...
SDK_ALL_PKGS=${SDK_CLIENT_PKGS} ${SDK_CORE_PKGS}

all: install-deps generate test


###################
# Code Generation #
###################
generate: update-third-party smithy-go-publish-local smithy-generate

smithy-generate:
	cd codegen && ./gradlew clean build -Plog-tests && ./gradlew clean

update-third-party:
	./hack/update_third_party.sh

smithy-go-publish-local:
	rm -rf /tmp/smithy-go-local
	git clone https://github.com/aws/smithy-go /tmp/smithy-go-local
	make -C /tmp/smithy-go-local smithy-clean smithy-publish-local

###########
# Testing #
###########
test: lint unit integration

################
# Unit Testing #
################
unit:
	@echo "go test SDK and vendor packages"
	go test -covermode count -coverprofile coverage.out ${SDK_ALL_PKGS}
	go tool cover -func=coverage.out | grep total | awk '{print "total_covers:"$$3}'

#######################
# Integration Testing #
#######################
integration:
	@echo "Integration Testing SDK clients"
	go test -timeout=10m -count=1 -tags "integration" -v -run '^TestInteg_' ${SDK_CLIENT_PKGS}

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
	GOBIN=${GOBIN} go install github.com/golangci/golangci-lint/cmd/golangci-lint
