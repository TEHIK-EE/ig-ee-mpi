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
* ^compose.include.concept[=].designation[=].value = "Elukaaslane"
* ^compose.include.concept[+].code = #125677006
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Sugulane"
* ^compose.include.concept[+].code = #394863008
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Mitte-pereliige"
* ^compose.include.concept[+].code = #106328005
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Sotsiaaltöötaja"

ValueSet: EEMPIPersonRelationshipClass
Id: person-relationship-class
Title: "Person Relationship Class"
Description: "Person relationship class"
* ^experimental = false
* ^compose.include.system = v3-RoleClass
* ^compose.include.concept[+].code = #CON
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Kontakt"
* ^compose.include.concept[+].code = #GUARD
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Eestkostja"
* ^compose.include.concept[+].code = #DEPEN
* ^compose.include.concept[=].designation[+].language = #et
* ^compose.include.concept[=].designation[=].value = "Eestkostetav"

Instance: person-relationship-v3-mpi
InstanceOf: ConceptMap
Usage: #definition
* url = "https://fhir.ee/ConceptMap/person-relationship-v3-mpi"
* version = "1.0.0"
* name = "PersonRelationshipV3MPI"
* title = "Mapping of legacy V3 person relationship to MPI"
* status = #active
* experimental = false
* date = "2023-09-25"
* publisher = "TEHIK"
* description = "A mapping between the legacy and new person relationships"
* useContext.code = $usage-context-type#venue
* useContext.valueCodeableConcept.text = "for NHIS usage"
* jurisdiction = urn:iso:std:iso:3166#EE
//* copyright = "Creative Commons 0"
* sourceScopeUri = "urn:oid:1.3.6.1.4.1.28284.6.2.3.5"
* targetScopeUri = "https://fhir.ee/ValueSet/person-relationship"
* group.source = "urn:oid:1.3.6.1.4.1.28284.6.2.3.5"
* group.target = SCT
* group.element[0].code = #1
* group.element[=].display = "abikaasa"
* group.element[=].target.code = #127848009
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #2
* group.element[=].display = "tütar"
* group.element[=].target.code = #67822003
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #3
* group.element[=].display = "poeg"
* group.element[=].target.code = #67822003
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #4
* group.element[=].display = "ema"
* group.element[=].target.code = #72705000
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #5
* group.element[=].display = "isa"
* group.element[=].target.code = #66839005
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #6
* group.element[=].display = "õde"
* group.element[=].target.code = #125677006
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #7
* group.element[=].display = "vend"
* group.element[=].target.code = #125677006
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #8
* group.element[=].display = "vanaema"
* group.element[=].target.code = #125677006
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #9
* group.element[=].display = "vanaisa"
* group.element[=].target.code = #125677006
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #10
* group.element[=].display = "lapselaps"
* group.element[=].target.code = #125677006
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #11
* group.element[=].display = "muu sugulane"
* group.element[=].target.code = #125677006
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #12
* group.element[=].display = "eestkostja"
* group.element[=].target.code = #394863008
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #13
* group.element[=].display = "elukaaslane"
* group.element[=].target.code = #444210007
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #14
* group.element[=].display = "naaber"
* group.element[=].target.code = #394863008
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #15
* group.element[=].display = "töökaaslane"
* group.element[=].target.code = #394863008
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #16
* group.element[=].display = "tuttav"
* group.element[=].target.code = #394863008
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #17
* group.element[=].display = "sotsiaaltöötaja"
* group.element[=].target.code = #106328005
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #18
* group.element[=].display = "kohaliku omavalitsuse esindaja"
* group.element[=].target.code = #394863008
* group.element[=].target.relationship = #source-is-narrower-than-target
* group.element[+].code = #99
* group.element[=].display = "muu"
* group.element[=].target.code = #394863008
* group.element[=].target.relationship = #equivalent

Instance: person-relationship-mpi-v3
InstanceOf: ConceptMap
Usage: #definition
* url = "https://fhir.ee/ConceptMap/person-relationship-mpi-v3"
* version = "1.0.0"
* name = "PersonRelationshipMPIV3"
* title = "Mapping of MPI person relationship to legacy V3"
* status = #active
* experimental = false
* date = "2023-09-25"
* publisher = "TEHIK"
* description = "A mapping between the new and legacy person relationships"
* useContext.code = $usage-context-type#venue
* useContext.valueCodeableConcept.text = "for NHIS usage"
* jurisdiction = urn:iso:std:iso:3166#EE
//* copyright = "Creative Commons 0"
* sourceScopeUri = "https://fhir.ee/ValueSet/person-relationship"
* targetScopeUri = "urn:oid:1.3.6.1.4.1.28284.6.2.3.5"
* group.source = SCT
* group.target = "urn:oid:1.3.6.1.4.1.28284.6.2.3.5"
* group.element[0].code = #72705000
* group.element[=].display = "Mother"
* group.element[=].target.code = #4
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #66839005
* group.element[=].display = "Father"
* group.element[=].target.code = #5
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #67822003
* group.element[=].display = "Child"
* group.element[=].target.code = #11
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #127848009
* group.element[=].display = "Spouse"
* group.element[=].target.code = #1
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #444210007
* group.element[=].display = "Cohabitee in relationship with subject"
* group.element[=].target.code = #13
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #394863008
* group.element[=].display = "Non-family member"
* group.element[=].target.code = #16
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #125677006
* group.element[=].display = "Relative"
* group.element[=].target.code = #11
* group.element[=].target.relationship = #equivalent
* group.element[+].code = #106328005
* group.element[=].display = "Social worker"
* group.element[=].target.code = #17
* group.element[=].target.relationship = #equivalent

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
* relationship[person] 0..1 MS
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
* relationship[+] = v3-RoleClass#CON "Contact"
* active = true
* period.start = "1995-06-22"



