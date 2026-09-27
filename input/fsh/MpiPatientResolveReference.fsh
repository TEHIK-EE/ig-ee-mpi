Instance: PatientResolveReferenceNotFoundIssue
InstanceOf: OperationOutcome
Description: "Issue returned when the identifier system is allowed, but no patient was found"
Usage: #inline

* issue[0].severity = #warning
* issue[0].code = #not-found
* issue[0].details.coding[0].system = $mpi
* issue[0].details.coding[0].code = #MPI-021
* issue[0].details.text = "Patsiendi identifikaatorit ei leitud"


Instance: PatientResolveReferenceInvalidSystemIssue
InstanceOf: OperationOutcome
Description: "Issue returned when the identifier system is not in the patsiendi-identifikaatorite-domeen value set"
Usage: #inline

* issue[0].severity = #error
* issue[0].code = #invalid
* issue[0].details.coding[0].system = $mpi
* issue[0].details.coding[0].code = #MPI-067
* issue[0].details.text = "Patsiendi identifikaatori süsteem https://example.com/unknown-system ei ole lubatud"


Instance: PatientResolveReferenceExample
InstanceOf: Parameters
Description: "Example of Patient/$resolve-reference response: first (URL system) and second (OID system) identifiers are resolved to patient references, third identifier is not found, fourth identifier has a system that is not allowed"
Usage: #example
* id = "patient-resolve-reference-example"

* parameter[0].name = "match"
* parameter[0].part[0].name = "identifier"
* parameter[0].part[0].valueIdentifier.system = "https://fhir.ee/sid/pid/est/ni"
* parameter[0].part[0].valueIdentifier.value = "37302102711"
* parameter[0].part[1].name = "patient"
* parameter[0].part[1].valueReference.reference = "Patient/pat1"

* parameter[1].name = "match"
* parameter[1].part[0].name = "identifier"
* parameter[1].part[0].valueIdentifier.system = "urn:oid:1.3.6.1.4.1.28284.6.2.2.16.752.2"
* parameter[1].part[0].valueIdentifier.value = "SWE-12345567"
* parameter[1].part[1].name = "patient"
* parameter[1].part[1].valueReference.reference = "Patient/pat2"

* parameter[2].name = "match"
* parameter[2].part[0].name = "identifier"
* parameter[2].part[0].valueIdentifier.system = "https://fhir.ee/sid/pid/est/ni"
* parameter[2].part[0].valueIdentifier.value = "49010012345"
* parameter[2].part[1].name = "issue"
* parameter[2].part[1].resource = PatientResolveReferenceNotFoundIssue

* parameter[3].name = "match"
* parameter[3].part[0].name = "identifier"
* parameter[3].part[0].valueIdentifier.system = "https://example.com/unknown-system"
* parameter[3].part[0].valueIdentifier.value = "12345678901"
* parameter[3].part[1].name = "issue"
* parameter[3].part[1].resource = PatientResolveReferenceInvalidSystemIssue
