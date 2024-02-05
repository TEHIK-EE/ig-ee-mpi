CodeSystem: EEMPIEducationLevel
Id: education-level
Title:     "Education level"
Description: "Omandatud kõrgeim haridustase"
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #A0 "Less than primary education" "Hariduseta, alusharidus"
  * ^designation[0].language = #et  
  * ^designation[=].value = "Hariduseta, alusharidus"
  * ^designation[+].language = #et
  * ^designation[=].value = "Hariduseta, alusharidus"
* #A1 "Primary education" "Algharidus, praegune põhikooli 6 klassi, põhihariduse nõudeta kutseharidus"
  * ^designation[0].language = #et
  * ^designation[=].value = "Algharidus, praegune põhikooli 6 klassi, põhihariduse nõudeta kutseharidus"
  * ^designation[+].language = #et
  * ^designation[=].value = "Algharidus"
* #A24 "Lower secondary general education" "Põhiharidus" 
  * ^designation[0].language = #et 
  * ^designation[=].value = "Põhiharidus"
  * ^designation[+].language = #et
  * ^designation[=].value = "Põhiharidus"
* #A25 "Lower secondary vocational education" "Kutseharidus koos põhihariduse omandamisega ja kutseharidus põhihariduse baasil"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Kutseharidus koos põhihariduse omandamisega ja kutseharidus põhihariduse baasil"
  * ^designation[+].language = #et
  * ^designation[=].value = "Kutsehariduse omandamine koos põhihariduse omandamisega"
* #A34 "Upper secondary general education" "Üldkeskharidus"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Üldkeskharidus"
  * ^designation[+].language = #et
  * ^designation[=].value = "Üldkeskharidus"
* #A35 "Upper secondary vocational education" "Kutsekeskharidus"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Kutsekeskharidus"
  * ^designation[+].language = #et
  * ^designation[=].value = "Kutsekeskharidus"
* #A4 "Post-secondary non-tertiary vocational education" "Kutseharidus keskhariduse baasil"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Kutseharidus keskhariduse baasil"
  * ^designation[+].language = #et
  * ^designation[=].value = "Kutseharidus keskhariduse baasil"
* #A5 "Short-cycle tertiary education" "Keskeriharidus keskhariduse baasil"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Keskeriharidus keskhariduse baasil"
  * ^designation[+].language = #et
  * ^designation[=].value = "Keskeriharidus keskhariduse baasil"
* #A6 "Bachelor's or equivalent level education level" "Bakalaureus või sellega võrdsustatud, rakenduskõrgharidus"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Bakalaureus või sellega võrdsustatud, rakenduskõrgharidus"
  * ^designation[+].language = #et
  * ^designation[=].value = "Bakalaureus või sellega võrdsustatud, rakenduskõrgharidus"
* #A7 "Master's or equivalent level" "Magister või sellega võrdsustatud"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Magister või sellega võrdsustatud"
  * ^designation[+].language = #et
  * ^designation[=].value = "Magister või sellega võrdsustatud haridus"
* #A8 "Doctoral or equivalent level" "Doktor või sellega võrdsustatud"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Doktor või sellega võrdsustatud"
  * ^designation[+].language = #et
  * ^designation[=].value = "Doktor või sellega võrdsustatud haridus"
* #A9 "Not elsewhere classified" "Mujal nimetama"
  * ^designation[0].language = #et 
  * ^designation[=].value = "Mujal nimetama"
  * ^designation[+].language = #et
  * ^designation[=].value = "Mujal nimetama"

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
* interpretation ..0
* bodyStructure ..0
* referenceRange ..0

Instance: EducationLevel
InstanceOf: EEMPISocialHistoryEducationLevel
Description: "Example of patient education"
Usage: #example
* subject = Reference(Patient/pat1)
* issued = "1995-06-21T00:00:00+02:00"
* valueCodeableConcept = EEMPIEducationLevel#A6
// SCT#224300008 "Received university education"
