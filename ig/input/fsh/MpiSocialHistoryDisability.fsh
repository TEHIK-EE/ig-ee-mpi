CodeSystem: EEMPIDisabilityLevel
Id: disability-level
Title:     "Disability level"
Description: "Puude raskusaste"
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #keskmine "Keskmine puue"
  * ^designation[0].language = #et  
  * ^designation[=].value = "KESKMINE_PUUE"
* #raske "Raske puue"
  * ^designation[0].language = #et  
  * ^designation[=].value = "RASKE_PUUE"
* #sygav "Sügav puue"
  * ^designation[0].language = #et  
  * ^designation[=].value = "SYGAV_PUUE"


ValueSet: EEMPIDisabilityLevel
Id: disability-level
Title:     "Disability level"
Description: "Puude raskusaste"
* ^experimental = false
* include codes from system EEMPIDisabilityLevel
/*
* ^compose.include.system = SCT

* ^compose.include.concept[+].code = #161043008
* ^compose.include.concept[=].display = "Slight"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Kerge puue"

* ^compose.include.concept[+].code = #161044002
* ^compose.include.concept[=].display = "Moderate"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Keskpuue"

* ^compose.include.concept[+].code = #161045001
* ^compose.include.concept[=].display = "Severe"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Raske puue"

* ^compose.include.system = LN

* ^compose.include.concept[+].code = #LL5052-7 
* ^compose.include.concept[=].display = "Crisis"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Sügav puue"
*/

Profile:        EEMPISocialHistoryDisability
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-disability
Title:          "EE MPI SocialHistory Disability"
Description:    "Puude raskusaste"
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = LN#95377-8 "Disability type" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 0..1 MS
* performer only Reference(EEBaseOrganization or EEBasePractitionerRole)
* performer ^short = "Asutus ja/või isik, kes määras puude."
* value[x] 1..1 MS
* value[x] only CodeableConcept 
* valueCodeableConcept from EEMPIDisabilityLevel
* basedOn ..0
* partOf ..0
* component ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0

Instance: Disability
InstanceOf: EEMPISocialHistoryDisability
Description: "Example of patient disability"
Usage: #example
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer = Reference(Organization/Org1)
* valueCodeableConcept = EEMPIDisabilityLevel#keskmine "Keskmine puue"
