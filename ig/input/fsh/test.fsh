/*
CodeSystem:  TestCS
Id:          test-cs
Title:       "Test CS"
Description: "Test CS"
* ^experimental = true
* ^content = #complete
* ^caseSensitive = false
* #H9 "Lapse eraldamine vanemast"
* #H11 "Osaline isikuhooldusõigus"

ValueSet:    TestVS
Id:          test-vs
Title:       "Test VS"
Description: "Test VS"
* ^experimental = true
* include codes from system TestCS


ValueSet: ExampleValueset
Id: example-valueset
* ^contained.resourceType = "CodeSystem"
* ^contained.id = "example-codesystem"
* ^contained.url = "http://example.org/codesystem"
* ^contained.version = "1.0.0"
* ^contained.content = #complete
* ^contained.concept[0] = #example-code-1 "Example Code 1"
* ^contained.concept[+] = #example-code-2 "Example Code 2"
* ^contained.concept[+] = #example-code-3 "Example Code 3"
* ^version = "1.0.0"
* ^status = #active
* include codes from system #example-codesystem
*/