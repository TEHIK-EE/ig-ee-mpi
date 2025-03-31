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


Instance: PatientIgorBossenko
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
/* identifier[+]
  * system = "https://fhir.ee/sid/pid/est/cz"
  * value = "AB0421183"
  * period.end = "2023-12-28"
  * assigner.display = "Estonian Police and Board Agency"
*/
* identifier[+]
  * system = "https://fhir.ee/sid/pid/est/ppn"
  * value = "K0307337"
  * period.end = "2023-12-28"
  * assigner.display = "Estonian Police and Board Agency"
* identifier[+]
//  * type = IdentityTypeCS#MR
  * system = "https://fhir.ee/sid/pid/est/mr"
  * value = "82746127612"
* identifier[+]
//  * type = IdentityTypeCS#PRN
  * system = "https://fhir.ee/sid/pid/est/prn/90006399"
  * value = "123e4567-e89b-12d3-a456-426614174000"
/* identifier[+]
// * type = IdentityTypeCS#U
  * system = "urn:pin:hl7.ee:pid:u"
  * value = "90006399:xyz:123e4567-e89b-12d3-a456-426614174000"
*/
* name[official]
  * use = #official
  * given = "Igor"
  * family = "Bossenko"
* gender = #male
* birthDate = "1973-02-10"
* address[0]
  * use = #work
  * country = "EE"
  * postalCode = "14215"
  * text = "Valukoja 10, Tallinn"
  * extension[adsAdrId].valueCoding = https://fhir.ee/CodeSystem/ads-adr-id#2280361
  * extension[adsOid].valueCoding = https://fhir.ee/CodeSystem/ads-oid#ME03379409

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
