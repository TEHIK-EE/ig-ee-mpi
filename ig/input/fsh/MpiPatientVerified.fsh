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
/*
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "use"
* name ^slicing.rules = #open
* name ^short = "Patsiendi nimed. Ametlik nimi on kohustuslik"
* name contains official 1..1 MS
* name[official] ^short = "Ametlik nimi"
* name[official].use = #official (exactly)
* name[official].family 1..1 MS
* name[official].family ^short = "Perekonnanimi"
* name[official].given 1..1 MS
* name[official].given ^short = "Eesnimi"
* name[official].prefix 0..1 MS
* name[official].period MS
*/
/*
* address MS
* address ^slicing.discriminator.type = #value
* address ^slicing.discriminator.path = "country"
* address ^slicing.rules = #open
* address ^short = "Patsiendi aadressid. Eristatakse riigikoodi alusel. Riigikoodiks tuleb kasutada 2 kohalist ISO 3166 koodi"
* address contains ee 0..* MS and other 0..* MS
* address[ee] only EEMpiEstonianAddress
* address[other] only EEMpiForeignAddress
*/
/*
* telecom MS
* telecom.value 1..1 MS
* telecom.period MS
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "$this"
* telecom ^slicing.rules = #open
* telecom ^short = "Patsiendi kontaktandmed."
* telecom contains mobilePhone 0..* MS and homePhone 0..* MS and workPhone 0..* MS and personalEmail 0..* MS and workEmail 0..* MS and other 0..*
* telecom[mobilePhone].system = #phone
* telecom[mobilePhone].use = #mobile
* telecom[mobilePhone].system 1..1 MS
* telecom[mobilePhone].use 1..1 MS
* telecom[mobilePhone] ^short = "Mobiiltelefon"
* telecom[homePhone].system = #phone
* telecom[homePhone].use = #home
* telecom[homePhone].system 1..1 MS
* telecom[homePhone].use 1..1 MS
* telecom[homePhone] ^short = "Kodune telefon"
* telecom[workPhone].system = #phone
* telecom[workPhone].use = #work
* telecom[workPhone].system 1..1 MS
* telecom[workPhone].use 1..1 MS
* telecom[workPhone] ^short = "Töötelefon"
* telecom[personalEmail].system = #email
* telecom[personalEmail].use = #home
* telecom[personalEmail].system 1..1 MS
* telecom[personalEmail].use 1..1 MS
* telecom[personalEmail] ^short = "Isiklik e-post"
* telecom[workEmail].system = #email
* telecom[workEmail].use = #work
* telecom[workEmail].system 1..1 MS
* telecom[workEmail].use 1..1 MS
* telecom[workEmail] ^short = "Töö e-post"
* telecom[other].system = #other
* telecom[other].system 1..1 MS
* telecom[other] ^short = "Muu kontakt"

* birthDate MS
* gender MS
* deceased[x] MS
*/



/*
* identifier 1..* MS
* identifier.system 1..1 MS
* identifier.system from PatientIdentity (extensible)
//* identifier.system ^short = "Identifitseerimissüsteem"
* identifier.system ^short = "Identification system"
* identifier.value 1..1 MS
//* identifier.value ^short = "Patsiendi identifikaator või dokumendi number"
* identifier.value ^short = "Patient identifier or document number"
* identifier.period MS
//* identifier.period ^short = "Dokumendi kehtivusperiood."
* identifier.period ^short = "Validity period of the identifier of identification document."
//* identifier.assigner ^short = "Dokumendi väljastanud organisatsioon. Võib kasutada nii viitena organisatsioonile või vaba tekstina."
* identifier.assigner ^short = "Organization that issued the document. Can be used as a reference to an organization or as free text."
*/

