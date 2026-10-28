Profile:        EEMPISocialHistoryLegalRelationship
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-legal-relationship
Title:          "EE MPI SocialHistory Legal Relationship"
Description:    "Type of legal relationship and custody status between the patient and the person"
* status = #final (exactly)
* contained 1..1
* contained ^slicing.discriminator[0].type = #type
* contained ^slicing.discriminator[0].path = "$this"
* contained ^slicing.ordered = false
* contained ^slicing.rules = #open
* contained contains relatedPerson 1..1
* contained[relatedPerson] only RelatedPerson
* contained[relatedPerson] ^short = "Person with whom the patient has a valid official relationship"
* contained[relatedPerson].implicitRules ..0
* contained[relatedPerson].contained ..0
* contained[relatedPerson].modifierExtension ..0
* contained[relatedPerson].active ..0
* contained[relatedPerson].extension contains EEMPIRelatedPersonDeceased named deceasedDateTime 0..1
* contained[relatedPerson].extension[deceasedDateTime] ^short = "Time of death"

* contained[relatedPerson].relationship 1..1
* contained[relatedPerson].relationship ^short = "Type of relationship between patient and related person"
* contained[relatedPerson].relationship from $legal-relationship-type-VS (required)

* category 1..1
* category.coding 1..1
* category.coding[obscat] 1..1
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)

* code = $SCT#125676002 "Person"

* subject 1..1
* subject only Reference(EEMPIPatientVerified)
* performer 1..1
* performer only Reference(EEBaseRelatedPerson)
* performer ^short = "Reference to the contained RelatedPerson resource"
* value[x] 0..1
* value[x] only CodeableConcept
* valueCodeableConcept from $custody-type-VS
* value[x] ^short = "Type of custody between the patient and the related person (if any)"

* effective[x] ..0
* encounter ..0
* note ..0
* basedOn ..0
* partOf ..0
* component ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0
* interpretation ..0
* bodyStructure ..0
* referenceRange ..0
* implicitRules ..0
* modifierExtension ..0
* dataAbsentReason ..0

Extension:      EEMPIRelatedPersonDeceased
Id:             ee-mpi-related-person-deceased
Title:          "EE MPI RelatedPerson Deceased"
Description:    "Time of death of the related person"
Context:        RelatedPerson
* ^url = "https://fhir.ee/mpi/StructureDefinition/ee-mpi-related-person-deceased"
* value[x] only dateTime
* value[x] 1..1
* value[x] ^short = "Time of death"

Instance: LegalRelationshipRelatedPerson1
InstanceOf: RelatedPerson
Usage:  #inline
* patient = Reference(Patient/pat1)
* identifier
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "48501212710"
* name
  * family = "Tamm"
  * given = "Annika"
* relationship
  * coding
    * system = $SCT
    * code = #72705000
    * display = "Mother"


Instance: LegalRelationship1
InstanceOf: EEMPISocialHistoryLegalRelationship
Description: "Example of patient legal relationship"
Usage: #example
* contained[+] = LegalRelationshipRelatedPerson1
* subject = Reference(Patient/pat1)
* performer[0] = Reference(LegalRelationshipRelatedPerson1)
* valueCodeableConcept = $custody-type#H10 "Täielik isikuhooldusõigus"

Instance: LegalRelationshipRelatedPerson2
InstanceOf: RelatedPerson
Usage:  #inline
* patient = Reference(Patient/pat1)
* identifier
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "48501212710"
* name
  * family = "Tamm"
  * given = "Annika"
* relationship
  * coding
    * system = $v3-RoleClass
    * code = #GUARD
    * display = "guardian"

Instance: LegalRelationship2
InstanceOf: EEMPISocialHistoryLegalRelationship
Description: "Example of patient legal relationship"
Usage: #example
* contained[+] = LegalRelationshipRelatedPerson2
* subject = Reference(Patient/pat1)
* performer[0] = Reference(LegalRelationshipRelatedPerson2)

