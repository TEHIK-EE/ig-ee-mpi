Profile: EEMPIPatientNewborn
Parent: EEMPIPatient
Id: ee-mpi-patient-newborn
Title: "EE MPI Patient Newborn"
Description: "Profiil vastsündinu andmete kirjeldamiseks"
* ^status = #draft
* ^publisher = "HL7 Estonia"
* active = true (exactly)
* name contains temp 0..1 MS
* name 1..1
* name[temp] ^short = "Ajutine nimi"
* name[temp].use = #temp (exactly)
* name[temp].family 1..1 MS
* name[temp].given 0..1 MS
* name[temp].given ^short = "Vastsündinu eesnimi võib puududa"
* identifier ^short = "Vastsündinu identifikaator"
* telecom ..0
* birthDate 1.. 
* address ..0
* multipleBirth[x] 1..1 MS 
* multipleBirth[x] only integer
* multipleBirth[x] ^short = "Sünnijärjekord"
* communication ..0


Instance: PatientNewborn
InstanceOf: EEMPIPatientNewborn
Description: "Example of newborn patient"
Usage: #example
* id = "pat-newborn"
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "50712121111"
* active = true 
* gender = #male
* name[temp]
  * use = #temp
  * family = "Maasikas"
* gender = #male
* birthDate = "2007-12-12"
* multipleBirthInteger = 1
/*
* address
  * use = #temp
  * country = "EE"
  * line = "Valukoja 10, Tallinn"
    * extension[adsid].valueString = "2280361"
*/

