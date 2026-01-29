Profile:        EEMPISocialHistoryEducationLevel
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-education-level
Title:          "EE MPI SocialHistory Education Level"
Description:    "Haridustase"
* status = #final (exactly)

* category 1..1
* category.coding[obscat] 1..1
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)

* code 1..1
* code = $SCT#105421008 "Educational achievement"

* issued 1..1
* issued ^short = "Ajahetk, millal antud päring tehti"

* subject 1..1
* subject only Reference(EEMPIPatientVerified)

* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from $education-level-VS
* valueCodeableConcept ^short = "Haridus"

* effective[x] ..0
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
* implicitRules ..0
* contained ..0
* modifierExtension ..0
* dataAbsentReason ..0

Instance: EducationLevel
InstanceOf: EEMPISocialHistoryEducationLevel
Description: "Example of patient education"
Usage: #example
* subject = Reference(Patient/pat1)
* issued = "2025-06-21T00:00:00+02:00"
* valueCodeableConcept = $education-level#6 "Bakalaureus või sellega võrdsustatud, rakenduskõrgharidus"
