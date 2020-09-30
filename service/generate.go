package service

//go:generate ../bin/gen-api -path=../service ../models/apis/*/*/api-2.json
//go:generate go run -tags codegen ../private/model/cli/mod-api/main.go -path ../service
//go:generate gofmt -s -w ../service
