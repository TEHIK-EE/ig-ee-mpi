## Vead

API tagastab vead [OperationOutcome](https://hl7.org/fhir/R5/operationoutcome.html) ressursina, mille sees võib olla mitu `issue` elementi koos vigadega.
Vead võivad olla kas ainult patsiendi registri omad või sisaldada ka peegeldatud vigu teistest teenustest.

Näide `OperationOutcome`-ist, mis kuvab peegeldatud viga:

```json
{
  "resourceType": "OperationOutcome",
  "issue": [
    {
      "code": "exception",
      "details": {
        "coding": [
          {
            "system": "https://mpi.tehik.ee",
            "code": "MPI-029"
          }
        ],
        "text": "Integratsiooniviga xroad-rr teenusega"
      }
    },
    {
      "code": "exception",
      "details": {
        "coding": [
          {
            "system": "https://xroad-rr.tehik.ee",
            "code": "XRR200"
          }
        ],
        "text": "X-road error 10001 from RR: Isikukoodi pikkus ei ole 11 sümbolit."
      }
    },
    {
      "code": "exception",
      "details": {
        "coding": [
          {
            "system": "https://rahvastikuregister.ee",
            "code": "10001"
          }
        ],
        "text": "Isikukoodi pikkus ei ole 11 sümbolit."
      }
    }
  ]
}
```

## Veasüsteemid

| System                            | Kirjeldus                                                 |
|-----------------------------------|-----------------------------------------------------------|
| https://mpi.tehik.ee              | Patsiendi registri veakoodid                              |
|                                   |                                                           |
| https://xroad-rr.tehik.ee         | Tehiku RR x-tee mikroteenuse veakoodid                    |
| https://xroad-ads.tehik.ee        | Tehiku ADS x-tee mikroteenuse veakoodid                   |
| https://xroad-tor.tehik.ee        | Tehiku TÖR x-tee mikroteenuse veakoodid                   |
| https://xroad-ska.tehik.ee        | Tehiku SKA x-tee mikroteenuse veakoodid                   |
| https://xroad-tk.tehik.ee         | Tehiku TK x-tee mikroteenuse veakoodid                    |
|                                   |                                                           |
| https://rahvastikuregister.ee     | Rahvastikuregistri x-tee teenuste veakoodid               |
| https://tootukassa.ee             | Töötukassa x-tee teenuste veakoodid                       |
| https://sotsiaalkindlustusamet.ee | Sotsiaalkindlustusameti x-tee teenuste veakoodid          |
| https://maaamet.ee                | Maameti ADS registri x-tee teenuste veakoodid             |
| https://emta.ee                   | Tolli ja maksuameti TÖR registri x-tee teenuste veakoodid |

## Vigade kataloog

Allpool on toodud veakoodid tekstidega erinevatest süsteemidest. Oluline meeles pidada, et mitte kõik veakoodid võivad jõuda lõppkasutajani.

### Patsiendi registri veakoodid

| Veakood    | Veatekst inglise keeles                                                                                                                                                             | Veatekst eesti keeles                                                                                                                                   |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| MPI-001    | An internal MPI error occurred                                                                                                                                                      | Juhtus MPI sisemine viga                                                                                                                                |
| MPI-002    | Patient index encryption failed                                                                                                                                                     | Patsiendi indeksi krüpteerimise viga                                                                                                                    |
| MPI-003    | Patient index decryption failed                                                                                                                                                     | Patsiendi indeksi dekrüpteerimise viga                                                                                                                  |
| MPI-004    | Patient index HMAC calculation failed                                                                                                                                               | Patsiendi indeksi HMAC arvutamise viga                                                                                                                  |
| MPI-005    | A secondary HSM key is required to re-encrypt the data                                                                                                                              | Sekundaarne HSM võti on kohustuslik selleks, et andmeid saaks uuesti krüpteerida                                                                        |
| MPI-006    | The patient index is inconsistent: duplicate {system, value} pairs were found                                                                                                       | Patsiendi indeks on ebakonsistentne, on leitud duplikaate {system, value} paariga                                                                       |
| MPI-007    | XML parsing failed                                                                                                                                                                  | XML'i parsimine on ebaõnnestunud                                                                                                                        |
| MPI-008    | Unknown telecom system: ${system}, allowed values: ${allowed}                                                                                                                       | Tundmatu telekomi süsteem: ${system}, lubatud väärtused: ${allowed}                                                                                     |
| MPI-009    | Unknown country code ${code}                                                                                                                                                        | Tundmatu riigi kood ${code}                                                                                                                             |
| MPI-010    | Cannot create patient: a patient with the same identifier already exists                                                                                                            | Patsiendi loomine ei ole võimalik, patsient sama identifikaatoriga juba eksisteerib                                                                     |
| MPI-011    | Invalid address type: ${type}, allowed values: ${allowed}                                                                                                                           | Lubamatu aadressi tüüp: ${type}, lubatud väärtused: ${allowed}                                                                                          |
| MPI-012    | Invalid address use: ${use}, allowed values: ${allowed}                                                                                                                             | Lubamatu aadressi kasutus: ${use}, lubatud väärtused: ${allowed}                                                                                        |
| MPI-013    | Unknown telecom use: ${use}, allowed values: ${allowed}                                                                                                                             | Tundmatu telekomi kasutus: ${use}, lubatud väärtused: ${allowed}                                                                                        |
| MPI-015    | The search parameters are invalid or missing                                                                                                                                        | Antud otsingu parameetrid ei sobi või puuduvad                                                                                                          |
| MPI-016    | The patient must have at least one identifier                                                                                                                                       | Patsiendil peab olema vähemalt üks identifikaator                                                                                                       |
| MPI-017    | The identifiers match multiple patients; saving is not possible                                                                                                                     | Antud identifikaatoritega leiab mitu erinevat patsienti, salvestamine ei ole võimalik                                                                   |
| MPI-018    | Unknown patient contact type ${code}                                                                                                                                                | Tundmatu patsiendi kontaktisiku liik ${code}                                                                                                            |
| MPI-019    | The address is missing a country code                                                                                                                                               | Aadressil puudub riigi kood                                                                                                                             |
| MPI-020    | Failed to retrieve the patient's legal capacity                                                                                                                                     | Patsiendi teovõime pärimine ebaõnnestus                                                                                                                 |
| MPI-021    | Patient not found                                                                                                                                                                   | Patsienti ei leitud                                                                                                                                     |
| MPI-022    | The patient's personal code was not found                                                                                                                                           | Patsiendi isikukoodi ei leitud                                                                                                                          |
| MPI-023    | FHIR profile ${profile} is not allowed or supported                                                                                                                                 | FHIR profiil ${profile} pole lubatud või toetatud                                                                                                       |
| MPI-024    | FHIR profile is missing                                                                                                                                                             | FHIR profiil on puudu                                                                                                                                   |
| MPI-025    | Unknown identifier system ${system}                                                                                                                                                 | Tundmatu identifikaatori süsteem ${system}                                                                                                              |
| MPI-025.01 | Identifier system ${system} does not comply with the rules. It must start with 'urn:oid', 'https:' or 'http:'                                                                       | Identifikaatori süsteem ${system} ei vasta reeglitele. Peab algama 'urn:oid', 'https:' või 'http:' prefiksiga                                           |
| MPI-026    | Telecom value ${value} does not comply with the validation rules                                                                                                                    | Telekomi väärtus ${value} ei vasta validatsiooni reeglitele                                                                                             |
| MPI-027    | Too many results found; please narrow the search criteria                                                                                                                           | Leiti liiga palju tulemusi, palun kitsendage otsingu kriteeriumeid                                                                                      |
| MPI-028    | The request is missing the author's identifier (${param})                                                                                                                           | Päringus puudub autori identifikaator (${param})                                                                                                        |
| MPI-029    | Integration error with the xroad-rr service                                                                                                                                         | Integratsiooniviga xroad-rr teenusega                                                                                                                   |
| MPI-030    | Integration error with the xroad-sk service                                                                                                                                         | Integratsiooniviga xroad-sk teenusega                                                                                                                   |
| MPI-031    | Integration error with the xroad-ads service                                                                                                                                        | Integratsiooniviga xroad-ads teenusega                                                                                                                  |
| MPI-032    | The request is missing the 'x-road-issue' header                                                                                                                                    | Päringus puudub päis 'x-road-issue'                                                                                                                     |
| MPI-033    | The request is missing the author's organization registry code                                                                                                                      | Päringus puudub autori asutuse registrikood                                                                                                             |
| MPI-034    | Failed to save marital status: there is no relationship between the patient and the other person                                                                                    | Perekonnaseisu salvestamine ebaõnnestus, sest puudub seos patsiendi ja teise isiku vahel                                                                |
| MPI-035    | Failed to link patients: the primary patient must not be unknown                                                                                                                    | Patsientide sidumine ebaõnnestus: primaarne patsient ei tohi olla tundmatu                                                                              |
| MPI-036    | Failed to link patients: the secondary patient is already linked to another patient                                                                                                 | Patsientide sidumine ebaõnnestus: sekundaarne patsient on juba teise patsiendiga seotud                                                                 |
| MPI-037    | Sort parameter '${param}' is not allowed                                                                                                                                            | Sorteerimisparameeter '${param}' pole lubatud                                                                                                           |
| MPI-038    | Failed to unlink patients: the patients are not linked                                                                                                                              | Patsientide lahti sidumine ebaõnnestus: antud patsiendid pole seotud                                                                                    |
| MPI-039    | Failed to notify the WM service about linking patients                                                                                                                              | Ei saanud teavitada WM teenust  patsientide sidumise kohta                                                                                              |
| MPI-040    | Integration error with the xroad-tor service                                                                                                                                        | Integratsiooniviga xroad-tor teenusega                                                                                                                  |
| MPI-041    | The patient already has a contact with the same identifier and relationship                                                                                                         | Antud patsiendil juba eksisteerib kontaktisik sama identifikaatoriga ja seosega                                                                         |
| MPI-042    | The patient cannot have more than ${max} contacts                                                                                                                                   | Patsiendil ei saa olla rohkem kui ${max} kontaktisikut                                                                                                  |
| MPI-043    | Integration error with the xroad-tk service                                                                                                                                         | Integratsiooniviga xroad-tk teenusega                                                                                                                   |
| MPI-044    | Encountered invalid est personal code: ${code}                                                                                                                                      | Encountered invalid est personal code: ${code}                                                                                                          |
| MPI-046    | Multiple patient records were found for parameter ${param}                                                                                                                          | Mitu patsiendi kirjet on leitud parameetriga ${param}                                                                                                   |
| MPI-047    | The legal-status parameter is required                                                                                                                                              | legal-status parameeter on kohustuslik                                                                                                                  |
| MPI-048    | Invalid legal-status parameter value                                                                                                                                                | Lubamatu legal-status parameetri väärtus                                                                                                                |
| MPI-049    | The patient already has the address: ${addressText}                                                                                                                                 | Patsiendil juba eksisteerib aadress: ${addressText}                                                                                                     |
| MPI-050    | Creating a Patient resource with an Estonian personal code using POST /Patient is not allowed; please use the /Patient/$lookup operation with the Population Register as the source | Eesti isikukoodiga Patient ressursi pole lubatud luua POST /Patient päringuga, palun kasutage /Patient/$lookup operatsiooni Rahvastikuregistri allikaga |
| MPI-051    | Address with ADR-ID ${adr-id} was not found in ADS                                                                                                                                  | Aadress ADR-ID-ga ${adr-id} ei ole leitud ADS-ist                                                                                                       |
| MPI-052    | Access to the requested data is not allowed for this patient                                                                                                                        | Ligipääs soovitud andmetele pole antud patsiendile lubatud                                                                                              |
| MPI-053    | Address with ADS-OID ${ads-oid} was not found in ADS                                                                                                                                | Aadress ADS-OID-ga ${ads-oid} ei ole leitud ADS-ist                                                                                                     |
| MPI-054    | Address with ADS-OID ${ads-oid} and ADR-ID ${adr-id} was not found in ADS                                                                                                           | Aadress ADS-OID-ga ${ads-oid} ja ADR-ID-ga ${adr-id} ei ole leitud ADS-ist                                                                              |
| MPI-055    | Multiple parallel addresses were found for ADS-OID ${ads-oid}; an ADR-ID value is also required                                                                                     | Antud aadressi ADS-OID-ga ${ads-oid} leiab mitu paralleelaadressit, oodatud ka ADR-ID väärtus                                                           |
| MPI-056    | An internal MPI identifier cannot be created or linked                                                                                                                              | MPI sisemist identfikaatorit ei saa luua või siduda                                                                                                     |
| MPI-057    | Cannot search the ADS register for an address using the given text (${text})                                                                                                        | Antud teksti (${text}) järgi pole võimalik otsida aadressi ADS registrist                                                                               |
| MPI-058    | No address was found in the ADS register for the given text (${text})                                                                                                               | Antud teksti (${text}) järgi pole leitud ühtegi aadressi ADS registrist                                                                                 |
| MPI-059    | Cannot find a unique address in the ADS register for the given text (${text})                                                                                                       | Antud teksti (${text}) järgi pole võimalik leida unikaalne aadress ADS registrist                                                                       |
| MPI-060    | The request is missing the 'x-road-userid' header                                                                                                                                   | Päringus puudub päis 'x-road-userid'                                                                                                                    |
| MPI-061    | The request is missing the 'x-road-id' header                                                                                                                                       | Päringus puudub päis 'x-road-id'                                                                                                                        |
| MPI-062    | The request headers 'x-road-userid' and 'x-author-id' contain different personal codes                                                                                              | Päringu päised 'x-road-userid' ja 'x-author-id' on erineva isikukoodiga                                                                                 |
| MPI-063    | The request author must not be anonymous (personal code ${impersonal_code})                                                                                                         | Päringu autor ei tohi olla anonüümne (isikukoodiga ${impersonal_code})                                                                                  |
| MPI-064    | The 'guardian-only' parameter is only allowed for a minor patient. Use the $legal-guardian operation to find an adult's guardian!                                                   | 'guardian-only' parameeter on lubatud ainult alaealise patsiendi puhul. Täiskasvanu eestkostja leidmiseks tuleb kasutada $legal-guardian operatsiooni!  |
| MPI-065    | Failed to link patients: the secondary patient (source) must not be associated with an Estonian personal code                                                                       | Patsientide sidumine ebaõnnestus: sekundaarne patsient (source) ei tohi olla seotud eesti isikukoodiga                                                  |
| MPI-066    | The request author's personal code ${personalCode} is invalid                                                                                                                       | Päringu autori isikukood ${personalCode} ei ole korrektne                                                                                               |
| MPI-067    | Patient identifier system ${system} is not allowed                                                                                                                                  | Patsiendi identifikaatori süsteem ${system} ei ole lubatud                                                                                              |
| MPI-068    | Failed to unlink patients: the primary and secondary patients must not both be associated with Estonian personal codes                                                              | Patsientide lahtisidumine ebaõnnestus: nii primaarne kui ka sekundaarne patsient ei tohi olla seotud Eesti isikukoodiga                                 |
| MPI-069    | Patient identifier system ${system} expired on ${validUntil}                                                                                                                        | Patsiendi identifikaatori süsteemi ${system} kehtivus lõppes ${validUntil}                                                                              |
| MPI-070    | Foreign identifier ${id-system}\|${id-value} requires a personal code with system ${required}                                                                                       | Välismaa identifikaatorile ${id-system}\|${id-value} on kohustulik määrata ka isikukood süsteemiga ${required}                                          |
| MPI-071    | For a patient with an Estonian personal code, the date of death, date of birth, sex, name, active status and personal code cannot be changed                                        | Eesti isikukoodiga patsiendil ei saa muuta: surmakuupäeva, sünnikuupäeva, sugu, nime                                                                    |
| MPI-072    | Patient resource with id ${id} was not found                                                                                                                                        | Patient ressurss id-ga ${id} ei leitud                                                                                                                  |
| MPI-073    | RelatedPerson resource with id ${id} was not found                                                                                                                                  | RelatedPerson ressurss id-ga ${id} ei leitud                                                                                                            |
| MPI-074    | Observation resource with id ${id} was not found                                                                                                                                    | Observation ressurss id-ga ${id} ei leitud                                                                                                              |
| MPI-075    | Only one value is allowed for search parameter '${param}'                                                                                                                           | Otsingu parameetril '${param}' on lubatud ainult üks väärtus                                                                                            |
| MPI-076    | The 'birthdate' parameter has an invalid date format; the allowed format is YYYY-MM-DD                                                                                              | 'birthdate' parameetril on vale ajaformaat, lubatud formaat: YYYY-MM-DD                                                                                 |
| MPI-077    | Unknown 'source' value                                                                                                                                                              | Tundmatu 'source' väärtus                                                                                                                               |
| MPI-078    | Missing required parameter '${param}'                                                                                                                                               | Puudub kohustuslik '${param}' parameeter                                                                                                                |
| MPI-079    | History record was not found                                                                                                                                                        | Ajalookirjet ei leitud                                                                                                                                  |
| MPI-080    | Search parameter '${param}' can be submitted only once                                                                                                                              | Otsinguparameeter '${param}' võib olla esitatud ainult ühe korra                                                                                        |
| MPI-081    | The address object is associated with multiple building units                                                                                                                       | Aadressiobjektiga on seotud mitu hoone osa                                                                                                              |
| MPI-082    | The address is missing level 6 or 7                                                                                                                                                 | Aadressil puudub tase 6 või 7                                                                                                                           |
| MPI-086    | The address object is missing the UN attribute                                                                                                                                      | Aadressiobjektil puudub UN tunnus                                                                                                                       |
| MPI-087    | The address is technical                                                                                                                                                            | Aadress on tehniline                                                                                                                                    |
| MPI-088    | Using an address object of type MR is not recommended                                                                                                                               | MR tüübiga aadressiobjekti kasutamine ei ole soovitatav                                                                                                 |
| MPI-089    | No person with the given personal code was found in the Population Register                                                                                                         | Antud isikukoodiga isik puudub RR-is                                                                                                                    |
| MPI-090    | The given personal code (${identifier}) is invalid                                                                                                                                  | Antud isikukood (${identifier}) ei ole korrektne                                                                                                        |
| MPI-091    | No person with the request author's personal code was found in the Population Register                                                                                              | Päringu autori isikukoodiga isik puudub RR-is                                                                                                           |
| MPI-092    | Unknown code in the legal capacity code system: ${code}                                                                                                                             | Teovõime koodisüsteemi tundmatu kood: ${code}                                                                                                           |
| MPI-093    | Unknown language code system ${codeSystem}                                                                                                                                          | Tundmatu keelte koodisüsteem ${codeSystem}                                                                                                              |
| MPI-094    | Unknown sex ${code}                                                                                                                                                                 | Tundmatu sugu ${code}                                                                                                                                   |
| MPI-095    | The patient-identifier batch limit of ${limit} has been exceeded                                                                                                                    | patient-identifier batch-i limiit ${limit} on ületatud                                                                                                  |
| MPI-096    | The service input is invalid. ${message}                                                                                                                                            | Teenuse sisend ei ole valiidne. ${message}                                                                                                              |
| MPI-097    | The user session contains multiple 'practitioner' roles; only one is allowed                                                                                                        | Kasutaja sessiooni infos on mitu 'practitioner' rolli, lubatud vaid üks                                                                                 |
| MPI-098    | Terminology validation failed: ${system}\|${code} was not found in value set ${valueSet}                                                                                            | Terminoloogia valideerimine ebaõnnestus, ${system}\|${code} ei leitud loendist ${valueSet}                                                              |
| MPI-099    | Resource ${reference} was not found                                                                                                                                                 | ${reference} ressurssi ei leitud                                                                                                                        |
| MPI-100    | Unknown background job type ${type}                                                                                                                                                 | Tundmatu taustatöö tüüp ${type}                                                                                                                         |
| MPI-101    | The patient is deceased                                                                                                                                                             | Patsient on surnud                                                                                                                                      |
| MPI-102    | Creating a patient identifier with an Estonian personal code is not allowed                                                                                                         | Eesti isikukoodiga patsiendi identifikaatori loomine ei ole lubatud                                                                                     |
| MPI-103    | The patient to be replaced was not found by identifier ${identifier}                                                                                                                | Asendatavat patsienti ei leitud identifikaatori ${identifier} järgi                                                                                     |
| MPI-104    | The replacing patient was not found by identifier ${identifier}                                                                                                                     | Asendavat patsienti ei leitud identifikaatori ${identifier} järgi                                                                                       |
| MPI-105    | The session information is missing a role                                                                                                                                           | Session infos puudub roll                                                                                                                               |
| MPI-106    | The Population Register query failed: ${message}                                                                                                                                    | RR-i päring ebaõnnestus: ${message}                                                                                                                     |
| MPI-107    | The generated identifier value is already used by another patient in the given system                                                                                               | Genereeritud identifikaatori väärtus on juba kasutusel teise patsiendi poolt antud süsteemis                                                            |
| MPI-400    | Generic FHIR server error                                                                                                                                                           | FHIR serveri üldine viga                                                                                                                                |
| MPI-403    | ${interaction} is not allowed                                                                                                                                                       | ${interaction} pole lubatud                                                                                                                             |

### Tehiku RR x-tee mikroteenuse veakoodid

| Veakood | Veatekst                                                                             |
|---------|--------------------------------------------------------------------------------------|
| XRR100  | System error                                                                         |
| XRR200  | X-road error {{code}} from RR: {{text}}                                              |
| XRR300  | Personal code missing in RR or invalid account, original RR error: {{code}} {{text}} |
| XRR400  | Failed to exchange person contact data with RR due to error {{code}}: {{text}}       |

### Tehiku ADS x-tee mikroteenuse veakoodid

| Veakood    | Veatekst                                           |
|------------|----------------------------------------------------|
| XR_ADS-001 | Juhtus ADS sisemine viga                           |
| XR_ADS-100 | Juhtus ADS teenenuse X-tee viga: ${code} - ${text} |
| XR_ADS-404 | Aadressi adr-id'ga ${adrId} ei leitud ADS-ist      |

### Tehiku TÖR x-tee mikroteenuse veakoodid

| Veakood    | Veatekst                                           |
|------------|----------------------------------------------------|
| XR_TOR-001 | Juhtus TOR teenuse sisemine viga                   |
| XR_TOR-100 | Juhtus TOR teenenuse X-tee viga: ${code} - ${text} |

### Tehiku SKA x-tee mikroteenuse veakoodid

| Veakood | Veatekst                                 |
|---------|------------------------------------------|
| XSKA100 | System error                             |
| XSKA200 | X-road error {{code}} from SKA: {{text}} |

### Tehiku TK x-tee mikroteenuse veakoodid

| Veakood | Veatekst                                |
|---------|-----------------------------------------|
| XTK100  | System error                            |
| XTK200  | X-road error {{code}} from TK. {{text}} |

### Rahvastikuregistri x-tee teenuste veakoodid

| Veakood | Veatekst                                                      |
|---------|---------------------------------------------------------------|
| 10175   | ISIK EI OLE ÜHESELT TUVASTATAV, TÄPSUSTAGE PÄRINGU TINGIMUSI  |
| 10027   | Isik puudub RRis.                                             |
| 10035   | Päringu tingimustele vastab RRis rohkem kui üks isik.         |
| 10001   | Isikukoodi pikkus ei ole 11 sümbolit.                         |
| 10002   | Isikukoodis ei ole kõik sümbolid numbrid.                     |
| 10003   | Isikukood algab lubamatu sümboliga.                           |
| 10004   | Isikukoodis sisalduv sünnikuupäev on vigane.                  |
| 10005   | Isikukoodi kontrolljärk on vale.                              |
| 10900   | Päringutingimused on määratlemata.                            |
| 10022   | Kohustuslikud sisendparameetrid puuduvad.                     |
| L027    | Kontrollige isiku või kirje staatust.                         |
| L068    | Lubamatu suhte rolli liik.                                    |
| L069    | Lubamatu suhte staatus.                                       |
| L077    | Suhet RR-ist ei leitud.                                       |
| V10580  | Kasutajal pole kehtivat isikukoodi RR-is või vale masinkonto. |

### Tolli ja maksuameti TÖR registri x-tee teenuste veakoodid

| Veakood | Veatekst                                                           |
|---------|--------------------------------------------------------------------|
| 50      | Viga päringu töötlemisel.                                          |
| 51      | Päringus puuduvad sisendandmed                                     |
| 57      | Sisendandmetes puudub päringu tüüp.                                |
| 58      | Päringusse pole sisestatud kõiki vajaminevaid andmeid.             |
| 59      | Päringu tüübil "P" puudub algus või lõpukuupäev.                   |
| 60      | Päringu tüübil AM/TM puudub muutmise algus või lõpukuupäev         |
| 61      | Päringu tüübil PM puuduvad nõutud kuupäevad.                       |
| 63      | Päringu tüüp ei ole korrektne.                                     |
| 68      | Sisendandmetes puudub isikukood.                                   |
| 69      | Isikukoodi pikkus ei sobi                                          |
| 70      | Üldine viga, andmete laadimine andmebaasist ebaõnnestus            |
| 71      | Üldine viga, süsteemiparameetri laadimine andmebaasist ebaõnnestus |
| 100     | Sõnumi vastus sisaldab liiga palju kirjeid.                        |
