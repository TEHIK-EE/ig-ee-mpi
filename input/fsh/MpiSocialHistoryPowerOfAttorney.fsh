CodeSystem:  HooldusoiguseLiik
Id:          hooldusoiguse-liik
Title:       "Hooldusõiguse liik"
Description: "Hooldusõiguse liik"
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #H9 "Lapse eraldamine vanemast"
* #H11 "Osaline isikuhooldusõigus"
* #H21 "Osaline varahooldusõigus"
* #H12 "Piiratud isikuhooldusõigus"
* #H22 "Piiratud varahooldusõigus"
* #H10 "Täielik isikuhooldusõigus"
* #H20 "Täielik varahooldusõigus"
* #H19 "Vanema õigused"

ValueSet:    HooldusoiguseLiik
Id:          hooldusoiguse-liik
Title:       "Hooldusõiguse liik"
Description: "Hooldusõiguse liik"
* ^experimental = false
* include codes from system HooldusoiguseLiik


Profile:        EEMPISocialHistoryPowerOfAttorney
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-power-of-attorney
Title:          "EE MPI SocialHistory Power Of Attorney"
Description:    "Hooldusõigus"
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = SCT#186063005 "Power of attorney observable" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 1.. MS
* performer only Reference(EEBaseRelatedPerson)
* performer ^short = "Isik(ud), kellel on hooldusõigus."
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from HooldusoiguseLiik
* value[x] ^short = "Hooldusõiguse liik."
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

Instance: rp
InstanceOf: RelatedPerson
Usage:  #inline
* patient = Reference(Patient/pat1)
* identifier
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "48501212711"
* name
  * family = "Tamm"
  * given = "Anti"

Instance: PowerOfAttorney
InstanceOf: EEMPISocialHistoryPowerOfAttorney
Description: "Example of patient attorney"
Usage: #example
* contained[+] = rp
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer[0] = Reference(rp)
* valueCodeableConcept = HooldusoiguseLiik#H10 "Täielik isikuhooldusõigus"
