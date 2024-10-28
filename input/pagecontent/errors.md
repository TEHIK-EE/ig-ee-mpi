## Vead

API tagastab vead [OperationOutcome](https://hl7.org/fhir/R5/operationoutcome.html) ressursina mille sees võib olla mitu `issue` elementi koos vigadega.
Vead võivad olla kas ainult patsiendi registri omad või sisaldada ka peegeldatud vead teistest teenustest.

Näide `OperationOutcome`-ist, mis kuvab peegeldatud vead:

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

Allpool on toodud veakoodid tektsidega erinevatest süsteemides. Oluline meeles pidada, et mitte kõik veakoodid võivad lõppkasutajani jõuda.

### Patsiendi registri veakoodid

| Veakood    | Veatekst                                                                                                                                                |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| MPI-001    | Juhtus MPI sisemine viga                                                                                                                                |
| MPI-002    | Patsiendi indeksi krüpteerimise viga                                                                                                                    |
| MPI-003    | Patsiendi indeksi dekrüpteerimise viga                                                                                                                  |
| MPI-004    | Patsiendi indeksi HMAC arvutamise viga                                                                                                                  |
| MPI-005    | Sekundaarne HSM võti on kohustuslik selleks, et andmeid saaks uuesti krüpteerida                                                                        |
| MPI-006    | Patsiendi indeks on ebakonsistentne, on leitud duplikaate {system, value} paariga                                                                       |
| MPI-007    | XML'i parsimine on ebaõnnestunud                                                                                                                        |
| MPI-008    | Tundmatu telekomi süsteem: ${system}, lubatud väärtused: ${allowed}                                                                                     |
| MPI-009    | Tundmatu riigi kood ${code}                                                                                                                             |
| MPI-010    | Padsiendi loomine ei ole võimalik, patsient sama identifikaatoriga juba eksisteerib                                                                     |
| MPI-011    | Lubamatu aadressi tüüp: ${type}, lubatud väärtused: ${allowed}                                                                                          |
| MPI-012    | Lubamatu aadressi kasutus: ${use}, lubatud väärtused: ${allowed}                                                                                        |
| MPI-013    | Tundmatu telekomi kasutus: ${use}, lubatud väärtused: ${allowed}                                                                                        |
| MPI-015    | Antud otsingu parameetrid ei sobi või puuduvad                                                                                                          |
| MPI-016    | Patsiendil peab olema vähemalt üks identifikaator                                                                                                       |
| MPI-017    | Antud identifikaatoritega leiab mitu erinevat patsienti, salvestamine ei ole võimalik                                                                   |
| MPI-018    | Tundmatu patsiendi kontaktisiku liik ${code}                                                                                                            |
| MPI-019    | Aadressil puudub riigi kood                                                                                                                             |
| MPI-020    | Patsiendi puuete info pärimine ebaõnnestus                                                                                                              |
| MPI-021    | Patsienti ei leitud                                                                                                                                     |
| MPI-022    | Patsiendi isikukoodi ei leitud                                                                                                                          |
| MPI-023    | FHIR profiil ${profile} pole lubatud või toetatud                                                                                                       |
| MPI-024    | FHIR profiil on puudu                                                                                                                                   |
| MPI-025    | Tundmatu identifikaatori süsteem ${system}                                                                                                              |
| MPI-025-01 | Identifikaatori süsteem ${system} ei vasta reeglitele. Peab algama 'urn:oid', 'https:' või 'http:' prefiksiga                                           |
| MPI-026    | Telekomi väärtus ${value} ei vasta validatsiooni reeglitele                                                                                             |
| MPI-027    | Leitud liiga palju tulemusi, palun laiendage otsingu kriteeria                                                                                          |
| MPI-028    | Päringus puudub autori isikukood (x-road-userid)                                                                                                        |
| MPI-029    | Kommunikatsiooniviga Rahvastikuregistriga                                                                                                               |
| MPI-031    | Kommunikatsiooniviga ADS teenusega                                                                                                                      |
| MPI-032    | Päringus puudub päis 'x-road-issue'                                                                                                                     |
| MPI-033    | Päringus puudub autori asutuse registri kood                                                                                                            |
| MPI-034    | Perekonnaseisu salvestamine ei õnnestunud, patsient ja teine isik suhtes ei ole omavahel seotud                                                         |
| MPI-035    | Patsientide sidumine ebaõnnestus: primaarse patsiendi kirje staatus peab olema aktiivne                                                                 |
| MPI-036    | Patsientide sidumine ebaõnnestus: sekundaarne patsiend on juba teise patsiendiga seotud                                                                 |
| MPI-037    | Patsientide lahti sidumine ebaõnnestus: sekundaarne patsient on juba aktiivne                                                                           |
| MPI-038    | Patsientide lahti sidumine ebaõnnestus: antud patsiendid pole seotud                                                                                    |
| MPI-039    | Ei saanud teavitada WM teenust patsientide sidumise kohta                                                                                               |
| MPI-040    | Integratsiooniviga xroad-tor teenusega                                                                                                                  |
| MPI-041    | Antud patsiendil juba eksisteerib kontaktisik sama identifikaatoriga ja seosega                                                                         |
| MPI-042    | Patsiendil ei saa olla rohkem kui ${max} kontaktisikut                                                                                                  |
| MPI-043    | Integratsiooniviga xroad-tk teenusega                                                                                                                   |
| MPI-044    | Päringus puudub autori roll                                                                                                                             |
| MPI-045    | Parameeteriga ${param} antud identifikaatori järgi ei ole patsienti leitud                                                                              |
| MPI-046    | Mitu patsiendi kirjet on leitud parameetriga ${param}                                                                                                   |
| MPI-047    | legal-status parameeter on kohustuslik                                                                                                                  |
| MPI-048    | Lubamatu legal-status parameetri väärtus                                                                                                                |
| MPI-049    | Patsiendil juba eksisteerib aadress: ${addressText}                                                                                                     |
| MPI-050    | Eesti isikukoodiga Patient ressursi pole lubatud luua POST /Patient päringuga, palun kasutage /Patient/$lookup operatsiooni Rahvastikuregistri allikaga |
| MPI-051    | Aadress ADR-ID-ga ${adr-id} ei ole leitud ADS-ist                                                                                                       |
| MPI-052    | Ligipääs soovitud andmetele pole antud patsiendile lubatud                                                                                              |
| MPI-053    | Aadress ADS-OID-ga ${ads-oid} ei ole leitud ADS-ist                                                                                                     |
| MPI-054    | Aadress ADS-OID-ga ${ads-oid} ja ADR-ID-ga ${adr-id} ei ole leitud ADS-ist                                                                              |
| MPI-055    | Antud aadressi ADS-OID-ga ${ads-oid} leiab mitu paralleelaadressit, oodatud ka ADR-ID väärtus                                                           |
| MPI-057    | Antud teksti (${text}) järgi pole võimalik otsida aadressi ADS registrist                                                                               |
| MPI-058    | Antud teksti (${text}) järgi pole leitud ühtegi aadressi ADS registrist                                                                                 |
| MPI-059    | Antud teksti (${text}) järgi pole võimalik leida unkaalne aadress ADS registrist                                                                        |
| MPI-060    | Päringus puudub päis 'x-road-userid'                                                                                                                    |
| MPI-061    | Päringus puudub päis 'x-road-id'                                                                                                                        |
| MPI-070    | Dokumendi numbriga identifikaatorile ${id-system}&#124;${id-value} on kohustulik määrata ka isikukood süsteemiga ${required}                            |
| MPI-071    | Eesti isikukoodiga patsiendil ei saa muuta: surmakuupäeva, sünnikuupäeva, soo, nime                                                                     |
| MPI-072    | Patient ressurss id-ga ${id} ei leitud                                                                                                                  |
| MPI-073    | RelatedPerson ressurss id-ga ${id} ei leitud                                                                                                            |
| MPI-074    | Observation ressurss id-ga ${id} ei leitud                                                                                                              |
| MPI-075    | Otsingu parameetril '${param}' on lubatud ainult üks väärtus                                                                                            |
| MPI-076    | 'birthdate' parameetril on vale ajaformaat, lubatud formaat: YYYY-MM-DD                                                                                 |
| MPI-077    | Tundmatu 'source' väärtus                                                                                                                               |
| MPI-078    | Puudub kohustuslik '${param}' parameeter                                                                                                                |
| MPI-079    | Ajalookirjet ei leitud                                                                                                                                  |
| MPI-081    | Aadressiobjektiga on seotud mitu hooneosa                                                                                                               |
| MPI-082    | Aadressil puudub tase 6 või 7                                                                                                                           |
| MPI-086    | Aadressiobjektil puudub UN tunnus                                                                                                                       |
| MPI-087    | Aadress on tehniline                                                                                                                                    |
| MPI-088    | MR tüübiga aadressiobjekti kasutamine ei ole soovitatav                                                                                                 |
| MPI-089    | Antud isikukoodiga isik puudub RR-is                                                                                                                    |
| MPI-090    | Antud isikukood ei ole korrektne                                                                                                                        |
| MPI-091    | Päringu autori isikukoodiga isik puudub RR-is                                                                                                           |
| MPI-092    | Teovõime koodisüsteemi tundmatu kood: ${code}                                                                                                           |
| MPI-093    | Tundmatud keelte kodisüsteem ${codeSystem}                                                                                                              |
| MPI-094    | Tundmatu sugu ${code}                                                                                                                                   |
| MPI-100    | Tundmatu taustatöö tüüp ${type}                                                                                                                         |
| MPI-400    | FHIR serveri üldine viga                                                                                                                                |
| MPI-403    | ${interaction} pole lubatud                                                                                                                             |

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
