// +build codegen

package main

import (
	"bytes"
	"flag"
	"fmt"
	"go/format"
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
		} else if isServiceFile(filename) {
			if err := rewriteServiceFile(path); err != nil {
				panic(err)
			}
		} else if isServiceTestFile(filename) {
			if err := rewriteServiceTestFile(path); err != nil {
				panic(err)
			}
		} else if isEndpointFile(filename) {
			if err := rewriteEndpointFile(path); err != nil {
				panic(err)
			}
		} else if isSerializersFile(filename) {
			if err := rewriteSerializersFile(path); err != nil {
				panic(err)
			}
		} else if isDeserializersFile(filename) {
			if err := rewriteDeserializersFile(path); err != nil {
				panic(err)
			}
		}
		return nil
	})
}

func isAPIFile(filename string) bool {
	return strings.HasPrefix(filename, "api_op")
}

func isServiceFile(filename string) bool {
	return filename == "api_client.go"
}

func isServiceTestFile(filename string) bool {
	return filename == "api_client_test.go"
}

func isEndpointFile(filename string) bool {
	return filename == "endpoints.go"
}

func isSerializersFile(filename string) bool {
	return filename == "serializers.go"
}

func isDeserializersFile(filename string) bool {
	return filename == "deserializers.go"
}

func rewrite(path string, imports []map[string]string, replaces []map[string]string, appends ...string) error {
	fset := token.NewFileSet()
	f, err := parser.ParseFile(fset, path, nil, parser.ParseComments)
	if err != nil {
		return err
	}

	for _, imp := range imports {
		for org, replace := range imp {
			importStrings := strings.Split(org, " ")
			if org == "" {
				if len(importStrings) > 1 {
					_ = astutil.AddNamedImport(fset, f, importStrings[0], importStrings[1])
				} else {
					_ = astutil.AddImport(fset, f, replace)
				}
			} else if replace == "" {
				if len(importStrings) > 1 {
					_ = astutil.DeleteNamedImport(fset, f, importStrings[0], importStrings[1])
				} else {
					_ = astutil.DeleteImport(fset, f, org)
				}
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

	for _, ap := range appends {
		code = append(code, []byte(ap)...)
	}

	code, err = format.Source(code)
	if err != nil {
		return err
	}
	return ioutil.WriteFile(path, code, 0644)
}

func rewriteAPIFile(path string) error {
	imports := []map[string]string{}
	replaces := []map[string]string{}

	var signVersion int
	serviceName := filepath.Base(filepath.Dir(path))
	switch serviceName {
	case "computing":
		signVersion = 2
	case "dns":
		signVersion = 3
	default:
		signVersion = 4
	}

	// nifcloud original signVersion add sign middleware
	if signVersion != 4 {
		replaces = append(
			replaces,
			map[string]string{"if err = awsmiddleware.AddRawResponseToMetadata\\(stack\\); err != nil {": fmt.Sprintf(
				"if err = addHTTPSignerV%dMiddleware(stack, options); err != nil { return err }\nif err = awsmiddleware.AddRawResponseToMetadata(stack); err != nil {",
				signVersion),
			})
	}

	return rewrite(path, imports, replaces)
}

func rewriteSerializersFile(path string) error {
	imports := []map[string]string{}
	replaces := []map[string]string{}

	// support like `/v1/clusters/{name}:setsize` uri format
	replaces = append(replaces, map[string]string{
		"}/:": "}:",
	})

	// remove Operation suffix
	replaces = append(replaces, map[string]string{
		`Operation"`: `"`,
	})

	serviceName := filepath.Base(filepath.Dir(path))
	if serviceName == "computing" {
		// computing api path is `/api/`
		replaces = append(replaces, map[string]string{
			"operationPath := \"/\"": "operationPath := \"/api/\"",
		})

		imports = append(imports, map[string]string{
			"": "github.com/nifcloud/nifcloud-sdk-go/internal/serializers",
		})

		// to use internal/serializers
		replaces = append(
			replaces,
			map[string]string{
				"awsEc2query_serializeDocumentRequestUserData\\(v\\.":                "serializers.SerializeDocumentRequestUserData(v.",
				"awsEc2query_serializeDocumentListOfRequestLoadBalancerNames\\(v\\.": "serializers.SerializeDocumentListOfRequestLoadBalancerNames(v.",
			})
	}

	if serviceName == "ess" {
		imports = append(imports, map[string]string{
			"": "github.com/nifcloud/nifcloud-sdk-go/internal/serializers",
			"smithytime github.com/aws/smithy-go/time": "",
		})
		imports = append(imports, map[string]string{
			"": "reflect",
		})

		// to use internal/serializers
		replaces = append(
			replaces,
			map[string]string{
				"smithytime.FormatDateTime\\(": "serializers.FormatGetDeliveryLogDateTime(reflect.ValueOf(*v).Type().Name(),",
			})
	}

	if serviceName == "nas" {
		imports = append(imports, map[string]string{
			"": "github.com/nifcloud/nifcloud-sdk-go/internal/serializers",
			"smithytime github.com/aws/smithy-go/time": "",
		})
		imports = append(imports, map[string]string{
			"": "reflect",
		})

		// to use internal/serializers
		replaces = append(
			replaces,
			map[string]string{
				"smithytime.FormatDateTime\\(": "serializers.FormatGetMetricStatisticsDateTime(reflect.ValueOf(*v).Type().Name(),",
			})
	}

	if serviceName == "rdb" {
		imports = append(imports, map[string]string{
			"": "github.com/nifcloud/nifcloud-sdk-go/internal/serializers",
			"smithytime github.com/aws/smithy-go/time": "",
		})
		imports = append(imports, map[string]string{
			"": "reflect",
		})

		// to use internal/serializers
		replaces = append(
			replaces,
			map[string]string{
				"smithytime.FormatDateTime\\(": "serializers.FormatGetMetricStatisticsDateTime(reflect.ValueOf(*v).Type().Name(),",
			})
	}

	return rewrite(path, imports, replaces)
}

func rewriteDeserializersFile(path string) error {
	imports := []map[string]string{}
	replaces := []map[string]string{}

	// remove Operation suffix
	replaces = append(replaces, map[string]string{
		"OperationResult": "Result",
	})

	return rewrite(path, imports, replaces)
}

func rewriteServiceFile(path string) error {
	imports := []map[string]string{
		{"": "github.com/nifcloud/nifcloud-sdk-go/nifcloud"},
		{"github.com/aws/aws-sdk-go-v2/internal/configsources": "github.com/nifcloud/nifcloud-sdk-go/internal/configsources"},
	}
	replaces := []map[string]string{
		{"aws.Config": "nifcloud.Config"},
		{"goModuleVersion": "nifcloud.SDKVersion"},
	}

	var appends string

	var signVersion int
	serviceName := filepath.Base(filepath.Dir(path))
	switch serviceName {
	case "computing":
		signVersion = 2
	case "dns":
		signVersion = 3
	default:
		signVersion = 4
	}

	// nifcloud original signVersion add sign middleware
	if signVersion != 4 {
		imports = append(imports, map[string]string{
			"": fmt.Sprintf("github.com/nifcloud/nifcloud-sdk-go/nifcloud/signer/v%d", signVersion)},
		)
		replaces = append(replaces, map[string]string{
			"resolveHTTPClient\\(&options\\)":             fmt.Sprintf("resolveHTTPClient(&options)\n\nresolveHTTPSignerV%d(&options)", signVersion),
			"EndpointResolver EndpointResolver":           fmt.Sprintf("EndpointResolver EndpointResolver\n\nHTTPSignerV%d HTTPSignerV%d", signVersion, signVersion),
			"ClientLogMode aws.ClientLogMode":             "ClientLogMode aws.ClientLogMode\n\nCredentials aws.CredentialsProvider",
			"RuntimeEnvironment: cfg.RuntimeEnvironment,": "RuntimeEnvironment: cfg.RuntimeEnvironment,\nCredentials: cfg.Credentials,",
		})
		appends = fmt.Sprintf(`
            func addHTTPSignerV%dMiddleware(stack *middleware.Stack, o Options) error {
            	mw := v%d.NewSignHTTPRequestMiddleware(v%d.SignHTTPRequestMiddlewareOptions{
            		CredentialsProvider: o.Credentials,
            		Signer: o.HTTPSignerV%d,
            		LogSigning: o.ClientLogMode.IsSigning(),
            	})
            	return stack.Finalize.Add(mw, middleware.After)
            }
            
            type HTTPSignerV%d interface {
            	SignHTTP(ctx context.Context, credentials aws.Credentials, r *smithyhttp.Request, optFns ...func(*v%d.SignerOptions)) error
            }

            func resolveHTTPSignerV%d(o *Options) {
            	if o.HTTPSignerV%d != nil {
            		return
            	}
            	o.HTTPSignerV%d = newDefaultV%dSigner(*o)
            }
            
            func newDefaultV%dSigner(o Options) *v%d.Signer {
            	return v%d.NewSigner(func(so *v%d.SignerOptions) {
            		so.Logger = o.Logger
            		so.LogSigning = o.ClientLogMode.IsSigning()
            	})
            }
		`, signVersion, signVersion, signVersion, signVersion, signVersion, signVersion, signVersion,
			signVersion, signVersion, signVersion, signVersion, signVersion, signVersion, signVersion)
	}
	return rewrite(path, imports, replaces, appends)
}

func rewriteServiceTestFile(path string) error {
	imports := []map[string]string{
		{"": "github.com/nifcloud/nifcloud-sdk-go/nifcloud"},
	}
	replaces := []map[string]string{
		{"aws.Config": "nifcloud.Config"},
	}

	return rewrite(path, imports, replaces)
}

func rewriteEndpointFile(path string) error {
	imports := []map[string]string{
		{"github.com/aws/aws-sdk-go-v2/internal/endpoints/v2": "github.com/nifcloud/nifcloud-sdk-go/internal/endpoints/v2"},
	}
	replaces := []map[string]string{}

	return rewrite(path, imports, replaces)
}
