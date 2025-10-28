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
* link ^short = "Seos teise patsiendi kirjega. Ignoreeritakse salvestamisel, saab muuta ainult $link operatsiooni abil."
* contact ..0
//* gender from $administrative-gender-VS (required)

* identifier.period MS
* identifier.period ^short = "Identifikaatori kehtivuse periood. Kui puudub, siis on identifikaator kehtiv."

* maritalStatus ..0

* communication MS
* communication ^short = "Suhtluskeeled"
* communication.language ^binding.additional.purpose = #preferred
* communication.language ^binding.additional.valueSet = $langs-VS

* active ^short = "Patsiendi kirje olek, määrab kas kirje on kehtiv või eksklikult sisestatud. Eesti isikukoodiga patsiendi puhul väärtuse muutus ei ole lubatud. Vaikimisi on true (aktiivne)."

* telecom MS
* telecom.value 1..1 MS
* telecom.period MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #closed
* telecom ^short = "Patsiendi kontaktandmed."
* telecom contains phone 0..* MS and email 0..* MS
* telecom[phone].system = #phone
* telecom[phone].system 1..1 MS
* telecom[phone].use 0..1 MS
* telecom[phone].rank 0..1 MS
* telecom[phone] ^short = "Telefoni number"
* telecom[phone].value obeys phone-regex

* telecom[email].system = #email
* telecom[email].system 1..1 MS
* telecom[email].use 0..1 MS
* telecom[email].rank 0..1 MS
* telecom[email] ^short = "E-Mail"
* telecom[email].value obeys email-regex

Invariant: phone-regex
Description: "Telefoninumber peab olema korrektses Eesti vormingus (lauatelefon, mobiil või rahvusvaheline number)"
Expression: "value.matches('(^\\\\+(?!372)[1-9]\\\\d{1,14}$)|(^(\\\\+372|00372)?5(\\\\d{6,7})$)|(^(\\\\+372|00372)?(32|33|35|38|39|6[0-9]|7[1-9]|88)(\\\\d{5})$)')"
Severity: #error

Invariant: email-regex
Description: "E-posti aadress peab olema korrektses vormingus"
Expression: "value.matches('^(?=.{1,64}@)[A-Za-z0-9_+-]+(\\\\.[A-Za-z0-9_+-]+)*@[^-][A-Za-z0-9-]+(\\\\.[A-Za-z0-9-]+)*(\\\\.[A-Za-z]{2,})$')"
Severity: #error

