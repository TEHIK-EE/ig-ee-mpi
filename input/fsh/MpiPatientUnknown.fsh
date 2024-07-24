/*
ValueSet: EEMPIPatientIdentityUnknown
Id: ee-patient-identity-unknown
Title: "Unknown Patient Identity Systems"
Description: "Identity system acceptable for unknown patient identification"
* ^experimental = false
//* ^compose.include.system = EEBaseIdentitySystem
//* ^compose.include.concept[+].code = #https://fhir.ee/sid/pid/est/mr
* EEBaseIdentitySystem#https://fhir.ee/sid/pid/est/mr
* include codes from system EEBaseIdentitySystem where concept descendent-of "https://fhir.ee/sid/pid/est/prn" and status = "A"
*/

Invariant:  mpi-pid-1
Description: "Only MPI MR number and internal codes are allowed."
Expression: "system.startsWith('https://fhir.ee/sid/pid/est/mr') or system.startsWith('https://fhir.ee/sid/pid/est/prn')"
Severity:   #error

Profile: EEMPIPatientUnknown
Parent: EEMPIPatient
Id: ee-mpi-patient-unknown
Title: "EE MPI Patient Unknown"
Description: "Kasutamiseks EMO-s, kiirabis, anonüümsete patsientide ning keskkonnaproovide puhul"
* ^status = #draft
* ^publisher = "HL7 Estonia"
* active = false (exactly)
* name ..1
* name[nickname] 1..1
* name[nickname].use ^short = "Tundmatu patsiendi tunnus"
* name[nickname].text ^short = "Tundmatu patsiendi hüüdnimi"
* name[official] 0..0
* identifier ..1
//* identifier.system from EEMPIPatientIdentityUnknown (required)
* identifier obeys mpi-pid-1
* identifier ^short = "Tundmatu identifikaator"
* gender 1..
* telecom ..0
* multipleBirth[x] ..0


Instance: PatientUnknown
InstanceOf: EEMPIPatientUnknown
Description: "Example of unknown patient"
Usage: #example
* id = "pat-unk"
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/mr"
  * value = "3456346"
* active = false
* name[nickname]
  * use = #nickname
  * text = "Malle Maasikas"
* gender = #male
* birthDate = "1973-02-10"
  * extension[accuracyIndicator].valueCoding = EEDateAccuracyIndicator#AAA "Day, month and year are accurate"
* address
  * use = #temp
  * country = "EE"
  * text = "Valukoja 10, Tallinn"
  * extension[adsAdrId].valueCoding = https://fhir.ee/CodeSystem/ads-adr-id#2280361
  * extension[adsOid].valueCoding = https://fhir.ee/CodeSystem/ads-oid#ME03379409

