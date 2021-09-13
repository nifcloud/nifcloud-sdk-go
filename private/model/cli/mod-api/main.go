// +build codegen

package main

import (
	"bytes"
	"flag"
	"fmt"
	"go/parser"
	"go/printer"
	"go/token"
	"io/ioutil"
	"os"
	"path/filepath"
	"regexp"
	"strings"

	"golang.org/x/tools/go/ast/astutil"
)

const (
	awsDocumentBase      = "https://docs.aws.amazon.com/goto/WebAPI/"
	nifcloudDocumentBase = "https://pfs.nifcloud.com/api/"
)

func main() {
	var svcPath string

	flag.StringVar(&svcPath, "path", "service",
		"The `path` to service clients.",
	)
	flag.Parse()

	svcPath = filepath.FromSlash(svcPath)

	filepath.Walk(svcPath, func(path string, info os.FileInfo, err error) error {
		if info.IsDir() {
			return nil
		}

		filename := filepath.Base(path)
		if isAPIFile(filename) {
			if err := rewriteAPIFile(path); err != nil {
				panic(err)
			}
		} else if isDocumentFile(filename) {
			if err := rewriteDocumentFile(path); err != nil {
				panic(err)
			}
		} else if isServiceFile(filename) {
			if err := rewriteServiceFile(path); err != nil {
				panic(err)
			}
		} else if isInterfaceFile(filename) {
			if err := rewriteInterfaceFile(path); err != nil {
				panic(err)
			}
		} else if isIntgrationTestFile(filename) {
			if err := rewriteIntegrationTestFile(path); err != nil {
				panic(err)
			}
		}

		return nil
	})
}

func isAPIFile(filename string) bool {
	return strings.HasPrefix(filename, "api_op") || filename == "api_enums.go" || filename == "api_types.go"
}

func isDocumentFile(filename string) bool {
	return filename == "api_doc.go"
}

func isServiceFile(filename string) bool {
	return filename == "api_client.go"
}

func isInterfaceFile(filename string) bool {
	return filename == "interface.go"
}

func isIntgrationTestFile(filename string) bool {
	return filename == "api_integ_test.go"
}

func rewrite(path string, imports []map[string]string, replaces []map[string]string) error {
	fset := token.NewFileSet()
	f, err := parser.ParseFile(fset, path, nil, parser.ParseComments)
	if err != nil {
		return err
	}

	for _, imp := range imports {
		for org, replace := range imp {
			if org == "" {
				_ = astutil.AddImport(fset, f, replace)
			} else {
				_ = astutil.RewriteImport(fset, f, org, replace)
			}
		}
	}

	buf := &bytes.Buffer{}
	pp := &printer.Config{Tabwidth: 8, Mode: printer.UseSpaces | printer.TabIndent}
	pp.Fprint(buf, fset, f)

	code := []byte(buf.String())
	for _, rep := range replaces {
		for org, replace := range rep {
			code = regexp.MustCompile(org).ReplaceAll(code, []byte(replace))
		}
	}
	return ioutil.WriteFile(path, code, 0644)
}

func rewriteAPIFile(path string) error {
	serviceName := filepath.Base(filepath.Dir(path))
	if serviceName == "computing" {
		serviceName = "rest"
	}
	operationName := filepath.Base(path[strings.LastIndex(path, "_")+1 : len(path)-len(filepath.Ext(path))])
	nifcloudReference := fmt.Sprintf("%s%s/%s.htm", nifcloudDocumentBase, serviceName, operationName)
	awsReference := fmt.Sprintf("%s.*/%s", awsDocumentBase, operationName)

	imports := []map[string]string{
		{"github.com/aws/aws-sdk-go-v2/internal/awsutil": "github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"},
		{"github.com/aws/aws-sdk-go-v2/private/protocol/rdb": "github.com/nifcloud/nifcloud-sdk-go/private/protocol/rdb"},
		{"github.com/aws/aws-sdk-go-v2/private/protocol/nas": "github.com/nifcloud/nifcloud-sdk-go/private/protocol/nas"},
	}
	replaces := []map[string]string{
		{"awsutil": "nifcloudutil"},
		{awsReference: nifcloudReference},
	}

	return rewrite(path, imports, replaces)
}

