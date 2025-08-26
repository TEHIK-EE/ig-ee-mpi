Antud juhend selgitab põhireeglid patsiendi andmete pärimiseks ja sõnumite koostamiseks.

Testimiseks laadige alla Postman [kollektsiooni](MPI%20X-Road.postman_collection.json) näidetega ja häälestage keskkonna muutujad

```
X_ROAD_CLIENT: $env/$class/$org-code/$client-id
MPI_FHIR: $host/r1/$env/GOV/70009770/tis/mpi
AUTH_URL: $host/r1/$env/GOV/70009770/tis/auth
```

| Parameeter | Teie X-tee alamsüsteemi seadistus              |
|------------|------------------------------------------------|
| $env       | x-tee keskkond, näiteks ee-dev (xRoadInstance) |
| $host      | TTO turvaserveri aadress                       |
| $class     | TTO alamsüsteemi klass (memberClass)           |
| $org-code  | TTO asutuse registrikood (memberCode)          |
| $client-id | TTO alamsüsteemi kood  (subsystemCode)         |

### Ligipääsud

Kollektsiooni proovimiseks TTO peab tellima õigused X-tee teenustele GOV/70009770/tis/mpi ja GOV/70009770/tis/auth ee-dev keskkonnas.

### Autoriseerimine

Autoriseerimine on protsess, mille käigus kasutaja saab õigusi/privileege teatud ressursidele.
Autoriseerimise käigus valideeritakse kasutaja väidetav roll ning kuuluvus asutusele, mille alt tehakse päringuid.

**Token-is kodeeritud kasutaja isikukood ja nimi kasutatakse audit logides, mis kuvatakse ka patsiendile Andmejälgijas!**

#### Tokeni pärimine

Postman kollektsioonis 1. Auth -> 1.1 Get token

POST päring `{{AUTH_URL}}/v2/token` järgmise "application/json" sisuga

```json
{
  "user": {
    "personalCode": "49909090014"
  },
  "organization": "70009770",
  "role": "doctor",
  "application": "tto-tis-client-application"
}
```

Päringu kehas tuleb määrata kasutja roll, isikukood ja asutuse kood. Antud kombinatsioon valideeritakse TAM registri vastu.
Rakenduse nimi peab kajastama kasutatud TTO tarkvara, suvaline tekst ilma tühikudeta.

Vastus:

```json
{
  "accessToken": "eyJhbGciOiJSUz...",
  "expiresIn": 300,
  "tokenType": "Bearer"
}
```

