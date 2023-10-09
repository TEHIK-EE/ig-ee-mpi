### Üldised kontrollid

Kõik päringus ja ressurssid peavad järgima FHIR spetsifikatsiooni.

Sissetulevad päringud ja andmed valideeritakse:
- FHIR [spetsifikatsiooni](http://hl7.org/fhir/documentation.html) üldiste reeglite ja loendite vastu
- PÜT profiilide vastu
- PÜT rakenduse poolt lubatud tegevuste nimekirja vastu (nimekiri tegevustest leitav CapabilityStatement-is aadressil [$mpi-url/fhir/metadata](#))
- Kontrollitakse kasutatavat terminoloogiat profiilide ja terminoloogia serveri vastu
- Autoriseerimisserveri vastu, tegevust saab teostada ainult kasutaja vastava rolli olemasolul

### PÜT rakenduse sisesed kontrollid

#### Patsiendid
Eesti isikikoodiga patsiendi loomine pole lubatud. `Patient` ressurss ei tohi loomisel sisalda identifikaatori süsteemiga https://fhir.ee/sid/pid/est/ni. 
Eesti isikukoodiga patsiendi tuleb pärida alati [lookup](https://fhir.ee/ig/mpi/build/operations.html#eesti-isikukoodiga-patsiendi-otsing) operatisooniga, kus on kasutatud allikana Rahvastikuregister.
Operatsioon tagastab `Patient` ressursi koos id-ga, mille abil saab patsiendi andmeid uuendada.

#### Telefonid

Eesti numeratsiooniplaan [riigiteataja.ee/akt/881042](https://www.riigiteataja.ee/akt/881042) reguleerib lubatud telefoninumbrite numeratsiooni Eestis.

| Telefoninumbrid | Regex valem | Kirjeldus |
|:----------|:--------------|:----------|
| Eesti lauatelefoni number |  `^(32|33|35|38|39|6[0-9]|7[1-9]|88)(\d{5})$` | Eesti riigikood kujul +372 või 00372 ignoreeritakse valideerimisel, kuid salvestatakse alati kujul +372. |
| Eesti mobiiltelefoni number | `^5[0-9](\d{5,6})$` | Eesti riigikood kujul +372 või 00372 ignoreeritakse valideerimisel, kuid salvestatakse alati kujul +372. |
| Välismaa telefoni number | `^\+[1-9]\d{1,14}$` | Kontrollitakse ainult pikkust ja riigi koodi olemasolu. Teiste riikide reegleid ei rakendata numbri valideerimisel. |

Telefoninumbrid salvestatkse registri alati riigi koodiga kujul +XXXYYYYYY ilma tühikudeta ja sulgudeta. Juhul kui PÜT-i jõuab valiidne Eesti number ilma riigikoodita siis riigikood lisatakse telefoninumbrile automaatselt.

#### Emailid

Emaili valideeritakse regexi valemi järgi:
`^(?=.{1,64}@)[A-Za-z0-9_+-]+(\.[A-Za-z0-9_+-]+)*@[^-][A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,})$`.
Salvestatakse ainult valiidsed emailid muutumata kujul.

#### Aadress
FHIR aadress kasutatakse postikonventsioonide väljendamiseks.
Aadressi vorming kirjeldatud [EEBase Address](https://build.fhir.org/ig/HL7EE/ig-ee-base/StructureDefinition-ee-address.html) andmetüübi kirjelduses.
Kohustlikuks elemendiks on riigikood, mis peab vastama [iso3166-1-alpha2](http://hl7.org/fhir/R5/valueset-iso3166-1-2.html) vormingule.
Tagasiühildamiseks praeguse lahendusega (ajutiselt) toetaks ka [iso3166-1-alpha3](http://hl7.org/fhir/R5/valueset-iso3166-1-3.html) riigikood.

##### Eesti aadress
Eesti aadress on aadress mille riigikood on `EE` (Eesti). 
- Eesti aadressi puhul on kohustuslik `ADR-ID` ADS registrist. Kõik teised väljad on informatiivsed ja ei oma sisulist tähendust. Vaata aadressi kasutamise [juhiseid](https://build.fhir.org/ig/HL7EE/ig-ee-base/StructureDefinition-ee-address.html#notes) EEBase spetsifikatsioonis.
- Kui `adr-id` ja `text` on etteantud siis salvestatakse kõik teised väljad ilma lisakontrollideta. Vaata infot väljade 
- Kui `adr-id` olemas aga `text` puudub siis text ja teised aadressi väljad laetakse ADS-ist *adr-id* järgi. 
- Kui `adr-id` puudub aga `text` on olemas proovitakse leida unikaalne vaste ADS-ist teksti järgi (otsing tehakse ainult juhul kui aadressi tekst sisaldab infot vähemalt maja numbri täpsusega).

##### Välismaa aadress
Välismaa aadress on aadress mille riigiks ei ole `EE` (Eesti).
Välismaa aadressi puhul on kohustuslik ainult riigi kood ja tekst. Välismaa aadressi puhul teisi kontrolle ei teostata.

#### Identifikaatorid
Identifikaatorite eemaldamine ei ole lubatud. Kui patsiendi identifikaator kaotanud kehtivuse siis tuleb määrata kehtivuse lõppuaeg.

### Kasutatav terminoloogia
#### PÜT-is kasutatavad loendid
- [Töövõimetuse määr](ValueSet-incapacity-for-work-category.html)
- [Puude raskusaste](ValueSet-disability-level.html)
- [Patsiendi kõrgeim haridustase](ValueSet-education-level.html)
- [Eeskostja liik](ValueSet-guardian-status.html)
- [Patsiendi teovõime staatus](ValueSet-legal-status.html)
- [Töötamise liik](ValueSet-occupation-type.html)
- [Suhe patsiendiga](ValueSet-person-relationship.html)
- [Kontaktisiku tüüp](ValueSet-person-relationship-class.html)
- [Hooldusõiguse liik](ValueSet-power-of-attorney.html)

#### PÜT-is kasutatavad klassifikaatorid
- [Töövõimetuse määr](CodeSystem-incapacity-for-work-category.html)
- [Puude raskusaste](CodeSystem-disability-level.html)
- [Patsiendi teovõime staatus](CodeSystem-legal-status.html)
- [Patsiendi kõrgeim haridustase](CodeSystem-education-level.html)
- [Hooldusõiguse liik](CodeSystem-power-of-attorney.html)
- [Töötamise liik](CodeSystem-occupation-type.html)

#### EEBase-i kaudu kasutatavad loendid
- [Administrative Gender](https://build.fhir.org/ig/HL7EE/ig-ee-base//ValueSet-ee-administrative-gender.html)
- [Person Identity System](https://build.fhir.org/ig/HL7EE/ig-ee-base//ValueSet-ee-patient-identity.html)
- [Date Accuracy Indicator](https://build.fhir.org/ig/HL7EE/ig-ee-base//ValueSet-ee-date-accuracy-indicator.html)
- [ADS](https://build.fhir.org/ig/HL7EE/ig-ee-base//ValueSet-ee-ads.html)
- [Observation category](https://build.fhir.org/ig/HL7EE/ig-ee-base//ValueSet-ee-observation-category.html)

#### Kasutatav FHIR terminoogia
- [Suhte liik/MaritalStatus](http://hl7.org/fhir/R5/valueset-marital-status.html)
- [Identifier use](http://hl7.org/fhir/R5/valueset-identifier-use.html)
- [IdentifierTypeCodes](http://hl7.org/fhir/R5/valueset-identifier-type.html)
- [AllLanguages](http://hl7.org/fhir/R5/valueset-all-languages.html)
- [NameUse](http://hl7.org/fhir/R5/valueset-name-use.html)
- [ContactPointUse](http://hl7.org/fhir/R5/valueset-contact-point-use.html)
- [AddressUse](http://hl7.org/fhir/R5/valueset-address-use.html)
- [AddressType](http://hl7.org/fhir/R5/valueset-address-type.html)
- [Riigid/Iso316612](http://hl7.org/fhir/R5/valueset-iso3166-1-2.html)