func rewriteDocumentFile(path string) error {
	serviceName := filepath.Base(filepath.Dir(path))
	if serviceName == "computing" {
		serviceName = "rest"
	}

	nifcloudReference := fmt.Sprintf("%s%s/", nifcloudDocumentBase, serviceName)
	awsReference := fmt.Sprintf("%s\\S*", awsDocumentBase)

	replaces := []map[string]string{
		{"https://docs.aws.amazon.com/sdk-for-go/api/": "https://godoc.org/github.com/nifcloud/nifcloud-sdk-go/"},
		{"aws/#Config": "nifcloud/#Config"},
		{awsReference: nifcloudReference},
	}

	return rewrite(path, nil, replaces)
}

func rewriteServiceFile(path string) error {
	imports := []map[string]string{
		{"": "github.com/nifcloud/nifcloud-sdk-go/nifcloud"},
		{"github.com/aws/aws-sdk-go-v2/private/protocol/computing": "github.com/nifcloud/nifcloud-sdk-go/private/protocol/computing"},
		{"github.com/aws/aws-sdk-go-v2/private/protocol/script": "github.com/nifcloud/nifcloud-sdk-go/private/protocol/script"},
		{"github.com/aws/aws-sdk-go-v2/private/protocol/rdb": "github.com/nifcloud/nifcloud-sdk-go/private/protocol/rdb"},
		{"github.com/aws/aws-sdk-go-v2/private/protocol/nas": "github.com/nifcloud/nifcloud-sdk-go/private/protocol/nas"},
		{"github.com/aws/aws-sdk-go-v2/private/protocol/ess": "github.com/nifcloud/nifcloud-sdk-go/private/protocol/ess"},
		{"github.com/aws/aws-sdk-go-v2/aws/signer/v2": "github.com/nifcloud/nifcloud-sdk-go/nifcloud/signer/v2"},
	}
	replaces := []map[string]string{
		{"aws.Config": "nifcloud.Config"},
		{"config,": "config.AWSConfig(),"},
	}

	serviceName := filepath.Base(filepath.Dir(path))
	if serviceName == "dns" {
		imports = append(imports, map[string]string{"github.com/aws/aws-sdk-go-v2/aws/signer/v4": "github.com/nifcloud/nifcloud-sdk-go/nifcloud/signer/v3"})
		replaces = append(replaces, map[string]string{"v4.SignRequestHandler": "v3.SignRequestHandler"})
	}

	return rewrite(path, imports, replaces)
}

func rewriteInterfaceFile(path string) error {
	serviceName := filepath.Base(filepath.Dir(filepath.Dir(path)))
	imports := []map[string]string{
		{fmt.Sprintf("github.com/aws/aws-sdk-go-v2/service/%s", serviceName): fmt.Sprintf("github.com/nifcloud/nifcloud-sdk-go/service/%s", serviceName)},
	}

	return rewrite(path, imports, nil)
}

func rewriteIntegrationTestFile(path string) error {
	serviceName := filepath.Base(filepath.Dir(path))
	imports := []map[string]string{
		{"": "github.com/nifcloud/nifcloud-sdk-go/nifcloud"},
		{"github.com/aws/aws-sdk-go-v2/internal/awstesting/integration": "github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudtesting/integration"},
		{fmt.Sprintf("github.com/aws/aws-sdk-go-v2/service/%s", serviceName): fmt.Sprintf("github.com/nifcloud/nifcloud-sdk-go/service/%s", serviceName)},
	}
	replaces := []map[string]string{
		{"aws.Config": "nifcloud.Config"},
	}

	return rewrite(path, imports, replaces)
}
