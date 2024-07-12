Alias: $EmploymentStatus = http://terminology.hl7.org/ValueSet/v2-0066

/*
ValueSet: Occupation
Id: occupation
Title:     "Occupation"
Description: "Ametite klassifikaator"
* include codes from system SCT where concept descendent-of #14679004 "Occupation"
*/

CodeSystem: TootamiseLiik
Id: vtootamise-liik
Title: "Töötamise liik"
* ^extension.url = "http://hl7.org/fhir/tools/StructureDefinition/web-source"
* ^extension.valueUrl = "https://termx.kodality.dev/fhir/CodeSystem/tootamise-liik"
* ^url = "https://fhir.ee/CodeSystem/tootamise-liik"
* ^version = "1.0.0"
* ^versionAlgorithmString = "semver"
* ^status = #draft
* ^experimental = false
* ^date = "2023-08-18T00:00:00Z"
* ^publisher = "HL7 Estonia"
* ^purpose = ""
* ^caseSensitive = false
* ^content = #complete
* ^property[0].code = #definition
* ^property[=].type = #string
* ^property[+].code = #display
* ^property[=].type = #string
* #1 "Tööleping"
* #1 ^designation.language = #et
* #1 ^designation.use.code = #display
* #1 ^designation.value = "Tööleping"
* #15 "Abikaasatasu"
* #15 ^designation.language = #et
* #15 ^designation.use.code = #display
* #15 ^designation.value = "Abikaasatasu"
* #2 "Avalik teenistus"
* #2 ^designation.language = #et
* #2 ^designation.use.code = #display
* #2 ^designation.value = "Avalik teenistus"
* #3 "Kõrgemad riigiteenijad"
* #3 ^designation.language = #et
* #3 ^designation.use.code = #display
* #3 ^designation.value = "Kõrgemad riigiteenijad"
* #4 "Omavalitsuse valitud või nimetatud liige"
* #4 ^designation.language = #et
* #4 ^designation.use.code = #display
* #4 ^designation.value = "Omavalitsuse valitud või nimetatud liige"
* #501 "Vabatahtlik töö"
* #501 ^designation.language = #et
* #501 ^designation.use.code = #display
* #501 ^designation.value = "Vabatahtlik töö"
* #504 "Töötamine TM kohustusega Eestis, SM välisriigis"
* #504 ^designation.language = #et
* #504 ^designation.use.code = #display
* #504 ^designation.value = "Töötamine TM kohustusega Eestis, SM välisriigis"
* #505 "KOV komisjoni liige, kes ei ole KOV volikogu liige"
* #505 ^designation.language = #et
* #505 ^designation.use.code = #display
* #505 ^designation.value = "KOV komisjoni liige, kes ei ole KOV volikogu liige"
* #506 "Töötamine TM kohustusega Eestis ilma SM kohustuseta"
* #506 ^designation.language = #et
* #506 ^designation.use.code = #display
* #506 ^designation.value = "Töötamine TM kohustusega Eestis ilma SM kohustuseta"
* #507 "Viisa alusel - tööleping"
* #507 ^designation.language = #et
* #507 ^designation.use.code = #display
* #507 ^designation.value = "Viisa alusel - tööleping"
* #6 "Sotsiaalmaksukohustusega FIE abikaasa"
* #6 ^designation.language = #et
* #6 ^designation.use.code = #display
* #6 ^designation.value = "Sotsiaalmaksukohustusega FIE abikaasa"
* #600 "VÕS leping"
* #600 ^designation.language = #et
* #600 ^designation.use.code = #display
* #600 ^designation.value = "VÕS leping"
* #601 "Juhtimis-, kontrollorgani liige"
* #601 ^designation.language = #et
* #601 ^designation.use.code = #display
* #601 ^designation.value = "Juhtimis-, kontrollorgani liige"
* #602 "Viisa alusel - VÕS leping"
* #602 ^designation.language = #et
* #602 ^designation.use.code = #display
* #602 ^designation.value = "Viisa alusel - VÕS leping"
* #603 "Viisa alusel - juhtimis-, kontrollorgani liikme tasu"
* #603 ^designation.language = #et
* #603 ^designation.use.code = #display
* #603 ^designation.value = "Viisa alusel - juhtimis-, kontrollorgani liikme tasu"
* #800 "Tööleping laevapere liikme soodustusega"
* #800 ^designation.language = #et
* #800 ^designation.use.code = #display
* #800 ^designation.value = "Tööleping laevapere liikme soodustusega"
* #801 "Meretööleping, juhtivtöötaja reisilaeval"
* #801 ^designation.language = #et
* #801 ^designation.use.code = #display
* #801 ^designation.value = "Meretööleping, juhtivtöötaja reisilaeval"
* #802 "Meretööleping, töötaja reisilaeval"
* #802 ^designation.language = #et
* #802 ^designation.use.code = #display
* #802 ^designation.value = "Meretööleping, töötaja reisilaeval"