/*
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^short = "Patsiendi identifikaatorid. Patsiendisüsteemi namespace-iks on , kus urn:pin spetsifitseeritud RFC-s https://www.rfc-editor.org/rfc/rfc3043.html. Ning 'hl7.ee:pid' on patsiendi namespace. Viies element vastab http://terminology.hl7.org/CodeSystem/v2-0203 koodisüsteemi väärtusele. Kuues element tüüpiliselt vastab riigi koodile koodisüsteemist http://hl7.org/fhir/ValueSet/iso3166-1-3 või asutuse registrikoodile."

* identifier contains ni 0..* MS
* identifier[ni] ^short = "Riiklik identifikaator"
* identifier[ni].system from PatientIdentityNI (extensible)
* identifier[ni].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:ni:' ja lõppema 3-kohalise riigikoodiga."
* identifier[ni].value 1..1 MS
* identifier[ni].value ^short = "Isikukood või väisriigi riiklik identifikaator"

* identifier contains passport 0..* MS
* identifier[passport] ^short = "Pass"
* identifier[passport].system 1..1 MS
* identifier[passport].system from PatientIdentityPPN (extensible)
* identifier[passport].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:ppn:' ja lõppema selle riigi 3-kohalise koodiga, kus dokument väljastati."
* identifier[passport].value 1..1 MS
* identifier[passport].value ^short = "Passinumber"
* identifier[passport].period MS
* identifier[passport].assigner MS
* identifier[passport].assigner ^short = "Dokumendi väljastanud organisatsioon. Saab kasutada nii organisatsiooni lingina kui ka tekstina."

* identifier contains idcard 0..* MS
* identifier[idcard] ^short = "ID-card"
* identifier[idcard].system 1..1 MS
* identifier[idcard].system from PatientIdentityCZ (extensible)
* identifier[idcard].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:cz:' ja lõppema selle riigi 3-kohalise koodiga, kus dokument väljastati."
* identifier[idcard].value 1..1 MS
* identifier[idcard].value ^short = "ID-kaardi number"
* identifier[idcard].period MS
* identifier[idcard].assigner MS
* identifier[idcard].assigner ^short = "Dokumendi väljastanud organisatsioon. Saab kasutada nii organisatsiooni lingina kui ka tekstina."

* identifier contains mr 0..1 MS
* identifier[mr] ^short = "MPI poolt väljaantud 'Medical Record' number"
* identifier[mr].system 1..1 MS
* identifier[mr].system = "https://mpi.tehik.ee" (exactly)
* identifier[mr].system ^short = "MPI $generate-identifier operatsiooni abil genereeritud identifikaator."
* identifier[mr].value 1..1 MS

* identifier contains bct 0..1 MS
* identifier[bct] ^short = "Sünnitunnistus"
* identifier[bct].system 1..1 MS
* identifier[bct].system from PatientIdentityBCT (extensible)
* identifier[bct].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:bct:' ja lõppema selle riigi 3-kohalise koodiga, kus dokument väljastati."
* identifier[bct].value 1..1 MS
* identifier[bct].value ^short = "Sünnitunnistuse number."

* identifier contains internal 0..* MS
* identifier[internal] ^short = "Asutuse sisene patsiendi identifikaator"
* identifier[internal].system 1..1 MS
* identifier[internal].system from PatientIdentityPRN (extensible)
* identifier[internal].system ^short = "Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:prn:' ja lõppema koodi väljastava organisatsiooni registrikoodiga."
* identifier[internal].value 1..1 MS
* identifier[internal].value ^short = "Sisemine identifikaator peab olema unikaalne asutuse sees. Identifikaator ei pea kandma mingit semantilist tähendust."
*/

/*
* identifier contains other 0..1 MS
* identifier[other] ^short = "Muu isikutunnistusena mitte aktsepteeritav dokument. Kasutada ainult erandolukordades!!!!  Iga kasutamist valideeritakse TEHIKu poolt. Või saame piirduda sel juhul MRN-iga????"
* identifier[other].system 1..1 MS
* identifier[other].system from PatientIdentityVS (extensible)
* identifier[other].system = "urn:pin:hl7.ee:pid:u" (exactly)
* identifier[other].system ^short = "Varuvariant igasuguse prügi panemiseks, kui ükski teistest identifikaatoritest ei sobi. Süsteemiväärtus peab algama urn-iga 'urn:pin:hl7.ee:pid:u:' ja lõppema organisatsiooni registrikoodiga ja unikaalse väärtusega väljastava organisatsiooni sees."
* identifier[other].value 1..1 MS
* identifier[other].value ^short = "Saatja peab tagama väärtuse unikaalsust (maailmaa piires)."
*/

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
