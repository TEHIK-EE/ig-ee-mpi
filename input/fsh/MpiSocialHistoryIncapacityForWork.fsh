Profile:        EEMPISocialHistoryIncapacityForWork
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-incapacity-for-work
Title:          "EE MPI SocialHistory Incapacity For Work"
Description:    "Töövõime liik"
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = SCT#301707001 "Ability to perform occupation and employment activities" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer ..0
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from ToovoimeLiik
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

Instance: IncapacityForWork
InstanceOf: EEMPISocialHistoryIncapacityForWork
Description: "Example of patient incapacity for work"
Usage: #example
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2024-04-03T00:00:00+03:00"
* valueCodeableConcept = ToovoimeLiik#puudub "Puuduv töövõime"
