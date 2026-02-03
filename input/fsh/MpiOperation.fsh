Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Instance: patient-link
InstanceOf: OperationDefinition
Usage: #definition
* name = "EEMPIPatientLink"
* title = "Patient Link"
* status = #active
* kind = #operation
* experimental = false
* description = "The link operation is used to link two patient resources. One of the two patients is identified as the source and one as the target. The link with type 'replaces' is created in target patient resource and points to source patient, the another link with type 'replaced-by' is created in source patient resource and points to target patient."
* affectsState = true
* code = #link
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #source-patient
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the **source** patient resource"
* parameter[=].type = #Reference
* parameter[=].targetProfile = "https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient"
* parameter[+].name = #source-patient-identifier
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "An identifier of the source patient"
* parameter[=].type = #Identifier
* parameter[+].name = #target-patient
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the **target** patient resource.\r\rThis is the surviving patient resource, the target for the link."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient"
* parameter[+].name = #target-patient-identifier
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "An identifier of the target patient"
* parameter[=].type = #Identifier
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "In case of successful link operation it returns the target patient resource with newly created link. In case of error returns OperationOutcome with detailed error message."
* parameter[=].type = #Patient



Instance: patient-unlink
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/mpi/OperationDefinition/patient-unlink"
* version = "5.0.0"
* name = "EEMPIPatientUnlink"
* title = "Patient Unlink"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "The unlink operation is used to unlink two patient resources. One of the two patients is identified as the source and one as the target. The links between the source and target Patients will be removed."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
* code = #unlink
//* comment = "There must be exactly 1 source patient, which may  be identified by either the source-patient or source-patient-identifier parameters. Similarly, there must be exactly 1 target patient, identified by either the target-patient or target-patient-identifier parameters. In both cases, either a reference to the patient or a list of identifiers that can be used to identify the patient may be provided, but not both.\r\rThe result-patient.id must be the same as the target patient reference (if the patient reference is provided as an input parameter).\r\rIf a client needs the server to create a new patient merged from the 2 patient resources, the client should create a new patient record and then call the merge operation to merge each source patient resource into the newly created patient resource.\r\rA server may decide to delete the source record, but this is not defined by the standard merge operation, and if this occurs then the target patient's link property will remain unchanged.\r"
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #source-patient
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the **source** patient resource (this may include an identifier)."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"
* parameter[+].name = #source-patient-identifier
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "When source-patient-identifiers are provided, the server is expected to perform an internal lookup to identify the source patient record. The server SHALL reject the request if the provided identifiers do not resolve to a single patient record. This resolution MAY occur asynchronously, for example, as part of a review by a user."
* parameter[=].type = #Identifier
* parameter[+].name = #target-patient
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the **target** patient resource.\r\rThis is the surviving patient resource, the target for the merge."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"
* parameter[+].name = #target-patient-identifier
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "When target-patient-identifiers are provided, the server is expected to perform an internal lookup to identify the target patient record. The server SHALL reject the request if the provided identifiers do not resolve to a single patient record. This resolution MAY occur asynchronously, for example, as part of a review by a user."
* parameter[=].type = #Identifier
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The status of the response will be one of:\r\r* 200 OK - If the merge request doesn't expect any issues (although warning may be present) for a preview, or was completed without issues if not a preview\r* 202 Accepted - The merge request has been accepted and does not expect any issues and will continue processing the merge in the background, and you can monitor the Task for completion\r* 400 Bad Request - There are errors in the input parameters that need to corrected\r* 422 Unprocessable Entity - Business rules prevent this merge from completing\r\rThe Parameters resource will include:\r\r* The Input parameters to the operation\r* An OperationOutcome containing errors, warnings, and information messages\r* The resulting merged Patient resource (or a patient reference if the patient is not committed)\r* Optionally a Task resource to track any additional processing that was required."
* parameter[=].type = #Patient



Instance: patient-foreign
InstanceOf: OperationDefinition
Usage: #definition
* name = "EEMPIPatientForeignSearch"
* title = "Patient Foreign"
* status = #active
* kind = #operation
* experimental = false
* description = "The foreign operation perform complex search over non-estonian patient resources."
* affectsState = false
* code = #foreign
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #identifier-country
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Three-letter country code of the identifier issuer according to the ISO standard."
* parameter[=].type = #string

* parameter[+].name = #birthdate
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Patient's date of birth in yyyy-mm-dd format."
* parameter[=].type = #date

* parameter[+].name = #gender
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Patient's gender."
* parameter[=].type = #string

* parameter[+].name = #given
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Given name. Search supports similarity, allows up to 2 typos, case-insensitive. Comma-separated values are allowed."
* parameter[=].type = #string

* parameter[+].name = #family
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Family name. Search supports similarity, allows up to 2 typos, case-insensitive. Comma-separated values are allowed."
* parameter[=].type = #string