Instance: LegalRelationshipExampleChild1
InstanceOf: RelatedPerson
Description: "Child of the patient, used in the Patient/$legal-relationship example"
Usage: #inline
* id = "3ffbb9c2-064b-43d3-8b15-d512a743ead2"
* identifier.system = "https://fhir.ee/sid/pid/est/ni"
* identifier.value = "62308290024"
* patient = Reference(Patient/pat1)
* relationship = $SCT#67822003 "Child"
* name.family = "KARUMÕMM"
* name.given = "KATI"

Instance: LegalRelationshipExampleChild2
InstanceOf: RelatedPerson
Description: "Child of the patient, used in the Patient/$legal-relationship example"
Usage: #inline
* id = "5b8723fb-e4bd-4293-b123-7723b85cd14b"
* identifier.system = "https://fhir.ee/sid/pid/est/ni"
* identifier.value = "62308290024"
* patient = Reference(Patient/pat1)
* relationship = $SCT#67822003 "Child"
* name.family = "KARUMÕMM"
* name.given = "KATI"

Instance: LegalRelationshipExampleChildDeceased
InstanceOf: RelatedPerson
Description: "Deceased child of the patient, used in the Patient/$legal-relationship example"
Usage: #inline
* id = "9c1d7e42-5a3b-4f6e-8d2a-1b7c4e9f0a36"
* extension[0].url = "https://fhir.ee/mpi/StructureDefinition/ee-mpi-related-person-deceased"
* extension[0].valueDateTime = "2024-03-15"
* identifier.system = "https://fhir.ee/sid/pid/est/ni"
* identifier.value = "51503150012"
* patient = Reference(Patient/pat1)
* relationship = $SCT#67822003 "Child"
* name.family = "KARUMÕMM"
* name.given = "MARTIN"

Instance: LegalRelationshipExample1
InstanceOf: EEMPISocialHistoryLegalRelationship
Description: "Legal relationship with personal custody, used in the Patient/$legal-relationship example"
Usage: #inline
* id = "legal-relationship-example-1"
* contained[relatedPerson] = LegalRelationshipExampleChild1
* subject = Reference(Patient/pat1)
* issued = "2026-03-18T12:48:40.304+02:00"
* performer.reference = "#3ffbb9c2-064b-43d3-8b15-d512a743ead2"
* valueCodeableConcept = $custody-type#H10 "Täielik isikuhooldusõigus"

Instance: LegalRelationshipExample2
InstanceOf: EEMPISocialHistoryLegalRelationship
Description: "Legal relationship with property custody, used in the Patient/$legal-relationship example"
Usage: #inline
* id = "legal-relationship-example-2"
* contained[relatedPerson] = LegalRelationshipExampleChild2
* subject = Reference(Patient/pat1)
* issued = "2026-03-18T12:48:40.304+02:00"
* performer.reference = "#5b8723fb-e4bd-4293-b123-7723b85cd14b"
* valueCodeableConcept = $custody-type#H20 "Täielik varahooldusõigus"

Instance: LegalRelationshipExample3
InstanceOf: EEMPISocialHistoryLegalRelationship
Description: "Legal relationship with a deceased related person, used in the Patient/$legal-relationship example"
Usage: #inline
* id = "legal-relationship-example-3"
* contained[relatedPerson] = LegalRelationshipExampleChildDeceased
* subject = Reference(Patient/pat1)
* issued = "2026-03-18T12:48:40.304+02:00"
* performer.reference = "#9c1d7e42-5a3b-4f6e-8d2a-1b7c4e9f0a36"
* valueCodeableConcept = $custody-type#H10 "Täielik isikuhooldusõigus"

Instance: PatientLegalRelationshipExample
InstanceOf: Bundle
Description: "Example of Patient/$legal-relationship response: Bundle (type collection) with patient's legal relationships"
Usage: #example
* id = "patient-legal-relationship-example"
* type = #collection
* entry[0].fullUrl = "https://fhir.ee/mpi/Observation/legal-relationship-example-1"
* entry[=].resource = LegalRelationshipExample1
* entry[+].fullUrl = "https://fhir.ee/mpi/Observation/legal-relationship-example-2"
* entry[=].resource = LegalRelationshipExample2
* entry[+].fullUrl = "https://fhir.ee/mpi/Observation/legal-relationship-example-3"
* entry[=].resource = LegalRelationshipExample3
