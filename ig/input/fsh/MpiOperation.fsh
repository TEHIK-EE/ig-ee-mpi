Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Instance: patient-link
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/OperationDefinition/patient-link"
* version = "5.0.0"
* name = "EEMPIPatientLink"
* title = "Patient Link"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The link operation is used to link two patient resources. One of the two patients is identified as the source and one as the target. The link with type 'replaces' created from source to destination patient, the another link with type 'replaced-byä created from destination to source patient. As result of linking the destination patient is deactivated."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
* code = #link
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
* parameter[=].documentation = "A direct resource reference to the **target** patient resource.\r\rThis is the surviving patient resource, the target for the link."
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



Instance: patient-unlink
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/OperationDefinition/patient-unlink"
* version = "5.0.0"
* name = "EEMPIPatientUnlink"
* title = "Patient Unlink"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The unlink operation is used to unlink two patient resources. One of the two patients is identified as the source and one as the target. The links between the source and destination Patients will be removed. Destination resource will be reactivated."
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



Instance: patient-foreigner
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 0
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/OperationDefinition/patient-foreigner"
* version = "5.0.0"
* name = "EEMPIPatientForeignerSearch"
* title = "Patient Foreigner"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The foreigner operation perform complex search over patient resource."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
* code = #foreigner
//* comment = "There must be exactly 1 source patient, which may  be identified by either the source-patient or source-patient-identifier parameters. Similarly, there must be exactly 1 target patient, identified by either the target-patient or target-patient-identifier parameters. In both cases, either a reference to the patient or a list of identifiers that can be used to identify the patient may be provided, but not both.\r\rThe result-patient.id must be the same as the target patient reference (if the patient reference is provided as an input parameter).\r\rIf a client needs the server to create a new patient merged from the 2 patient resources, the client should create a new patient record and then call the merge operation to merge each source patient resource into the newly created patient resource.\r\rA server may decide to delete the source record, but this is not defined by the standard merge operation, and if this occurs then the target patient's link property will remain unchanged.\r"
* resource = #Patient
* system = false
* type = true
* instance = false
* parameter[0].name = #identifier-country
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Identifikaatori väljaandja riigi 3 kohaline kood ISO standardi järgi. Ei ole kohustuslik."
* parameter[=].type = #string
* parameter[+].name = #birthdate
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Patient birthdate in form yyyy-mm-dd."
* parameter[=].type = #date
* parameter[+].name = #gender
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Patient gender."
* parameter[=].type = #string
* parameter[+].name = #given
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "Patient given name. Eesnimi. Otsing sõna alguse järgi, ei ole tõstetundlik."
* parameter[=].type = #string
* parameter[+].name = #family
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Patient family name. Perekonna nimi. Otsing sõna alguse järgi, ei ole tõstetundlik."
* parameter[=].type = #string
* parameter[+].name = #telecom
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "Telekom'i väärtus, e-mail või tel. number."
* parameter[=].type = #ContactPoint
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "Returns Bundle (with type collection) with Patient instances."
* parameter[=].type = #Bundle



Instance: patient-lookup
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/OperationDefinition/patient-lookup"
* version = "5.0.0"
* name = "EEMPIPatientLookup"
* title = "Patient Lookup"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The lookup operation looking for patient data in the external registers."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
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
* url = "https://fhir.ee/OperationDefinition/patient-legal-guardian"
* version = "5.0.0"
* name = "EEMPIPatientLegalGuardianStatus"
* title = "Patient Legal Guardians"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The list of legal guardians specified in the Population Register."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
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
* url = "https://fhir.ee/OperationDefinition/patient-power-of-attorney"
* version = "5.0.0"
* name = "EEMPIPatientPowerOfAttorneyStatus"
* title = "Patient power of attorneys"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The list of power of attorneys in the Population Register."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
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
* url = "https://fhir.ee/OperationDefinition/patient-education"
* version = "5.0.0"
* name = "EEMPIPatientEducationStatus"
* title = "Patient Education"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The highest education level in the Education Register."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
* code = #education
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

Instance: patient-generate-mrn
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "https://fhir.ee/OperationDefinition/patient-generate-mrn"
* version = "5.0.0"
* name = "EEMPIPatientGenerateMRN"
* title = "Generate Medical Record Number"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "Generate the new unique Medical Record Number may be used for unknown/anonymous patient's identification."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
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
* url = "https://fhir.ee/OperationDefinition/patient-disability"
* version = "5.0.0"
* name = "EEMPIPatientDisability"
* title = "Patient Disability"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The patient disability from Social Insurance Board (SKA)."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
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
* url = "https://fhir.ee/OperationDefinition/patient-incapacity-for-work"
* version = "5.0.0"
* name = "EEMPIPatientIncapacityForWork"
* title = "Patient incapacity for work"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The observation of patient incapacity for work from Social Insurance Board (SKA)."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
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
* url = "https://fhir.ee/OperationDefinition/patient-occupation"
* version = "5.0.0"
* name = "EEMPIPatientOccupation"
* title = "Patient occupation"
* status = #active
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The observation of patient occupations from Employment Register (TÖR)."
* jurisdiction = $m49.htm#Estonia "Estonia"
* affectsState = true
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


