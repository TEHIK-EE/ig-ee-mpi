Profile:        EEMPISocialHistoryPowerOfAttorney
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-power-of-attorney
Title:          "EE MPI SocialHistory Power Of Attorney"
Description:    "Kehtiv hooldusõigus patsiendi suhtes"
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code = SCT#186063005 "Power of attorney observable" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 1..1 MS
* performer only Reference(EEBaseRelatedPerson or EEBaseOrganization)
* performer ^short = "Isik või asutus (näiteks KOV), kellel on hooldusõigus patsiendi suhtes"
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
  * value = "48501212710"
* name
  * family = "Tamm"
  * given = "Annika"
* relationship
  * coding
    * system = "http://snomed.info/sct"
    * code = #72705000
    * display = "Mother"

Instance: PowerOfAttorney
InstanceOf: EEMPISocialHistoryPowerOfAttorney
Description: "Example of patient attorney"
Usage: #example
* contained[+] = rp
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer[0] = Reference(rp)
* valueCodeableConcept = HooldusoiguseLiik#H10 "Täielik isikuhooldusõigus"
