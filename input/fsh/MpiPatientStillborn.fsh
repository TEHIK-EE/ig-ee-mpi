/*
ValueSet: EEMPIPatientIdentityStillborn
Id: ee-mpi-patient-identity-stillborn
Title: "Stillborn Patient Identity Systems"
Description: "Identity system acceptable for stillborn patient identification"
* ^experimental = false
* https://fhir.ee/CodeSystem/ee-identity-system#https://fhir.ee/sid/pid/est/npi
* https://fhir.ee/CodeSystem/ee-identity-system#https://fhir.ee/sid/pid/est/ni
* include codes from system EEBaseIdentitySystem where concept descendent-of "https://fhir.ee/sid/pid/est/prn" and status = "A"
*/

Invariant:  mpi-pid-2
Description: "Only Est National ID, TAI Stillborn ID and internal codes are allowed."
Expression: "identifier.system.startsWith('https://fhir.ee/sid/pid/est/ni') or identifier.system.startsWith('https://fhir.ee/sid/pid/est/npi') or identifier.system.startsWith('https://fhir.ee/sid/pid/est/prn')"
Severity:   #error

Profile: EEMPIPatientStillborn
Parent: EEMPIPatient
Id: ee-mpi-patient-stillborn
Title: "EE MPI Patient Stillborn"
Description: "Profiil surnult sündinu andmete kirjeldamiseks"
* ^status = #draft
* ^publisher = "HL7 Estonia"
* name ^short = "Surnult sündinu nimi võib puududa"
* name ..1
* name contains temp 0..1 MS
* name[temp] ^short = "Ajutine nimi"
* name[temp].use = #temp (exactly)
* name[temp].family 1..1 MS
* name[temp].given 0..1 MS
* name[temp].given ^short = "Surnult sündinu eesnimi võib puududa"
//* identifier.system from EEMPIPatientIdentityStillborn (required)
* identifier ^short = "Surnult sündinu identifikaator"
* obeys mpi-pid-2
* telecom ..0
* birthDate 1.. MS
* deceased[x] 1..1 MS
* deceased[x] only dateTime
* deceased[x] ^short = "Patsiendi surmaaeg"
* address ..0
* multipleBirth[x] 1..1 MS
* multipleBirth[x] only integer
* multipleBirth[x] ^short = "Sünnijärjekord"
* communication ..0


Instance: PatientStillborn
InstanceOf: EEMPIPatientStillborn
Description: "Example of stillborn patient"
Usage: #example
* id = "pat-stillborn"
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/npi"
  * value = "60712121111"
* identifier[+]
  * system = "https://fhir.ee/sid/pid/est/prn/90006399"
  * value = "123e4567-e89b-12d3-a456-426614174000"
* active = true
* gender = #female
* birthDate = "2007-12-12"
* birthDate.extension[birthTime].valueDateTime = "2007-12-12T16:00:00.000Z"
* deceasedDateTime = "2007-12-12T16:00:00.000Z"
* multipleBirthInteger = 1

