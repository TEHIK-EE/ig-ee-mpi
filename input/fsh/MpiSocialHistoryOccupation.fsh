Alias: $EmploymentStatus = http://terminology.hl7.org/ValueSet/v2-0066

Profile:        EEMPISocialHistoryOccupation
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-occupation
Title:          "EE MPI SocialHistory Occupation"
Description:    "Employment and occupation of the patient."
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
* effective[x] 0..1 MS
* effective[x] only Period
* effective[x] ^short = "Occupation period"
* subject 1..1
* subject only Reference(EEMPIPatientVerified)
* performer 1..1
* performer only Reference(EEBaseOrganization)
* performer ^short = "Employer's institution. Reference to contained resource"
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
* component[job].valueCodeableConcept ^short = "Occupation."
* component[rate].code = $SCT#224374003 "Regularity of work"
* component[rate].value[x] 1..1
* component[rate].value[x] only Quantity
* component[rate].value[x].unit = UCUM#1
* component[rate].value[x].comparator ..0
* component[rate].valueQuantity ^short = "Employment type (0..1]."
* component[rate] ^short = "Contractual employment type."

* contained 1..1
* contained ^slicing.discriminator[0].type = #type
* contained ^slicing.discriminator[0].path = "$this"
* contained ^slicing.ordered = false
* contained ^slicing.rules = #open
* contained contains employer 1..1
* contained[employer] ^short = "Employer's institution"
* contained[employer] only EEBaseOrganization
* contained[employer].contact.address.use = #work
* contained[employer].contact.address.country = #EE

Instance: Occupation
InstanceOf: EEMPISocialHistoryOccupation
Description: "Example of patient occupation"
Usage: #example
* code
  * coding[snomed] = $SCT#184104002
* effectivePeriod.start = "2024-02-29T00:00:00+02:00"
* effectivePeriod.end = "2027-02-27T00:00:00+02:00"
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


Instance: OccupationExampleEmployer1
InstanceOf: EEBaseOrganization
Description: "Employer of the first occupation in the Patient/$occupation example"
Usage: #inline
* id = "employer1"
* active = true
* name = "CGI EESTI AS"
* identifier.system = "https://fhir.ee/sid/org/est/br"
* identifier.value = "10006966"
* contact
  * address.use = #work
  * address.text = "Tartu maakond, Tartu linn, Tartu linn, Pikk tn 2"
  * address.line = "Pikk tn 2"
  * address.city = "Tartu linn"
  * address.state = "Tartu maakond"
  * address.postalCode = "51009"
  * address.country = #EE


Instance: OccupationExampleEmployer2
InstanceOf: EEBaseOrganization
Description: "Employer of the second occupation in the Patient/$occupation example"
Usage: #inline
* id = "employer2"
* active = true
* name = "TRIOGAMES OÜ"
* identifier.system = "https://fhir.ee/sid/org/est/br"
* identifier.value = "11079281"
* contact
  * address.use = #work
  * address.text = "Harju maakond, Saku vald, Kasemetsa küla, Kaseurva"
  * address.city = "Kasemetsa küla"
  * address.district = "Saku vald"
  * address.state = "Harju maakond"
  * address.postalCode = "75510"
  * address.country = #EE


Instance: OccupationExample1
InstanceOf: EEMPISocialHistoryOccupation
Description: "Occupation with period, used in the Patient/$occupation example"
Usage: #inline
* id = "occupation-example-1"
* contained[employer] = OccupationExampleEmployer1
* code.coding[snomed] = $SCT#184104002 "Patient occupation"
* effectivePeriod.start = "2024-02-29T00:00:00+02:00"
* effectivePeriod.end = "2027-02-27T00:00:00+02:00"
* subject = Reference(Patient/pat1)
* issued = "2026-03-17T10:40:54.408+02:00"
* performer.reference = "#employer1"
* component[job].valueCodeableConcept = OCCUP_CS#22122501 "Paediatrician"
* component[rate].valueQuantity = 0.75 '1'


Instance: OccupationExample2
InstanceOf: EEMPISocialHistoryOccupation
Description: "Ongoing occupation with only period start, used in the Patient/$occupation example"
Usage: #inline
* id = "occupation-example-2"
* contained[employer] = OccupationExampleEmployer2
* code.coding[snomed] = $SCT#184104002 "Patient occupation"
* effectivePeriod.start = "2021-09-01T00:00:00+03:00"
* subject = Reference(Patient/pat1)
* issued = "2026-03-17T10:40:54.408+02:00"
* performer.reference = "#employer2"


Instance: PatientOccupationExample
InstanceOf: Bundle
Description: "Example of Patient/$occupation response: Bundle (type collection) with patient's occupations"
Usage: #example
* id = "patient-occupation-example"
* type = #collection
* entry[0].fullUrl = "https://fhir.ee/mpi/Observation/occupation-example-1"
* entry[=].resource = OccupationExample1
* entry[+].fullUrl = "https://fhir.ee/mpi/Observation/occupation-example-2"
* entry[=].resource = OccupationExample2
