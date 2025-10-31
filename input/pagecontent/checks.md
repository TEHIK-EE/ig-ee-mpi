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

#### Telecom väärtused

- `Patient.telecom` on piiramatu massiv, mis võib sisaldada isiku kontaktandmed: tel. numbrid ja e-mailid.
- `Patient.telecom[x].system` on kohustuslik, lubatud väärtused: phone \| email
- `Patient.telecom[x].use` ei ole kohustuslik
- `Patient.telecom[x].rank` ei ole kohustuslik. 

Näide:
```json
    ...
    "telecom": [
        {
            "system": "phone",
            "value": "+37253535353",
            "use": "home",
            "rank": 1
        },
        {
            "system": "email",
            "value": "abc@def.gg",
            "use": "work",
            "rank": 2
        }
    ],
  ...
```


##### Telefonid

Eesti numeratsiooniplaan [riigiteataja.ee/akt/881042](https://www.riigiteataja.ee/akt/881042) reguleerib lubatud telefoninumbrite numeratsiooni Eestis.

| Telefoninumbrid             | Regex valem         | Kirjeldus                                                                                                           |
|:----------------------------|:--------------------|:--------------------------------------------------------------------------------------------------------------------|
| Eesti lauatelefoni number   | `^(32               | 33                                                                                                                  |35|38|39|6[0-9]|7[1-9]|88)(\d{5})$` | Eesti riigikood kujul +372 või 00372 ignoreeritakse valideerimisel, kuid salvestatakse alati kujul +372. |
| Eesti mobiiltelefoni number | `^5[0-9](\d{5,6})$` | Eesti riigikood kujul +372 või 00372 ignoreeritakse valideerimisel, kuid salvestatakse alati kujul +372.            |
| Välismaa telefoni number    | `^\+[1-9]\d{1,14}$` | Kontrollitakse ainult pikkust ja riigi koodi olemasolu. Teiste riikide reegleid ei rakendata numbri valideerimisel. |

Telefoninumbrid salvestatkse registri alati riigi koodiga kujul +XXXYYYYYY ilma tühikudeta ja sulgudeta. Juhul kui PÜT-i jõuab valiidne Eesti number ilma
riigikoodita siis riigikood lisatakse telefoninumbrile automaatselt.

##### Emailid

Emaili valideeritakse regexi valemi järgi:
`^(?=.{1,64}@)[A-Za-z0-9_+-]+(\.[A-Za-z0-9_+-]+)*@[^-][A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,})$`.
Salvestatakse ainult valiidsed emailid muutumata kujul.

#### Aadress

FHIR aadress kasutatakse postikonventsioonide väljendamiseks.
Aadressi vorming kirjeldatud [EEBase Address](https://fhir.ee/ig/ee-base/current/site/StructureDefinition-ee-address.html) andmetüübi kirjelduses.
Kohustlikuks elemendiks on riigikood, mis peab vastama [iso3166-1-alpha2](http://hl7.org/fhir/R5/valueset-iso3166-1-2.html) vormingule.
Tagasiühildamiseks praeguse lahendusega (ajutiselt) toetaks ka [iso3166-1-alpha3](http://hl7.org/fhir/R5/valueset-iso3166-1-3.html) riigikood.

##### Eesti aadress
Eesti aadress on aadress mille riigikood on `EE` (Eesti).

MPI-sse saab salvestada ainult isiku lisa-aadress, ametlik elukoha aadress tuleb MPI-sse automaatselt Rahvastikuregistrist automaatselt.

- Eesti aadressi puhul on kohustuslik `ADR-ID` ja `ADS-OID` väärtus ADS registrist. Kõik teised väljad on informatiivsed ja ei oma sisulist tähendust. Vaata aadressi
  kasutamise [juhiseid](https://fhir.ee/ig/ee-base/current/site/StructureDefinition-ee-address.html#notes) EEBase spetsifikatsioonis.
- Kui `ADR-ID` olemas aga `ADS-OID` puudub siis teised aadressi väljad laetakse ADS-ist *ADR-ID* järgi.
- Kui `ADS-OID` olemas aga `ADR-ID` puudub siis teised aadressi väljad laetakse ADS-ist *ADS-OID* järgi.
- Kui `ADR-ID` ja `ADS-OID` puuduvad aga `text` on olemas, siis proovitakse leida unikaalne vaste ADS-ist teksti järgi.

###### Kvaliteedinõuded

Lisa-aadress peab vastama samadele kvaliteedinõuetele, mis elukoha aaddress Rahvastikuregistri järgi.
Aadressite edastamiseks MPI-sse tuleb järgida Maa-ameti poolt koostatud [juhendi](https://geoportaal.maaamet.ee/docs/aadress/elukoha_ja_lisaaadressi_valiku_juhend.pdf). 
Kui aadress ei vasta nõuetele MPI lisab sellele [notice](https://fhir.ee/ig/ee-base/current/site/StructureDefinition-ee-address-definitions.html#diff_Address.extension:notice) veatekstiga.

**Kui lisa-aadress vastab kvaliteedinõuetele, siis saadetakse see automaatselt Rahvastikuregistrisse.**

##### Välismaa aadress

Välismaa aadress on aadress mille riigiks ei ole `EE` (Eesti).
Välismaa aadressi puhul on kohustuslik ainult riigi kood ja tekst. Välismaa aadressi puhul teisi kontrolle ei teostata.

#### Identifikaatorid
- Identifikaatorite eemaldamine ja muutmine ei ole lubatud. Kui patsiendi identifikaator kaotanud kehtivuse siis tuleb määrata kehtivuse lõppuaeg (`Identifier.period`).
- Identifikaatorite lisamine on lubatud (v.a Eesti isikukoodiga identifikaator).
- Eesit isikukoodi identifikaatori muutmine (s.h `Identifier` väljad) ei ole lubatud.
- [Isikukoodi kohustuslikkus identifitseerimisel](https://akk.tehik.ee/classifier/resources/value-sets/isikukoodi-kohustuslikkus-identifitseerimisel/summary)

#### Kontaktisikud

Patsiendil saab olla kuni 3 kehtivat kontaktisikut (RelatedPerson ressurssi CON suhetüübiga), limiidi ületades tuleb MPI-042 koodiga viga.

### Suhtluskeeled

Patsiendil võib olla mitu suhtluskeelt. Suhtluskeele määramiseks tuleb kasutada rahvusvahelist standardit [IETF BCP 47](https://en.wikipedia.org/wiki/IETF_language_tag). 
Keele koodisüsteemiks tuleb kasutada [urn:ietf:bcp:47](https://terminology.hl7.org/6.2.0/CodeSystem-v3-ietf3066.html). Keelte eestikeelsed nimetused on võimalik kätte saada Tehiku
loendist [Keeled](https://teabekeskus.tehik.ee/et/loendid/keeled).

Näidis:

```json
{
  "resourceType": "Patient",
  "id": "123",
  "meta": {
    "profile": [
      "https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient-verified"
    ]
  },
  ...
  "communication": [
    {
      "language": {
        "coding": [
          {
            "system": "urn:ietf:bcp:47",
            "code": "en-US",
            "display": "English (United States)"
          }
        ]
      },
      "preferred": false
    },
    {
      "language": {
        "coding": [
          {
            "system": "urn:ietf:bcp:47",
            "code": "et",
            "display": "Eesti"
          }
        ]
      },
      "preferred": true
    }
  ]
}
```

_display_ väli ei ole kohustuslik, seda täidetakse koodi järgi pärimisel automaatselt.

### Kasutatav terminoloogia

#### PÜT-is kasutatavad loendid

- [Eeskoste liik](https://teabekeskus.tehik.ee/et/loendid/eestkoste-liik)
- [Hooldusõiguse liik](https://teabekeskus.tehik.ee/et/loendid/hooldusoiguse-liik)
- [Isiku seos patsiendiga](https://akk.tehik.ee/classifier/resources/value-sets/isiku-seos-patsiendiga/summary)
- [Omandatud kõrgeim haridus](https://teabekeskus.tehik.ee/et/loendid/omandatud-korgeim-haridus)
- [Puude raskusaste](https://teabekeskus.tehik.ee/et/loendid/puude-raskusaste)
- [Teovõime staatus](https://teabekeskus.tehik.ee/et/loendid/teovoime-staatus)
- [Töövõime liik](https://teabekeskus.tehik.ee/et/loendid/toovoime-liik)
- [Administratiivne sugu](https://teabekeskus.tehik.ee/et/loendid/administratiivne-sugu)
- [Patsiendi identifikaatorite domeen](https://teabekeskus.tehik.ee/et/loendid/patsiendi-identifikaatorite-domeen)

#### PÜT-is kasutatavad klassifikaatorid

- [Hooldusõiguse liik](https://akk.tehik.ee/classifier/resources/code-systems/hooldusoiguse-liik/summary)
- [Omandatud kõrgeim haridus](https://akk.tehik.ee/classifier/resources/code-systems/omandatud-korgeim-haridus/summary)
- [Puude raskusaste](https://akk.tehik.ee/classifier/resources/code-systems/puude-raskusaste/summary)
- [Teovõime staatus](https://akk.tehik.ee/classifier/resources/code-systems/teovoime-staatus/summary)
- [Töövõime liik](https://akk.tehik.ee/classifier/resources/code-systems/toovoime-liik/summary)

#### EEBase-i kaudu kasutatavad loendid

- [Date Accuracy Indicator](https://ig.hl7.fhir.ee/ig-ee-base/ValueSet-date-accuracy-indicator.html)
- [ADS ADR-ID](https://ig.hl7.fhir.ee/ig-ee-base/ValueSet-ads-adr-id.html)
- [ADS OID](https://ig.hl7.fhir.ee/ig-ee-base/StructureDefinition-ee-ads-oid.html)

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