ValueSet: TootamiseLiik
Id: tootamise-liik
Title:     "Töötamise liik"
Description: "Töötamise liik"
* ^experimental = false
* include codes from system EEMPIOccupationType

/*
ValueSet: EEMPIJobType
Id: job-type
Title:     "JobType"
Description: "Töötamise liik"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system SCT where concept descendent-of #365539008 "Finding of type of job (should be replaced)"
*/


Profile:        EEMPISocialHistoryOccupation
Parent:         EEBaseObservation
Id:             ee-mpi-socialhistory-occupation
Title:          "EE MPI SocialHistory Occupation"
Description:    "Töötamine"
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
* code.coding[loinc].code = #11341-5 (exactly)
* code.coding[loinc].display = "History of occupation" (exactly)
* code.coding[snomed].system 1..
* code.coding[snomed].system = "http://snomed.info/sct" (exactly)
* code.coding[snomed].code 1..
* code.coding[snomed].code = #184104002 (exactly)
* code.coding[snomed].display = "Patient occupation" (exactly)
* effective[x] 1..1 MS
* effective[x] only Period
* subject 1..1 MS
* subject only Reference(EEBasePatient)
* performer 0..1 MS
* performer only Reference(EEBaseOrganization)
* performer ^short = "Tööandja asutus."
* value[x] ..0
* basedOn ..0
* partOf ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0
* interpretation ..0
* bodyStructure ..0
* referenceRange ..0
* component 1..2
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains job 1..1 MS and type 0..1 and rate 0..1 // and status 0..1 MS 
* component[job].code = SCT#160922003 "Job details"
* component[job].value[x] only CodeableConcept
* component[job].valueCodeableConcept from EEBaseOccupation
* component[job].valueCodeableConcept ^short = "Tööamet."
* component[rate].code = SCT#224374003 "Regularity of work"
* component[rate].value[x] only Quantity
* component[rate].valueQuantity = UCUM#/1 "per work rate"
* component[rate].valueQuantity ^short = "Töökoormus (0..1]."
* component[rate] ^short = "Lepinguline töökoormus."
* component[type].code = SCT#224361009 "Type of job"
* component[type].value[x] only CodeableConcept
* component[type].valueCodeableConcept from TootamiseLiik
* component[type].valueCodeableConcept ^short = "Töötamise liik."
//* component[status].code = SCT#224362002 "Employment status"
//* component[status].value[x] only CodeableConcept
//* component[status].valueCodeableConcept from $EmploymentStatus
//* component[status].valueCodeableConcept ^short = "Tööhõive staatus."



Instance: Occupation
InstanceOf: EEMPISocialHistoryOccupation
Description: "Example of patient occupation"
Usage: #example
* code 
  * coding[loinc] = LN#11341-5
  * coding[snomed] = SCT#184104002
* subject = Reference(Patient/pat1)
* effectivePeriod.start = "2021-11-23"
* performer = Reference(Organization/Org1)
* component[job].valueCodeableConcept = EEBaseOccupation#22122501 "Pediaater"
* component[type].valueCodeableConcept = TootamiseLiik#501 "Vabatahtlik töö"
