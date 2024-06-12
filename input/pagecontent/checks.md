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
Eesti isikukoodiga patsiendi tuleb pärida alati [lookup](operations.html#eesti-isikukoodiga-patsiendi-otsing) operatisooniga, kus on kasutatud allikana Rahvastikuregister.
Operatsioon tagastab `Patient` ressursi koos id-ga, mille abil saab patsiendi andmeid uuendada.

#### Telefonid

Eesti numeratsiooniplaan [riigiteataja.ee/akt/881042](https://www.riigiteataja.ee/akt/881042) reguleerib lubatud telefoninumbrite numeratsiooni Eestis.

| Telefoninumbrid             | Regex valem         | Kirjeldus                                                                                                           |
|:----------------------------|:--------------------|:--------------------------------------------------------------------------------------------------------------------|
| Eesti lauatelefoni number   | `^(32               | 33                                                                                                                  |35|38|39|6[0-9]|7[1-9]|88)(\d{5})$` | Eesti riigikood kujul +372 või 00372 ignoreeritakse valideerimisel, kuid salvestatakse alati kujul +372. |
| Eesti mobiiltelefoni number | `^5[0-9](\d{5,6})$` | Eesti riigikood kujul +372 või 00372 ignoreeritakse valideerimisel, kuid salvestatakse alati kujul +372.            |
| Välismaa telefoni number    | `^\+[1-9]\d{1,14}$` | Kontrollitakse ainult pikkust ja riigi koodi olemasolu. Teiste riikide reegleid ei rakendata numbri valideerimisel. |

Telefoninumbrid salvestatkse registri alati riigi koodiga kujul +XXXYYYYYY ilma tühikudeta ja sulgudeta. Juhul kui PÜT-i jõuab valiidne Eesti number ilma
riigikoodita siis riigikood lisatakse telefoninumbrile automaatselt.

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

MPI-sse saab salvestada ainult isiku lisa-aadress, ametlik elukoha aadress tuleb MPI-sse automaatselt Rahvastikuregistrist automaatselt.

- Eesti aadressi puhul on kohustuslik `ADR-ID` ja `ADS-OID` väärtus ADS registrist. Kõik teised väljad on informatiivsed ja ei oma sisulist tähendust. Vaata aadressi
  kasutamise [juhiseid](https://build.fhir.org/ig/HL7EE/ig-ee-base/StructureDefinition-ee-address.html#notes) EEBase spetsifikatsioonis.
- Kui `ADR-ID` olemas aga `ADS-OID` puudub siis teised aadressi väljad laetakse ADS-ist *ADR-ID* järgi.
- Kui `ADS-OID` olemas aga `ADR-ID` puudub siis teised aadressi väljad laetakse ADS-ist *ADS-OID* järgi.
- Kui `ADR-ID` ja `ADS-OID` puuduvad aga `text` on olemas, siis proovitakse leida unikaalne vaste ADS-ist teksti järgi.

###### Kvaliteedinõuded

Lisa-aadress peab vastama samadele kvaliteedinõuetele, mis elukoha aaddress Rahvastikuregistri järgi.
Aadressite edastamiseks MPI-sse tuleb järgida Maa-ameti poolt koostatud [juhendi](https://geoportaal.maaamet.ee/docs/aadress/RR_elukohtade-ja-lisaaadresside-valiku-juhend.pdf). 
Kui aadress ei vasta nõuetele MPI lisab sellele [notice](https://build.fhir.org/ig/HL7EE/ig-ee-base//StructureDefinition-ee-address-definitions.html#diff_Address.extension:notice) veatekstiga.

**Kui lisa-aadress vastab kvaliteedinõuetele, siis saadetakse see automaatselt Rahvastikuregistrisse.**

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
- [Suhe patsiendiga](https://build.fhir.org/ig/HL7EE/ig-ee-base/ValueSet-person-relationship.html)
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

- [Administrative Gender](https://build.fhir.org/ig/HL7EE/ig-ee-base/ValueSet-administrative-gender.html)
- [Patient Identifier Domain](https://build.fhir.org/ig/HL7EE/ig-ee-base/ValueSet-patient-identifier-domain.html)
- [Date Accuracy Indicator](https://build.fhir.org/ig/HL7EE/ig-ee-base/ValueSet-date-accuracy-indicator.html)
- [ADS ADR-ID](https://build.fhir.org/ig/HL7EE/ig-ee-base/ValueSet-ads-adr-id.html)
- [ADS OID](https://build.fhir.org/ig/HL7EE/ig-ee-base/StructureDefinition-ee-ads-oid.html)
- [Observation category](https://build.fhir.org/ig/HL7EE/ig-ee-base/ValueSet-ee-observation-category.html)

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


