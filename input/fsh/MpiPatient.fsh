Profile: EEMPIPatient
Parent: EEBasePatient
Id: ee-mpi-patient
Title: "EE MPI Patient"
Description: "Common MPI limitations on Patient resource"
* ^status = #draft
* ^publisher = "HL7 Estonia"
* ^abstract = true
* photo ..0
* generalPractitioner ..0
* managingOrganization ..0
* link ^short = "MPI ignoreerib salvestamisel 'link' elemendi. Välja 'link' saab muuta operatsioonide abil."
* contact ..0
* maritalStatus ..0
* communication MS
* communication ^short = "Suhtluskeeled"
* communication.language ^binding.additional.purpose = #preferred
* communication.language ^binding.additional.valueSet = "https://fhir.ee/ValueSet/keeled"

