/*
CodeSystem: Eestkosteliik
Id:         eestkoste-liik
Title:     "Eestkoste liik"
Description: "Eestkoste liik"
* SNOMED#58626002 "Legal guardian"
* SNOMED#365569001 "Finding of wardship"
*/

ValueSet: Eestkosteliik
Id:         eestkoste-liik
Title:     "Eestkoste liik"
Description: "Eestkoste liik"
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
* valueCodeableConcept from Eestkosteliik
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
* interpretation ..0
* bodyStructure ..0
* referenceRange ..0

Instance: kov
InstanceOf: Organization
Usage:  #inline
* identifier
  * system = "https://fhir.ee/sid/org/est/br"
  * value = "75018816"
* name = "Anija Vallavalitsus"
* active = true

Instance: eeskostja
InstanceOf: RelatedPerson
Usage:  #inline
* patient = Reference(Patient/pat1)
* identifier
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "48501212711"
* name
  * family = "Eeskostja perekonnanimi"
  * given = "Eeskostja eesnimi"


Instance: LegalGuardianStatus
InstanceOf: EEMPISocialHistoryLegalGuardianStatus
Description: "Example of patient legal duardian"
Usage: #example
* contained[0] = eeskostja
* contained[+] = kov
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer[0] = Reference(kov)
* performer[+] = Reference(eeskostja)
* valueCodeableConcept = SCT#58626002 "Legal guardian"
