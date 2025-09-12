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
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from $disability-level-VS
* performer ..0
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

Instance: Disability
InstanceOf: EEMPISocialHistoryDisability
Description: "Example of patient disability"
Usage: #example
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* valueCodeableConcept = $disability-level#KESKMINE_PUUE "Keskmine puue"
