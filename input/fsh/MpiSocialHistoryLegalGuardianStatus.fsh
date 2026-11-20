Profile:        EEMPISocialHistoryLegalGuardianStatus
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-legal-guardian-status
Title:          "EE MPI SocialHistory Legal Guardian Status"
Description:    "Legal guardian status. `subject` is always the patient given in the request. `performer` is the other party of the guardianship and `value` is the role of the performer in relation to the patient: 58626002 \"Legal guardian\" when the performer is a guardian of the patient, 365569001 \"Finding of wardship\" when the performer is a ward of the patient."
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = $SCT#58626002
* code ^short = "Always SNOMED CT 58626002, for both directions of the query"
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 1.. MS
* performer only Reference(EEBaseOrganization or EEBaseRelatedPerson)
* performer ^short = "The other party of the guardianship: a guardian (RelatedPerson or Organization) or a ward (RelatedPerson)"
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from $legal-guardian-status-VS
* value[x] ^short = "Role of the performer in relation to the patient"
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
* id = "kov"
* meta.profile = "https://fhir.ee/base/StructureDefinition/ee-organization"
* identifier
  * system = "https://fhir.ee/sid/org/est/br"
  * value = "75018816"
* name = "Anija Vallavalitsus"
* active = true

Instance: eestkostja
InstanceOf: RelatedPerson
Usage:  #inline
* id = "eestkostja"
* patient = Reference(Patient/pat1)
* identifier
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "48501212711"
* relationship = $v3-RoleClass#GUARD
* name
  * family = "Kask"
  * given = "Mari"
* telecom
  * system = #phone
  * value = "+37251234567"

Instance: eestkostetav
InstanceOf: RelatedPerson
Usage:  #inline
* id = "eestkostetav"
* patient = Reference(Patient/pat1)
* identifier
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "52009010061"
* relationship = $v3-RoleClass#DEPEN
* name
  * family = "Kivi"
  * given = "Albert"


Instance: LegalGuardianStatus
InstanceOf: EEMPISocialHistoryLegalGuardianStatus
Description: "Patient's guardian is a person (`$legal-guardian` with `legal-status=58626002`)"
Usage: #example
* contained[0] = eestkostja
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* issued = "2024-06-11T15:25:10.148+03:00"
* performer[0] = Reference(eestkostja)
* valueCodeableConcept = $SCT#58626002 "Legal guardian"

Instance: LegalGuardianStatusOrganization
InstanceOf: EEMPISocialHistoryLegalGuardianStatus
Description: "Patient's guardian is an institution (`$legal-guardian` with `legal-status=58626002`)"
Usage: #example
* contained[0] = kov
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* issued = "2024-06-11T15:25:10.148+03:00"
* performer[0] = Reference(kov)
* valueCodeableConcept = $SCT#58626002 "Legal guardian"

Instance: LegalGuardianStatusWard
InstanceOf: EEMPISocialHistoryLegalGuardianStatus
Description: "Patient's ward (`$legal-guardian` with `legal-status=365569001`)"
Usage: #example
* contained[0] = eestkostetav
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2020-09-28"
* issued = "2024-06-11T15:25:10.148+03:00"
* performer[0] = Reference(eestkostetav)
* valueCodeableConcept = $SCT#365569001 "Finding of wardship"