**Detailne juhend on leitav [teabekeskusest](https://teabekeskus.tehik.ee/et/teenused/tis-teenused/tis-andmevahetus/autoriseerimise-teenus).**

#### Tokeni cache-mine

Tokeni eluiga on on N sekundit (token päringu vastuses väli expiresIn), kliendirakendus võib tokeni cache-da kuni N sekundit ja taaskasutada erinevates
päringutes.
**NB! Token on kasutajapõhine, kliendirakendus ei tohi jagada sama tokeni mitme erineva kasutaja vahel!**

#### Tokeni kasutamine

Tokeni tuleb kasutatada `Authorization` päises `Bearer ` prefiksiga. Näiteks

```
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiA....
```

#### API otspunkti õigused

Iga FHIR API otspunkt kontrollib õigusi, mis on rollipõhised. Rollide kohta saab
lugeda [siin](https://teabekeskus.tehik.ee/et/teenused/tis-teenused/tis-andmevahetus/autoriseerimise-teenuse-kasutajate-rollid).
Õiguste maatriks asub [siin](permissions.html).

### Päised (HTTP headers)

Igas päringus tuleb määrata REST päringu päises mitmed tunnused:

| Päise nimi    | Võimalikud väärtused                                                                    | Kommentaar                                                                                                                                                                           |   
|---------------|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Accept        | application/json või application/xml või application/fhir+json või application/fhir+xml |                                                                                                                                                                                      |   
| Content-Type  | application/json või application/xml või application/fhir+json või application/fhir+xml |                                                                                                                                                                                      |   
| Authorization | Bearer <token>                                                                          | Auth teenuse poolt saadud token                                                                                                                                                      |   
| x-road-id     |                                                                                         | Unikaalne päringu id                                                                                                                                                                 |    
| x-road-issue  |                                                                                         | Tekstiline selgitus miks antud päring on tehtud, teatud päringutel on kohustuslik. <br/>Tekst kuvatakse Andmejälgijas. Päis edastatakse alampäringute puhul teistesse süsteemidesse. |
| x-road-client | $env/$class/$org-code/$client-id                                                        | X-tee rest kliendi määrav identifikaator, vt https://www.x-tee.ee/docs/live/xroad/pr-rest_x-road_message_protocol_for_rest.html#43-use-of-http-headers                               |

### Andmete pärimine

Patsiendi andmete pärimiseks saab esitada REST päringu mis tagastab kas üksiku ressurssi või ressursside kollektsiooni (edaspidi *Bundle*).

#### Ressurss

Üksik ressurss tagastatakse siis kui andmed päritakse REST päringuga MPI sisemise id (viida) järgi:

```
GET {MPI}/Patient/1
Accept: application/json
...
```

Sõltuvalt Accept päringu väärtuses tuleb vastuseks sõnumi keha JSON või XML vormingus.
Näide sektsiooni andmetest minimaalse andmekoosseisuga:

```json
{
  "resourceType": "Patient",
  "id": "1",
  "meta": {
    "profile": [
      "https://hl7.ee/fhir/StructureDefinition/ee-mpi-patient-verified"
    ]
  },
  "identifier": [
    {
      "system": "https://fhir.ee/sid/pid/est/ni",
      "value": "37412251234"
    }
  ],
  "active": true,
  "name": [
    {
      "use": "official",
      "family": "Tamm",
      "given": [
        "Tiit",
        "Priit"
      ]
    }
  ],
  "gender": "male"
}
```

#### Otsing

Otsing teostatkse päringuga:

```
GET {MPI}/Patient?{params}
```

kus _{params}_ on otsingu parameetrite nimekiri koos väärtustega.

#### Toetatud otsinguparameetrid

| Parameeter               | Kirjeldus                                                                                                                                                      | Väärtustatud näidis                                                    |   
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| _id                      | Ressursi id.                                                                                                                                                   | _id=1234 või id=1234,5678                                              |
| _count                   | Mitu tulemust tagastada lehel, vaikimisi 20. Ülemine piir on 100.                                                                                              | _count=10                                                              |
| _page                    | Lehe number mida tagastada.                                                                                                                                    | _page=1                                                                |
| identifier               | Patsiendi identifikaator kujul "system\|value", eraldaja sümbol peab olema URL encode-itud.                                                                    | identifier=https://fhir.ee/sid/pid/est/ni%7C37412251234                |
| birthdate                | Sünnikuupäev (lubatud ainult eri õigusega). Toetatud komparaatorid: eq, ne, gt, ge, lt, le, sa, eb. Lubatud kasutada mitu parameetrit korraga (AND loogikaga). | birthdate=1974-12-25 või birthdate=gt1974-12-25&birthdate=le1975-12-25 |
| deceased                 | Kas patsient on surnud.                                                                                                                                        | deceased=true                                                          |
| active                   | Patsiendi kirje olek.                                                                                                                                          | active=false                                                           |
| external-system-presence | Patsiendi olemasolu välises infosüsteemis. Hetkel on lubatud ainult https://rahvastikuregister.ee väärtus. Ei saa kasutada üksikparameetrina.                  | external-system-presence=https://rahvastikuregister.ee                 |

#### Otsingu vastus

Patsiendi otsingu tulemusena tagastatakse [Bundle](https://www.hl7.org/fhir/bundle.html) (või teiste sõnadega "ümbrik"), mis võib sisaldada mitu ressurssi (
0..n). Järgnevas näites teostatakse otsing Eesti isikukoodi _37412251234_ järgi:

```
GET {MPI}/Patient?identifier=https://fhir.ee/sid/pid/est/ni|37412251234
```

Enne saatmist peab olema URL encode-itud vähemalt identifikaatori eraldaja sümbol "\|":

```
GET {MPI}/Patient?identifier=https://fhir.ee/sid/pid/est/ni%7C37412251234
```

Vastusena tuleb (searchset) Bundle mis tagastab meta informatsiooni päringu kohta (total, link) ja kollektsiooni (entry) ressursidest.

- **total** näitab mitu ressursi on kättesaadav antud otsigu kriteeriaga.
- **link** paging-u jaoks olulised viited, näiteks esimene leht, viimane, järgmine (next), kui olemas.

```json
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 2,
  "link": [
    {
      "relation": "self",
      "url": "{MPI}/Patient?identifier=https%3A%2F%2Ffhir.ee%2Fsid%2Fpid%2Fest%2Fni%7C37412251234&_page=1"
    },
    {
      "relation": "first",
      "url": "{MPI}/Patient?identifier=https%3A%2F%2Ffhir.ee%2Fsid%2Fpid%2Fest%2Fni%7C37412251234&_page=1"
    },
    {
      "relation": "last",
      "url": "{MPI}/Patient?identifier=https%3A%2F%2Ffhir.ee%2Fsid%2Fpid%2Fest%2Fni%7C37412251234&_page=1"
    }
  ],
  "entry": [
    {
      "fullUrl": "Patient/1",
      "resource": {
        "resourceType": "Patient",
        "id": "1",
        ...
      }
    },
    {
      "fullUrl": "Patient/2",
      "resource": {
        "resourceType": "Patient",
        "id": "2",
        ...
      }
    }
  ]
}                            
```

Terve andmekomplekti töötlemisel tuleb alati jälgida **next** linki olemasolu ja kasutada **_page** parameetri järgmiste lehtede laadimiseks.

Loe rohkem otsingu kohta [FHIR dokumentatsioonist](https://hl7.org/fhir/search.html).

#### Otsing identifikaatori järgi

Eesti isikukoodi (**https://fhir.ee/sid/pid/est/ni** süsteemiga) alusel otsides tagastatakse alati üks ressurss (Bundle, mis sisaldab ühte ressurssi).

Kui otsite välisriigi (või tundmatu) identifikaatori alusel, tuleb arvestada, et tulemus võib sisaldada mitut ressurssi,
kui otsing tehakse **riikliku identifikaatori süsteemiga või hierarhiliselt mitte-lõppsüsteemiga**.

- Patsiendi identifikaatorite hierarhiliselt lõppsüsteemid
  leiate [sellest loendist](https://ig.hl7.fhir.ee/ig-ee-terminology/ValueSet-patient-identifier-domain.html).
- Kõik riiklikud identifikaatorite süsteemid on toodud [kodisüsteemis](https://ig.hl7.fhir.ee/ig-ee-terminology/CodeSystem-identifier-domain.html)
  hierarhia tasemega 2.

Näiteks kui otsite `https://fhir.ee/sid/pid/fin|xxx-123` identifikaatori alusel, võite saada tulemuseks isikuid, kellel on Soome isikukood numbriga xxx-123 (
`https://fhir.ee/sid/pid/fin/ni|xxx-123`), aga ka neid, kellel on Soome pass numbriga xxx-123 (`https://fhir.ee/sid/pid/fin/ppn|xxx-123`).
Kui otsite ilma riigikoodita, näiteks `https://fhir.ee/sid/pid|xxx-123`, tagastatakse kõik patsiendid, kellel on identifikaatoriks `xxx-123`.

### Operatsioonid

Vaata [toetavate operatsioonide](operations.html) nimekirja.

#### Ressurssi ajalugu

Iga FHIR ressurssi muutmine loob ressursist uue versiooni. Varasemate versioonide nimekirja saamiseks kasutada päringut:

```
GET {MPI}/Patient/1/_history
```

Ühe kindla versiooni saab kätte päringuga:

```
GET {MPI}/Patient/1/_history/2
```

, kus 2 on versiooni number.

#### Muudatuste ajalugu

MPI pakub võimaluse pärida nimekirja muudetud patsientidest alates kindlast ajahetkest:

```
GET {MPI}/Patient/_history?_since=2023-03-31&_count=10
```

### Andmete muutmine

#### Üldised nõuded

Patsiendi andmete saatmiseks PEAB iga FHIR-i ressurss sisaldama ressursi tüüpi (“resourceType”) ja profiili (“meta.profile”).

```json
...
"resourceType" : "Patient",
"id": "1",
"meta": {
"profile": [
"https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient-verified"
]
}
...
```

Profiil on reeglite kogum, mis seotud kindla kasutusjuhuga. MPI toetab [tuvastatud](StructureDefinition-ee-mpi-patient-verified.html)
ja [tundmatu](StructureDefinition-ee-mpi-patient-unknown.html) patsiendi registreerimist.
Tulevikus võivad lisanduda [vastsündinu-](StructureDefinition-ee-mpi-patient-newborn.html)
ja [surnultsündinu-](StructureDefinition-ee-mpi-patient-stillborn.html) registreerimine.
Iga patsiendi lisamisel või muutmisel tuleb määrata vastav [profiil](patient.html#eempipatient).

#### Päring (request)

Patsiendi loomisel/muutmisel tuleb saata POST/PUT päringud.

```
POST {MPI}/Patient
PUT {MPI}/Patient/3
```

Valiidne sõnum tuleb edastada päringu kehas. Andmekoosseis on kirjeldatud lehel [Patsiendid](patient.html)

#### Vastus (response)

Eduka vastuse korral tagastab FHIR server HTTP koodi 20X. Näiteks uue patsiendi loomisel tagastatakse HTTP-kood = "201 Created".
Vastuse päis "Location" sisaldab lingi loodud ressursile ja versioonile. Ressursi loomisel versioon on alati 1, uuendamisel versiooni suurendatakse 1 võrra.

```
Location: {MPI}/fhir/Patient/3/_history/1
```

Vastuses kehas on tagastatud salvestatud või uuendatud ressurs. **NB! vastuse keha võib olla erinev saadetud kehast ja sisaldada parandatud andmeid, millega
arendaja peab arvestama!**

Loogilise vea puhul tuleb koodiga 40X viga. Juhul kui teenus ei ole kättesaadav, tuleb 50X viga.
Vead tagastatakse [OperationOutcome](http://hl7.org/fhir/operationoutcome.html) vormingus. Väli "code" sisaldab tüüpiliselt ühte
loogilistest [koodidest](errors.html).

#### Identifikaatorite lisamine

- Olemasolevale patsiendile saab lisada uusi identifikaatoreid, kuid olemasolevaid identifikaatoreid ei tohi eemaldada.
- Kui lisatav identifikaator on juba teisele patsiendile määratud, siis andmete muutmisel (PUT päringu korral) tuleb veateade koodiga `MPI-017`.
- Kui teil on kindlus et lisatav identifikaator siiski kuulub uuendatavale patsiendile ja tegemist on sama isikuga, siis tuleb kaks Patient ressursi omavahel
  siduda [link operatsiooniga](link.html).

#### Vastuse väljade piiramine

Vastuse väljade piiramiseks tuleb kasutada `_elements` [parameetri](https://hl7.org/fhir/search.html#elements).
Väärtuseks tuleb panna komaga eraldatud väljade nimed, mida soovitakse kätte saada.

Näidis päring:

```
GET /Patient/123?_elements=name.family,gender
```

Tagastab soovitud välajad ning alati ka kohustuslikud väljad nagu `id` ja `meta`:

```json
{
  "resourceType": "Patient",
  "id": "53552",
  "meta": {
    "lastUpdated": "2024-08-21T17:18:32.526+03:00",
    "profile": [
      "https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient-verified"
    ],
    "tag": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
        "code": "SUBSETTED",
        "display": "Resource encoded in summary mode"
      }
    ]
  },
  "name": [
    {
      "family": "Võsaülane"
    }
  ],
  "gender": "male"
}
```

### Aeg ja ajatsoon

Ressurside vastuvõtmisel MPI FHIR liides toetab ajad erinevates ajatsoonides, näiteks UTC `1974-12-25T23:00:00Z` või offset'iga `1974-12-26T01:00:00+02:00`.
Vaata formaati [spetsifikatsioonist](http://hl7.org/fhir/datatypes.html#dateTime).
Kui ajatsooni offset pole määratud, näiteks _date_ tüüpi puhul, siis arvestatakse et aeg on Eesti ajatsoonis ehk `Europe/Tallinn`. FHIR vastuses olevad ajad on
alati toodud Eesti ajatsoonis.
