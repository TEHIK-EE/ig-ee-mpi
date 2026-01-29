Profile:        EEMPISocialHistoryLegalGuardianStatus
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-legal-guardian-status
Title:          "EE MPI SocialHistory Legal Guardian Status"
Description:    "Seadusliku eeskostja staatus"
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = $SCT#1193838006 "Legal guardian status" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 1.. MS
* performer only Reference(EEBaseOrganization or EEBaseRelatedPerson)
* performer ^short = "Asutus ja/või isikud, kellel on eeskoste õigus."
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from $legal-guardian-status-VS
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
* valueCodeableConcept = $SCT#58626002 "Legal guardian"
