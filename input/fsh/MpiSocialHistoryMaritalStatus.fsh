Alias: MaritalStatusVS = http://hl7.org/fhir/ValueSet/marital-status
Alias: MaritalStatusCS = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus

Profile:        EEMPISocialHistoryMaritalStatus
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-marital-status
Title:          "EE MPI SocialHistory Marital Status"
Description:    "Abielu või suhte liik."
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = SCT#125680007 "Marital status" (exactly)
* effective[x] 0..1 MS
* effective[x] only Period
* effective[x] ^short = "Suhete periood"
* issued 1.. MS
* issued ^short = "Ajahetk, millal antud fakt fikseeriti"
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from MaritalStatusVS
* valueCodeableConcept ^short = "Suhte liik."
* encounter ..0
* performer ..0
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

Instance: MaritalStatus
InstanceOf: EEMPISocialHistoryMaritalStatus
Description: "Example of patient marital status"
Usage: #example
* subject = Reference(Patient/pat1)
* category = OBSCAT#social-history "Social history"
* issued = "1995-06-21T00:00:00+02:00"
* valueCodeableConcept = MaritalStatusCS#M "Married"
