Profile: EEMPIPatientVerified
Parent: EEMPIPatient
Id: ee-mpi-patient-verified
Title: "EE MPI Patient Verified"
Description: "Retseptsioonis identifitseeritud MPI Patsient."
* ^status = #draft
* ^publisher = "HL7 Estonia"
* name 1..* MS
* name[official] 1.. MS
* name[official] ^short = "Ametlik nimi"
* gender ^short = "Sugu"
* communication.language from $langs-VS // see rida lisatud



Instance: PatientIndrekBambus
InstanceOf: EEMPIPatientVerified
Description: "Patsient erinevate identifikaatoritega"
Usage: #example
* id = "pat1"
* active = true
* identifier[0]
  * system = "https://fhir.ee/sid/pid/est/ni"
  * value = "37302102711"
* identifier[+]
  * system = "https://fhir.ee/sid/pid/fin/ni"
  * value = "31002736540023"
* identifier[+]
  * system = "https://fhir.ee/sid/pid/est/ppn"
  * value = "K0307337"
  * period.end = "2023-12-28"
* identifier[+]
  * system = "https://fhir.ee/sid/pid/est/mr"
  * value = "82746127612"
* identifier[+]
  * system = "https://fhir.ee/sid/pid/est/prn/90006399"
  * value = "123e4567-e89b-12d3-a456-426614174000"
* name[official]
  * use = #official
  * given = "Indrek"
  * family = "Bambus"
* gender = #male
* birthDate = "1973-02-10"
* address[0]
  * use = #work
  * country = "EE"
  * postalCode = "14215"
  * text = "Valukoja 10, Tallinn"
  * extension[adsAdrId].valueCoding = https://fhir.ee/base/CodeSystem/ads-adr-id#2280361 //lisatud base
  * extension[adsOid].valueCoding = https://fhir.ee/base/CodeSystem/ads-oid#ME03379409 // lisatud base
* communication[0]
  * language.coding[0]
    * system = "urn:ietf:bcp:47"
    * code = #en-US
    * display = "English (United States)"
  * preferred = false

* communication[1]
  * language.coding[0]
    * system = "https://fhir.ee/CodeSystem/keeled" //"urn:ietf:bcp:47"
    * code = #et
    * display = "Eesti"
  * preferred = true

Instance: PatientJohnDoe
InstanceOf: EEBasePatient
Description: "Foreigner with minimal dataset."
Usage: #example
* id = "pat2"
* identifier[0]
  * system = "https://fhir.ee/sid/pid/usa/ppn"
  * value = "N857623628"
* active = true
* name[0]
  * use = #usual
  * given = "John"
  * family = "Doe"
* gender = #male
