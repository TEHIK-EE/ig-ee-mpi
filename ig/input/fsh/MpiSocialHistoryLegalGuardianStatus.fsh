/*
CodeSystem: GuardianStatus
Id:         guardian-status
Title:     "Guardian Status"
Description: "Eeskostja liik"
* SNOMED#58626002 "Legal guardian"
* SNOMED#365569001 "Finding of wardship"
*/

ValueSet: EEMPIGuardianStatus
Id:         guardian-status
Title:     "Guardian Status"
Description: "Eeskostja liik"
* ^experimental = false
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
//* include codes from system GuardianStatus
* ^compose.include.system = SCT

* ^compose.include.concept[+].code = #58626002
* ^compose.include.concept[=].display = "Legal guardian"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Eestkostja"
* ^compose.include.concept[+].code = #365569001 
* ^compose.include.concept[=].display = "Finding of wardship"
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Eestkostetav"


Profile:        EEMPISocialHistoryLegalGuardianStatus
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-legal-guardian-status
Title:          "EE MPI SocialHistory Legal Guardian Status"
Description:    "Seadusliku eeskostja staatus"
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = SCT#1193838006 "Legal guardian status" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 1.. MS
* performer only Reference(EEBaseOrganization or EEBasePractitionerRole or EEBaseRelatedPerson)
* performer ^short = "Asutus ja/või isikud, kellel on eeskoste õigus."
* value[x] 1..1 MS
* value[x] only CodeableConcept 
* valueCodeableConcept from EEMPIGuardianStatus
* value[x] ^short = "Eeskoste liik."
* note ..1 MS
* basedOn ..0
* partOf ..0
* component ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0
* referenceRange ..0

Instance: LegalGuardianStatus
InstanceOf: EEMPISocialHistoryLegalGuardianStatus
Description: "Example of patient legal duardian"
Usage: #example
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer[0] = Reference(Organization/Org1)
* performer[+] = Reference(PatientIgorBossenkoWife)
* valueCodeableConcept = SCT#58626002 "Legal guardian"
