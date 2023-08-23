Alias: v3-RoleClass = http://terminology.hl7.org/CodeSystem/v3-RoleClass 
//Alias: v2-0131 = http://terminology.hl7.org/CodeSystem/v2-0131

ValueSet: EEMPIPersonRelationship
Id: person-relationship
Title: "Person Relationship"
Description: "Suhe patsiendiga"
* ^experimental = false
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"

* ^compose.include.system = SCT

* ^compose.include.concept[+].code = #72705000
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Ema"
* ^compose.include.concept[+].code = #66839005
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Isa"
* ^compose.include.concept[+].code = #67822003
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Laps"
* ^compose.include.concept[+].code = #127848009
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Abikaasa"
* ^compose.include.concept[+].code = #444210007
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Reg.elukaaslane"

ValueSet: EEMPIPersonRelationshipClass
Id: person-relationship-class
Title: "Person Relationship Class"
Description: "Person relationship class"
* ^experimental = false

* ^compose.include.system = v3-RoleClass

* ^compose.include.concept[+].code = #CON
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Kontakt"
* ^compose.include.concept[+].code = #ECON
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Hädaabi kontakt"
* ^compose.include.concept[+].code = #GUARD
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Eestkostja"
* ^compose.include.concept[+].code = #DEPEN
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Eestkostetav"
* ^compose.include.concept[+].code = #NOK
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Sugulane"


Profile: MPIRelatedPerson
Parent: EEBaseRelatedPerson
Id: ee-mpi-related-person
Title: "EE MPI Related Person"
Description: "Patsient ja tema kontakt- ja seotud isikud."
* active 1..1 MS
* relationship 1..* MS
* relationship ^short = "Seosetüübid - kontaktisiku roll ja isiklik seos (sugulane, tuttav, ..)."
* name 0..1 MS
* name ^short = "Kontaktisiku nimi."
* telecom ^short = "Kontaktisiku kontaktandmed."
* address MS
* photo ..0
* address ^short = "Kontaktisiku aadress."
* identifier ^short = "Kontaktisiku identifikaatorid."
* communication	MS 
* period 1..1 MS
* relationship[person] MS
* relationship[person] from EEMPIPersonRelationship (extensible)
* relationship[class] MS
* relationship[class] from EEMPIPersonRelationshipClass (extensible)


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
* relationship = SCT#67822003 "Child"
* active = true
* period.start = "1995-10-21"

Instance: PatientIgorBossenkoWife
InstanceOf: MPIRelatedPerson
Description: "Example of patient wife and emergency contact"
Usage: #example
* id = "relpat12"
* patient = Reference(Patient/pat1)
* name.text = "Wife of Igor"
* relationship[0] = SCT#127848009 "Spouse"
* relationship[+] = v3-RoleClass#ECON "Emergency Contact"
* active = true
* period.start = "1995-06-22"



