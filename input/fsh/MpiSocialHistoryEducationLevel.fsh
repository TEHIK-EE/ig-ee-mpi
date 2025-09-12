Profile:        EEMPISocialHistoryEducationLevel
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-education-level
Title:          "EE MPI SocialHistory Education Level"
Description:    "Haridustase"
* status = #final (exactly)
* category 1..
* category.coding[obscat] 1..
* category.coding[obscat] = OBSCAT#social-history "Social history" (exactly)
* code.coding 2..2
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..1 MS and
    snomed 1..1 MS
* code.coding[loinc].system 1..
* code.coding[loinc].system = "http://loinc.org" (exactly)
* code.coding[loinc].code 1..
* code.coding[loinc].code = #82589-3 (exactly)
* code.coding[loinc].display = "Highest level of education" (exactly)
* code.coding[snomed].system 1..
* code.coding[snomed].system = "http://snomed.info/sct" (exactly)
* code.coding[snomed].code 1..
* code.coding[snomed].code = #105421008 (exactly)
* code.coding[snomed].display = "Educational achievement" (exactly)

* effective[x] 0..1 MS
* effective[x] only Period
* effective[x] ^short = "Period, mille jooksul haridustegevus jätkus või millal vastav haridustase kätte saadi"
* issued 1.. MS
* issued ^short = "Ajahetk, millal antud haridustase fikseeriti"
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 0..0 MS
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from $education-level-VS
* valueCodeableConcept ^short = "Haridustase."
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

Instance: EducationLevel
InstanceOf: EEMPISocialHistoryEducationLevel
Description: "Example of patient education"
Usage: #example
* subject = Reference(Patient/pat1)
* issued = "1995-06-21T00:00:00+02:00"
* valueCodeableConcept = $education-level#A6
