Profile:        EEMPISocialHistoryLegalRelationship
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-legal-relationship
Title:          "EE MPI SocialHistory Legal Relationship"
Description:    "Kehtiv ametlik suhe patsiendiga ja isiku hooldusõigus (Rahvastikuregistri andmete põhinev)."
* status = #final (exactly)
* contained 1..1
* contained ^slicing.discriminator[0].type = #type
* contained ^slicing.discriminator[0].path = "$this"
* contained ^slicing.ordered = false
* contained ^slicing.rules = #open
* contained contains relatedPerson 1..1
* contained[relatedPerson] only RelatedPerson
* contained[relatedPerson].implicitRules ..0
* contained[relatedPerson].contained ..0
* contained[relatedPerson].modifierExtension ..0
* contained[relatedPerson].active ..0
* contained[relatedPerson] ^short = "Isik, kellega patsiendil on kehtiv ametlik suhe"
* contained[relatedPerson].relationship 1..1
* contained[relatedPerson].relationship ^short = "Suhetüüp patsiendi ja seotud isiku vahel"
* contained[relatedPerson].relationship ^slicing.discriminator.type = #value
* contained[relatedPerson].relationship ^slicing.discriminator.path = "coding.system"
* contained[relatedPerson].relationship ^slicing.rules = #open
* contained[relatedPerson].relationship contains
    class 0..1 and
    person 0..1
* contained[relatedPerson].relationship[class] 0..1
* contained[relatedPerson].relationship[class] ^short = "Eestkoste seos roleClass baasil"
* contained[relatedPerson].relationship[class] from $relationship-relation-VS
* contained[relatedPerson].relationship[class].coding.system = $v3-RoleClass (exactly)
* contained[relatedPerson].relationship[person] 0..1
* contained[relatedPerson].relationship[person] ^short = "Muu isiku seos SNOMED CT baasil"
//* contained[relatedPerson].relationship[person] from $relationship-relation-VS (required)
* contained[relatedPerson].relationship[person].coding.system = $SCT (exactly)

* category 1..1
* category.coding 1..1
* category.coding[obscat] 1..1
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = $SCT#48176007 "Social context"
* effective[x] ..0
* subject 1..1 MS
* subject only Reference(EEMPIPatientVerified)
* performer 1..1 MS
* performer only Reference(EEBaseRelatedPerson)
* performer ^short = "Viide contained RelatedPerson ressursile"
* value[x] 0..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from $power-of-attorney-type-VS
* value[x] ^short = "Hooldusõiguse liik patsiendi ja seotud isiku vahel (kui on olemas)"
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
    * system = "http://snomed.info/sct"
    * code = #72705000
    * display = "Mother"


Instance: LegalRelationship1
InstanceOf: EEMPISocialHistoryLegalRelationship
Description: "Example of patient legal relationship"
Usage: #example
* contained[+] = LegalRelationshipRelatedPerson1
* subject = Reference(Patient/pat1)
* performer[0] = Reference(LegalRelationshipRelatedPerson1)
* valueCodeableConcept = $power-of-attorney-type#H10 "Täielik isikuhooldusõigus"

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
    * system = "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
    * code = #GUARD
    * display = "guardian"

Instance: LegalRelationship2
InstanceOf: EEMPISocialHistoryLegalRelationship
Description: "Example of patient legal relationship"
Usage: #example
* contained[+] = LegalRelationshipRelatedPerson2
* subject = Reference(Patient/pat1)
* performer[0] = Reference(LegalRelationshipRelatedPerson2)