* parameter[+].name = #telecom
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Telecom value, e-mail or phone number. Case-insensitive. Comma-separated values are allowed."
* parameter[=].type = #string

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type collection) with Patient instances."
* parameter[=].type = #Bundle



Instance: patient-lookup
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/mpi/OperationDefinition/patient-lookup"
* version = "5.0.0"
* name = "EEMPIPatientLookup"
* title = "Patient Lookup"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "The lookup operation looking for patient data in the external registers."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = false
* code = #lookup
//* comment = "There must be exactly 1 source patient, which may  be identified by either the source-patient or source-patient-identifier parameters. Similarly, there must be exactly 1 target patient, identified by either the target-patient or target-patient-identifier parameters. In both cases, either a reference to the patient or a list of identifiers that can be used to identify the patient may be provided, but not both.\r\rThe result-patient.id must be the same as the target patient reference (if the patient reference is provided as an input parameter).\r\rIf a client needs the server to create a new patient merged from the 2 patient resources, the client should create a new patient record and then call the merge operation to merge each source patient resource into the newly created patient resource.\r\rA server may decide to delete the source record, but this is not defined by the standard merge operation, and if this occurs then the target patient's link property will remain unchanged.\r"
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #identifier
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The identifier we are looking for."
* parameter[=].type = #Identifier
* parameter[+].name = #source
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Original data source. Supported values: https://mpi.tehik.ee and https://rahvastikuregister.ee. By default *https://mpi.tehik.ee*."
* parameter[=].type = #string
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type 'collection') with Patient instances."
* parameter[=].type = #Bundle



Instance: patient-legal-guardian
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/mpi/OperationDefinition/patient-legal-guardian"
* version = "5.0.0"
* name = "EEMPIPatientLegalGuardianStatus"
* title = "Patient Legal Guardians"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "The list of legal guardians specified in the Population Register."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = false
* code = #legal-guardian
//* comment = "There must be exactly 1 source patient, which may  be identified by either the source-patient or source-patient-identifier parameters. Similarly, there must be exactly 1 target patient, identified by either the target-patient or target-patient-identifier parameters. In both cases, either a reference to the patient or a list of identifiers that can be used to identify the patient may be provided, but not both.\r\rThe result-patient.id must be the same as the target patient reference (if the patient reference is provided as an input parameter).\r\rIf a client needs the server to create a new patient merged from the 2 patient resources, the client should create a new patient record and then call the merge operation to merge each source patient resource into the newly created patient resource.\r\rA server may decide to delete the source record, but this is not defined by the standard merge operation, and if this occurs then the target patient's link property will remain unchanged.\r"
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the patient resource."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"
* parameter[+].name = #legal-status
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "In what legal status related persons are returned. Supported SNOMED codes: 365569001 - Finding of wardship, 58626002 - Legal guardian"
* parameter[=].type = #string
* parameter[+].name = #nocache
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies when the operation should ignore the value stored in the cache and should re-request data from the source. By default *false*."
* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type 'collection') with Observation instances."
* parameter[=].type = #Bundle


Instance: patient-power-of-attorney
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/mpi/OperationDefinition/patient-power-of-attorney"
* version = "5.0.0"
* name = "EEMPIPatientPowerOfAttorneyStatus"
* title = "Patient power of attorneys"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "The list of power of attorneys in the Population Register. Data returned only for a minor. When an adult is given in patient parameter, then only patient's children and dependents under age of 18 are returned."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = false
* code = #power-of-attorney
//* comment = "There must be exactly 1 source patient, which may  be identified by either the source-patient or source-patient-identifier parameters. Similarly, there must be exactly 1 target patient, identified by either the target-patient or target-patient-identifier parameters. In both cases, either a reference to the patient or a list of identifiers that can be used to identify the patient may be provided, but not both.\r\rThe result-patient.id must be the same as the target patient reference (if the patient reference is provided as an input parameter).\r\rIf a client needs the server to create a new patient merged from the 2 patient resources, the client should create a new patient record and then call the merge operation to merge each source patient resource into the newly created patient resource.\r\rA server may decide to delete the source record, but this is not defined by the standard merge operation, and if this occurs then the target patient's link property will remain unchanged.\r"
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the patient resource."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"
* parameter[+].name = #guardian-only
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Whether operation should return only guardians: mother, father or legal guardian. By default *false*. Supported only for minors (under age of 18)."
* parameter[=].type = #boolean
* parameter[+].name = #nocache
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies when the operation should ignore the value stored in the cache and should re-request data from the source. By default *false*."
* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type 'collection') with Observation instances."
* parameter[=].type = #Bundle


