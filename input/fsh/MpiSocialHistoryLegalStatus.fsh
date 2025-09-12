Profile:        EEMPISocialHistoryLegalStatus
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-legal-status
Title:          "EE MPI SocialHistory Legal Status"
Description:    "Patsiendi teovõime staatus."
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = SCT#8625004 "Legal status" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 0.. MS
* performer only Reference(EEBaseOrganization or EEBaseRelatedPerson)
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from $legal-status-VS
* note ..1 MS
* encounter ..0
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


Instance: LegalStatus
InstanceOf: EEMPISocialHistoryLegalStatus
Description: "Example of patient legal status"
Usage: #example
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* valueCodeableConcept = $legal-status#T0 "Teovõimeline"
