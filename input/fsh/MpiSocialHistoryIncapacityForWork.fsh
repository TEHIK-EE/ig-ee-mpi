Töövõime liik - Id: toovoime-liik - ToovoimeLiik
CodeSystem: ToovoimeLiik
Id: toovoime-liik
Title:     "Töövõime liik"
Description: "Töövõime liik"
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #puudub "Puuduv töövõime"
  * ^designation[0].language = #et  
  * ^designation[=].value = "Puuduv töövõime"
* #osaline "Osaline töövõime"
  * ^designation[0].language = #et  
  * ^designation[=].value = "Osaline töövõime"
* #taielik "Töövõime ei ole vähenenud"
  * ^designation[0].language = #et  
  * ^designation[=].value = "Töövõime ei ole vähenenud"


ValueSet: ToovoimeLiik
Id: toovoime-liik
Title:     "Töövõime liik"
Description: "Töövõime liik"
* ^experimental = false
* include codes from system EEMPIIncapacityForWorkCategory

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
* performer 0..1 MS
* performer only Reference(EEBaseOrganization or EEBasePractitionerRole)
* performer ^short = "Asutus ja/või isik, kes määras puude."
* value[x] 1..1 MS
* value[x] only CodeableConcept 
* valueCodeableConcept from ToovoimeLiik
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
* effectivePeriod.start = "2021-11-23"
* performer = Reference(Organization/Org1)
* valueCodeableConcept = ToovoimeLiik#puudub "Puuduv töövõime"
