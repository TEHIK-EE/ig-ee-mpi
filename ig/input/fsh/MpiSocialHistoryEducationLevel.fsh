CodeSystem: EEMPIEducationLevel
Id: education-level
Title:     "Education level"
Description: "Patsiendi kõrgeim haridustase"
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* ^hierarchyMeaning = #is-a
* #0 "Less than primary education, pre-primary education" "Alusharidus (koolieelne haridus) või alghariduseta"
  * ^designation[0].language = #et  
  * ^designation[=].value = "Hariduseta, alusharidus"
* #1 "Basic education (grades 1-6 of basic school)" "Põhiharidus (põhikooli 1.-6. klass)"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Algharidus"
* #2 "Basic education (grades 7-9 of basic school)" "Põhiharidus (põhikooli 7.-9. klass)" 
  * ^designation[0].language = #et 
  * ^designation[=].value = "Põhiharidus"
* #3 "Upper secondary education" "Keskharidus"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Üldkeskharidus"
  * #34 "General secondary education" "Üldkeskharidus (gümnaasiumi 10.-12. klass)"
    * ^designation[0].language = #et 
    * ^designation[=].value = "Keskeriharidus keskhariduse baasil"  
  * #35 "Vocational secondary education (incl. secondary special or technical education), based on basic education" "Kutsekeskharidus (sh keskeri- või tehnikumiharidus) põhihariduse baasil"
    * ^designation[0].language = #et 
    * ^designation[=].value = "Kutsehariduse omandamine koos põhihariduse omandamisega"
* #4 "Vocational secondary education or vocational courses based on secondary education" "Kutsekeskharidus või kutseõpe keskhariduse baasil"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Kutsekeskharidus"
* #5 "Vocational secondary education and a technical education based on secondary education" "Keskeri- ja tehnikumiharidus keskhariduse baasil"
* #6 "Bachelor's or equivalent level education (professional higher education and vocational higher education, diploma courses)" "Bakalaureus või sellega võrdsustatud haridus (rakendus- ja kutsekõrgharidus, diplomiõpe)"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Bakalaureus või sellega võrdsustatud, rakenduskõrgharidus"
* #7 "Master's or equivalent level education" "Magister või sellega võrdsustatud haridus"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Magister või sellega võrdsustatud haridus"  
* #8 "Doctoral or equivalent level education" "Doktor või sellega võrdsustatud haridus"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Doktor või sellega võrdsustatud haridus"
* #9 "Not elsewhere classified" "Mujal liigitamata"


ValueSet:    EEMPIEducationLevel
Id:          education-level
Title:       "Education Level"
Description: "Patsiendi kõrgeim haridustase"
* ^experimental = false
* include codes from system EEMPIEducationLevel
// SCT where concept descendent-of #365460000 "Finding of education received in the past"


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
* valueCodeableConcept from EEMPIEducationLevel
* valueCodeableConcept ^short = "Haridustase."
* basedOn ..0
* partOf ..0
* component ..0
* hasMember ..0
* method ..0
* bodySite ..0
* specimen ..0
* device ..0

Instance: EducationLevel
InstanceOf: EEMPISocialHistoryEducationLevel
Description: "Example of patient education"
Usage: #example
* subject = Reference(Patient/pat1)
* issued = "1995-06-21T00:00:00+02:00"
* valueCodeableConcept = EEMPIEducationLevel#8
// SCT#224300008 "Received university education"
