Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Instance: Patient-link
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "http://mpi.tehik.ee/fhir/OperationDefinition/Patient-link"
* version = "5.0.0"
* name = "Link"
* title = "Patient Link"
* status = #draft
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The link operation is used to link two patient resources. One of the two patients is identified as the source and one as the target. The link with type 'replaces' created from source to destination patient, the another link with type 'replaced-byä created from destination to source patient. As result of linking the destination patient is deactivated."
* jurisdiction = $m49.htm#Estonia "World"
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
* parameter[+].name = #result-patient
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The details of the Patient resource that is expected to be updated to complete with and must have the same patient.id and provided identifiers included.\r\rThis resource MUST have the link property included referencing the source patient resource.\r\rIt will be used to perform an update on the target patient resource.\r\rIn the absence of this parameter the servers should copy all identifiers from the source patient into the target patient, and include the link property (as shown in the example below).\r\rThis is often used when properties from the source patient are desired to be included in the target resource.\r\rThe receiving system may also apply other internal business rules onto the merge which may make the resource different from what is provided here."
* parameter[=].type = #Patient
//* parameter[+].name = #preview
//* parameter[=].use = #in
//* parameter[=].min = 0
//* parameter[=].max = "1"
//* parameter[=].documentation = "If this is set to true then the merge will not be actually performed; an OperationOutcome will be returned in the Parameters response that will indicate that no merge has occurred and may include other diagnostic info if desired, such as the scale of the merge.\r\re.g. Issue.details.text \"Preview only Patient merge - no issues detected\"\r\re.g. Issue.diagnostics \"Merge would update: 10 years of content or 120 resources\"\r\rThe resulting target patient resource will also be returned in the result."
//* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The status of the response will be one of:\r\r* 200 OK - If the merge request doesn't expect any issues (although warning may be present) for a preview, or was completed without issues if not a preview\r* 202 Accepted - The merge request has been accepted and does not expect any issues and will continue processing the merge in the background, and you can monitor the Task for completion\r* 400 Bad Request - There are errors in the input parameters that need to corrected\r* 422 Unprocessable Entity - Business rules prevent this merge from completing\r\rThe Parameters resource will include:\r\r* The Input parameters to the operation\r* An OperationOutcome containing errors, warnings, and information messages\r* The resulting merged Patient resource (or a patient reference if the patient is not committed)\r* Optionally a Task resource to track any additional processing that was required."
* parameter[=].type = #Parameters



Instance: Patient-unlink
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "http://mpi.tehik.ee/fhir/OperationDefinition/Patient-unlink"
* version = "5.0.0"
* name = "Unlink"
* title = "Patient Unlink"
* status = #draft
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The unlink operation is used to unlink two patient resources. One of the two patients is identified as the source and one as the target. The links between the source and destination Patients will be removed. Destination resource will be reactivated."
* jurisdiction = $m49.htm#Estonia "World"
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
* parameter[+].name = #result-patient
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The details of the Patient resource that is expected to be updated to complete with and must have the same patient.id and provided identifiers included.\r\rThis resource MUST have the link property included referencing the source patient resource.\r\rIt will be used to perform an update on the target patient resource.\r\rIn the absence of this parameter the servers should copy all identifiers from the source patient into the target patient, and include the link property (as shown in the example below).\r\rThis is often used when properties from the source patient are desired to be included in the target resource.\r\rThe receiving system may also apply other internal business rules onto the merge which may make the resource different from what is provided here."
* parameter[=].type = #Patient
//* parameter[+].name = #preview
//* parameter[=].use = #in
//* parameter[=].min = 0
//* parameter[=].max = "1"
//* parameter[=].documentation = "If this is set to true then the merge will not be actually performed; an OperationOutcome will be returned in the Parameters response that will indicate that no merge has occurred and may include other diagnostic info if desired, such as the scale of the merge.\r\re.g. Issue.details.text \"Preview only Patient merge - no issues detected\"\r\re.g. Issue.diagnostics \"Merge would update: 10 years of content or 120 resources\"\r\rThe resulting target patient resource will also be returned in the result."
//* parameter[=].type = #boolean
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The status of the response will be one of:\r\r* 200 OK - If the merge request doesn't expect any issues (although warning may be present) for a preview, or was completed without issues if not a preview\r* 202 Accepted - The merge request has been accepted and does not expect any issues and will continue processing the merge in the background, and you can monitor the Task for completion\r* 400 Bad Request - There are errors in the input parameters that need to corrected\r* 422 Unprocessable Entity - Business rules prevent this merge from completing\r\rThe Parameters resource will include:\r\r* The Input parameters to the operation\r* An OperationOutcome containing errors, warnings, and information messages\r* The resulting merged Patient resource (or a patient reference if the patient is not committed)\r* Optionally a Task resource to track any additional processing that was required."
* parameter[=].type = #Parameters




Instance: Patient-foreigner
InstanceOf: OperationDefinition
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 0
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #trial-use
* url = "http://mpi.tehik.ee/fhir/OperationDefinition/Patient-unlink"
* version = "5.0.0"
* name = "Foreigner"
* title = "Patient Foreigner"
* status = #draft
* kind = #operation
* experimental = false
* date = "2023-03-26T15:21:02+11:00"
* publisher = "HL7 Estonia"
* description = "The foreigner operation perform complex search over patient resource."
* jurisdiction = $m49.htm#Estonia "World"
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
* parameter[=].min = 1
* parameter[=].max = "*"
* parameter[=].documentation = "Returns Bundle (with type collection) with Patient instances."
* parameter[=].type = #Bundle