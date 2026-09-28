Instance: PatientResolveReferenceNotFoundIssue
InstanceOf: OperationOutcome
Description: "Issue returned when the identifier system is allowed, but no patient was found"
Usage: #inline

* issue[0].severity = #warning
* issue[0].code = #not-found
* issue[0].details.coding[0].system = $mpi
* issue[0].details.coding[0].code = #MPI-021
* issue[0].details.text = "Patsienti ei leitud"


Instance: PatientResolveReferenceInvalidSystemIssue
InstanceOf: OperationOutcome
Description: "Issue returned when the identifier system is not in the patsiendi-identifikaatorite-domeen value set"
Usage: #inline

* issue[0].severity = #error
* issue[0].code = #invalid
* issue[0].details.coding[0].system = $mpi
* issue[0].details.coding[0].code = #MPI-067
* issue[0].details.text = "Patsiendi identifikaatori süsteem https://example.com/unknown-system ei ole lubatud"


Instance: PatientResolveReferenceSwedish
InstanceOf: EEMPIPatientVerified
Description: "Patient with a Swedish national identifier, used in the Patient/$resolve-reference example."
Usage: #example
* id = "pat3"
* identifier[0]
  * system = "https://fhir.ee/sid/pid/swe/ni"
  * value = "198112189876"
* name[official]
  * use = #official
  * given = "Anna"
  * family = "Svensson"
* gender = #female
* birthDate = "1981-12-18"


Instance: PatientResolveReferenceFinnish
InstanceOf: EEMPIPatientVerified
Description: "Patient with a Finnish national identifier, used in the Patient/$resolve-reference example."
Usage: #example
* id = "pat4"
* identifier[0]
  * system = "https://fhir.ee/sid/pid/fin/ni"
  * value = "131052-308T"
* name[official]
  * use = #official
  * given = "Matti"
  * family = "Virtanen"
* gender = #male
* birthDate = "1952-10-13"


Instance: PatientResolveReferenceExample
InstanceOf: Parameters
Description: "Example of Patient/$resolve-reference response: first and second (URL systems) and third (OID system) identifiers are resolved to patient references, fourth identifier is not found, fifth identifier has a system that is not allowed"
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
* parameter[1].part[0].valueIdentifier.system = "https://fhir.ee/sid/pid/fin/ni"
* parameter[1].part[0].valueIdentifier.value = "131052-308T"
* parameter[1].part[1].name = "patient"
* parameter[1].part[1].valueReference.reference = "Patient/pat4"

* parameter[2].name = "match"
* parameter[2].part[0].name = "identifier"
* parameter[2].part[0].valueIdentifier.system = "urn:oid:1.3.6.1.4.1.28284.6.2.2.16.752.2"
* parameter[2].part[0].valueIdentifier.value = "198112189876"
* parameter[2].part[1].name = "patient"
* parameter[2].part[1].valueReference.reference = "Patient/pat3"

* parameter[3].name = "match"
* parameter[3].part[0].name = "identifier"
* parameter[3].part[0].valueIdentifier.system = "https://fhir.ee/sid/pid/est/ni"
* parameter[3].part[0].valueIdentifier.value = "49010012345"
* parameter[3].part[1].name = "issue"
* parameter[3].part[1].resource = PatientResolveReferenceNotFoundIssue

* parameter[4].name = "match"
* parameter[4].part[0].name = "identifier"
* parameter[4].part[0].valueIdentifier.system = "https://example.com/unknown-system"
* parameter[4].part[0].valueIdentifier.value = "12345678901"
* parameter[4].part[1].name = "issue"
* parameter[4].part[1].resource = PatientResolveReferenceInvalidSystemIssue
