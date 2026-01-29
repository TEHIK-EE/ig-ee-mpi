Alias: $EmploymentStatus = http://terminology.hl7.org/ValueSet/v2-0066

Profile:        EEMPISocialHistoryOccupation
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-occupation
Title:          "EE MPI SocialHistory Occupation"
Description:    "Töötamine"
* status = #final
* category 1..1
* category.coding[obscat] 1..1
* category.coding[obscat] = OBSCAT#social-history "Social history"
* code.coding 1..2
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 0..1 MS and
    snomed 0..1 MS
* code.coding[loinc].system 1..
* code.coding[loinc].system = "http://loinc.org"
* code.coding[loinc].code 1..
* code.coding[loinc].code = #11341-5
* code.coding[loinc].display = "History of occupation"
* code.coding[snomed].system 1..
* code.coding[snomed].system = "http://snomed.info/sct"
* code.coding[snomed].code 1..
* code.coding[snomed].code = #184104002
* code.coding[snomed].display = "Patient occupation"
* effective[x] ..0
* subject 1..1
* subject only Reference(EEMPIPatientVerified)
* performer 1..1
* performer only Reference(EEBaseOrganization)
* performer ^short = "Tööandja asutus. Viide contained ressursile"
* encounter ..0
* value[x] ..0
* basedOn ..0
* partOf ..0
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
* component 0..2
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains job 0..1 MS and rate 0..1
* component[job].code = $SCT#160922003 "Job details"
* component[job].value[x] 1..1
* component[job].value[x] only CodeableConcept
* component[job].valueCodeableConcept from OCCUP_VS
* component[job].valueCodeableConcept ^short = "Tööamet."
* component[rate].code = $SCT#224374003 "Regularity of work"
* component[rate].value[x] 1..1
* component[rate].value[x] only Quantity
* component[rate].value[x].unit = UCUM#1
* component[rate].value[x].comparator ..0
* component[rate].valueQuantity ^short = "Töökoormus (0..1]."
* component[rate] ^short = "Lepinguline töökoormus."

* contained 1..1
* contained ^slicing.discriminator[0].type = #type
* contained ^slicing.discriminator[0].path = "$this"
* contained ^slicing.ordered = false
* contained ^slicing.rules = #open
* contained contains employer 1..1
* contained[employer] ^short = "Tööandja asutus"
* contained[employer] only EEBaseOrganization
* contained[employer].contact.address.use = #work
* contained[employer].contact.address.country = #EE

Instance: Occupation
InstanceOf: EEMPISocialHistoryOccupation
Description: "Example of patient occupation"
Usage: #example
* code
  * coding[snomed] = $SCT#184104002
* subject = Reference(Patient/pat1)
* performer = Reference(EmployerOrg)
* component[job].valueCodeableConcept = OCCUP_CS#22122501 "Paediatrician"
* component[rate].valueQuantity = 0.75 '1'
* contained[employer] = EmployerOrg


Instance: EmployerOrg
InstanceOf: EEBaseOrganization
Description: "Example of employer Organization Org2"
Usage: #example
* id = "Org2"
* active = true
* name = "Some Hospital"
* identifier.system = "https://fhir.ee/sid/org/est/br"
* identifier.value = "22131341"
* contact
  * address.use = #work
  * address.country = #EE
  * address.line = "Ravi 10"
  * address.city = "Tallinn"
