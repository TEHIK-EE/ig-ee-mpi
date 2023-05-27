Alias: $EmploymentStatus = http://terminology.hl7.org/ValueSet/v2-0066

/*
ValueSet: Occupation
Id: occupation
Title:     "Occupation"
Description: "Ametite klassifikaator"
* include codes from system SCT where concept descendent-of #14679004 "Occupation"
*/

ValueSet: EEMPIJobType
Id: job-type
Title:     "JobType"
Description: "Töötamise liik"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system SCT where concept descendent-of #365539008 "Finding of type of job (should be replaced)"

Profile:        EEMPISocialHistoryOccupation
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-occupation
Title:          "EE MPI SocialHistory Occupation"
Description:    "Töötamine"
* status = #final (exactly)
* category[obscat] 1..1 
* category[obscat] = OBSCAT#social-history "Social history" (exactly)
* code.coding 2..2
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..1 MS and
    snomed 1..1 MS 
* code.coding[loinc].system 1..
* code.coding[loinc].system = "http://loinc.org" (exactly)
* code.coding[loinc].code 1..
* code.coding[loinc].code = #11341-5 (exactly)
* code.coding[loinc].display = "History of occupation" (exactly)
* code.coding[snomed].system 1..
* code.coding[snomed].system = "http://snomed.info/sct" (exactly)
* code.coding[snomed].code 1..
* code.coding[snomed].code = #184104002 (exactly)
* code.coding[snomed].display = "Patient occupation" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 0..1 MS
* performer only Reference(EEBaseOrganization)
* performer ^short = "Tööandja asutus."
* value[x] ..0
* basedOn ..0
* partOf ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0
* component 1..2
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains job 1..1 MS and type 0..1 MS and status 0..1 MS
* component[job].code = SCT#160922003 "Job details"
* component[job].value[x] only CodeableConcept
* component[job].valueCodeableConcept from EEBaseOccupation
* component[job].valueCodeableConcept ^short = "Tööamet."
* component[type].code = SCT#224361009 "Type of job"
* component[type].value[x] only CodeableConcept
* component[type].valueCodeableConcept from EEMPIJobType
* component[type].valueCodeableConcept ^short = "Töötamise liik."
* component[status].code = SCT#224362002 "Employment status"
* component[status].value[x] only CodeableConcept
* component[status].valueCodeableConcept from $EmploymentStatus
* component[status].valueCodeableConcept ^short = "Tööhõive staatus."



Instance: Occupation
InstanceOf: EEMPISocialHistoryOccupation
Description: "Example of patient occupation"
Usage: #example
* code 
  * coding[loinc] = LN#11341-5
  * coding[snomed] = SCT#184104002
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer = Reference(Organization/Org1)
* component[job].valueCodeableConcept = EEBaseOccupation#22122501 "Pediaater"
* component[type].valueCodeableConcept = SCT#160923008 "Sedentary job"
