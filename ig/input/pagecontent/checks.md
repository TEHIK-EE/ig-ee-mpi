### Üldised kontrollid

Kõik päringus ja ressurssid peavad järgima FHIR spetsifikatsiooni.

Sissetulevad päringud ja andmed valideeritakse:
- FHIR [spetsifikatsiooni](http://hl7.org/fhir/documentation.html) üldiste reeglite ja loendite vastu
- PÜT profiilide vastu
- PÜT rakenduse poolt lubatud tegevuste nimekirja vastu (nimekiri tegevustest leitav CapabilityStatement-is aadressil [$mpi-url/fhir/metadata](#))
- Kontrollitakse kasutatavat terminoloogiat profiilide ja terminoloogia serveri vastu
- Autoriseerimisserveri vastu, tegevust saab teostada ainult kasutaja vastava rolli olemasolul

### PÜT rakenduse sisesed kontrollid
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
