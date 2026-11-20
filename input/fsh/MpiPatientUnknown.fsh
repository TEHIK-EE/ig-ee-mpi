Invariant:  mpi-pid-1
Description: "Only MPI MR number and internal codes are allowed."
Expression: "system.startsWith('https://fhir.ee/sid/pid/est/mr') or system.startsWith('https://fhir.ee/sid/pid/est/prn')"
Severity:   #error

Profile: EEMPIPatientUnknown
Parent: EEMPIPatient
Id: ee-mpi-patient-unknown
Title: "EE MPI Patient Unknown"
Description: "For use in the emergency room, ambulance, for anonymous and/or unknown patients"
* ^status = #draft
* ^publisher = "HL7 Estonia"
* name ..1
* name[nickname] 1..1
* name[nickname].use ^short = "Unknown patient characteristic"
* name[nickname].text ^short = "Unknown patient nickname"
* name[official] 0..0
* identifier ..1
* identifier obeys mpi-pid-1
* identifier ^short = "Unknown patient identifier"
* gender 1..
* birthDate ^comment = "MPI stores the birth date with its precision. An approximate age is sent as an imprecise birth date, e.g. `1980` or `1980-05`."
* birthDate.extension[age] ^comment = "Not stored or returned by MPI. Send an approximate age as an imprecise birth date."
* birthDate.extension[accuracyIndicator] ^comment = "Not stored or returned by MPI. The precision of the birth date is given by the date itself (`1980`, `1980-05`, `1980-05-14`)."
* multipleBirth[x] ..0


Instance: PatientUnknown
InstanceOf: EEMPIPatientUnknown
Description: "Example of unknown patient"
Usage: #example
* id = "pat-unk"
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/mr"
  * value = "3456346"
* name[nickname]
  * use = #nickname
  * text = "Malle Maasikas"
* gender = #male
* birthDate = "1973"
* address
  * use = #temp
  * country = "EE"
  * text = "Valukoja 10, Tallinn"
  * extension[adsAdrId].valueCoding = https://fhir.ee/base/CodeSystem/ads-adr-id#2280361
  * extension[adsOid].valueCoding = https://fhir.ee/base/CodeSystem/ads-oid#ME03379409