Instance: patient-education
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/mpi/OperationDefinition/patient-education"
* version = "5.0.0"
* name = "EEMPIPatientEducationStatus"
* title = "Patient Education"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "The highest education level in the Education Register."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = false
* code = #education
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the patient resource."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"
* parameter[+].name = #nocache
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies when the operation should ignore the value stored in the cache and should re-request data from the source. By default *false*."
* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type 'collection') with [EEMPISocialHistoryEducationLevel](StructureDefinition-ee-mpi-socialhistory-education-level.html) Observation instances."
* parameter[=].type = #Bundle

Instance: patient-generate-mrn
InstanceOf: OperationDefinition
Usage: #definition
* name = "EEMPIPatientGenerateMRN"
* title = "Generate Medical Record Number"
* status = #active
* kind = #operation
* experimental = false
* description = "Generate the new unique Medical Record Number may be used for unknown/anonymous patient's identification."
* affectsState = false
* code = #mrn
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns text representataion of Medical Record Number."
* parameter[=].type = #Identifier


Instance: patient-disability
InstanceOf: OperationDefinition
Usage: #definition
* url = "https://fhir.ee/mpi/OperationDefinition/patient-disability"
* version = "5.0.0"
* name = "EEMPIPatientDisability"
* title = "Patient Disability"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "The patient disability from Social Insurance Board (SKA)."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = false
* code = #disability
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the patient resource."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"
* parameter[+].name = #nocache
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies when the operation should ignore the value stored in the cache and should re-request data from the source. By default *false*."
* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type 'collection') with Observation instances."
* parameter[=].type = #Bundle


Instance: patient-incapacity-for-work
InstanceOf: OperationDefinition
Usage: #definition
* url = "https://fhir.ee/mpi/OperationDefinition/patient-incapacity-for-work"
* version = "5.0.0"
* name = "EEMPIPatientIncapacityForWork"
* title = "Patient incapacity for work"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "The observation of patient incapacity for work from Social Insurance Board (SKA)."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = false
* code = #incapacity-for-work
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the patient resource."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"
* parameter[+].name = #nocache
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies when the operation should ignore the value stored in the cache and should re-request data from the source. By default *false*."
* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type 'collection') with Observation instances."
* parameter[=].type = #Bundle


Instance: patient-occupation
InstanceOf: OperationDefinition
Usage: #definition
* url = "https://fhir.ee/mpi/OperationDefinition/patient-occupation"
* version = "5.0.0"
* name = "EEMPIPatientOccupation"
* title = "Patient occupation"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "The observation of patient occupations from Employment Register (TÖR)."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = false
* code = #occupation
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the patient resource."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"
* parameter[+].name = #nocache
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies when the operation should ignore the value stored in the cache and should re-request data from the source. By default *false*."
* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type 'collection') with Observation instances."
* parameter[=].type = #Bundle


Instance: patient-legal-status
InstanceOf: OperationDefinition
Usage: #definition
* url = "https://fhir.ee/mpi/OperationDefinition/patient-legal-status"
* version = "5.0.0"
* name = "EEMPIPatientLegalStatus"
* title = "Patient legal status"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "The observation of patient legal status from Population Register (RR)."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = false
* code = #legal-status
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the patient resource."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"
* parameter[+].name = #nocache
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies when the operation should ignore the value stored in the cache and should re-request data from the source. By default *false*."
* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type 'collection') with Observation instances."
* parameter[=].type = #Bundle


Instance: patient-legal-relationship
InstanceOf: OperationDefinition
Usage: #definition
* url = "https://fhir.ee/mpi/OperationDefinition/patient-legal-relationship"
* name = "EEMPIPatientLegalRelationship"
* title = "Patient legal relationships"
* status = #active
* kind = #operation
* experimental = false
* publisher = "HL7 Estonia"
* description = "Operations that returns a list of valid (at the moment of the request) patient legal relationships based on data from Population Register (RR). Returns also custody types where applicable."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = false
* code = #legal-relationship
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A direct resource reference to the patient resource."
* parameter[=].type = #Reference
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Patient"

* parameter[+].name = #relationship-type
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "Relationship type. If missing, then all relationship types from bound ValueSet are queried."
* parameter[=].type = #code
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = $legal-relationship-type-VS

* parameter[+].name = #custody-type
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "Custody type. If missing, then only personal custody types ('H10', 'H11', 'H12') from bound ValueSet are queried."
* parameter[=].type = #code
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = $custody-type-VS

* parameter[+].name = #nocache
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies when the operation should ignore the value stored in the cache and should re-request data from the source. By default *false*."
* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns Bundle (with type 'collection') with Observation instances of [EEMPISocialHistoryLegalRelationship](StructureDefinition-ee-mpi-socialhistory-legal-relationship.html) profile. If multiple custody types are found between two persons, then multiple Observation instances for the same patient relationship are returned."
* parameter[=].type = #Bundle
