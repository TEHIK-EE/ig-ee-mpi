

Profile: MPIRelatedPerson
Parent: EEBaseRelatedPerson
Id: ee-mpi-related-person
Title: "EE MPI Related Person"
Description: "Patsient ja tema kontakt- ja seotud isikud."
* active 1..1 MS
* relationship 1..* MS
* relationship ^short = "Seosetüübid - kontaktisiku liik ja isiklik seos (sugulane, tuttav, ..)."
* name 0..1 MS
* name ^short = "Kontaktisiku nimi."
* telecom ^short = "Kontaktisiku kontaktandmed."
* address ..0
* photo ..0
* identifier ^short = "Kontaktisiku identifikaatorid."
* communication	..0
* period 1..1 MS
* relationship ^slicing.rules = #closed
* relationship[person] 0..1 MS
* relationship[person] ^short = "Kontaktisiku liik"
* relationship[person] from $relationship-type-VS (required)
* relationship[class] ^short = "Kontaktisiku seos patsiendiga"
* relationship[class] MS
* relationship[class] from $relationship-relation-VS (required)


Instance: PatientIgorBossenkoSon
InstanceOf: MPIRelatedPerson
Description: "Example of patient son"
Usage: #example
* id = "relpat11"
* patient = Reference(Patient/pat1)
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "39510212711"
* name.text = "Son of Igor"
* relationship[person] = SCT#67822003 "Child"
* active = true
* period.start = "1995-10-21"

Instance: PatientIgorBossenkoWife
InstanceOf: MPIRelatedPerson
Description: "Example of patient wife and emergency contact"
Usage: #example
* id = "relpat12"
* patient = Reference(Patient/pat1)
* name.text = "Wife of Igor"
* relationship[person] = SCT#127848009 "Spouse"
* relationship[class] = $v3-RoleClass#CON "Contact"
* active = true
* period.start = "1995-06-22"



