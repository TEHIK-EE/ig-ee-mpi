Antud juhend selgitab põhireeglid patsiendi andmete pärimiseks ja sõnumite koostamiseks. 
Testimiseks laadige alla Postman [kollektsiooni](MPI_FHIR_examples.postman_collection.json) näidetega ja häälestage keskkonna muutujad
```
X_ROAD_CLIENT: ee-dev/GOV/70009770/tto-tis-klient
HOST: https://{$host}/r1/ee-dev/GOV/70009770/tis/mpi
```
, kus $host on turvaserveri aadress teie lokaalvõrgus. TEHIKu partnerid saavad kasutada hostina https://10.0.13.90/r1/ee-dev/GOV/70009770/tis/mpi aktiveeritud VPNi puhul.

### Andmete pärimine
Patsiendi andmete pärimiseks saab esitada REST päringu mis tagastab kas üksiku ressurssi või ressursside kollektsiooni (edaspidi *Bundle*).

#### Ressurss
Üksik ressurss tagastatakse siis kui andmed päritakse REST päringuga MPI sisemise id (viida) järgi:
```
GET {MPI}/Patient/1
Accept: application/json
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
Patsiendi otsingu tulemusena tagastatakse [Bundle](https://www.hl7.org/fhir/bundle.html) (või teiste sõnadega "ümbrik"), mis võib sisaldada mitu ressurssi (0..n). Järgnevas näites teostatakse otsing Eesti isikukoodi _37412251234_ järgi:
```
GET {MPI}/Patient?identifier=https://fhir.ee/sid/pid/est/ni|37412251234
```
Enne saatmist peavad kõik erisümbolid olema encode-itud:
```
GET {MPI}/Patient?identifier=https%3A%2F%2Ffhir.ee%2Fsid%2Fpid%2Fest%2Fni%7C37412251234
```
Vastusena tuleb (searchset) Bundle mis tagastab metainformatsiooni päringu kohta ja kollektsiooni kahest ressursist (kust eemaldatud patsiendi ressursi sisuline osa):
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

#### Otsing identifikaatori järgi
MPI toetab otsinguid [identifikaatori](identifiers.html) järgi.

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
Uue kirje loomisel saab anda kaasa oma infosüsteemi sisemise identifikaatori (“meta.source”).
```json
  "resourceType": "Patient",
  "meta": {
    "profile": [
      "https://fhir.ee/StructureDefinition/ee-mpi-patient-verified"
    ],
    "source": "https://my.his.ee/Patient/92837-fdsvsd-3f4gfew-2342dwd" 
  },
  "id": "1"
```

Profiil on reeglite kogum, mis seotud kindla kasutusjuhuga. MPI toetab [tuvastatud](StructureDefinition-ee-mpi-patient-verified.html) ja [tundmatu](StructureDefinition-ee-mpi-patient-unknown.html) patsiendi registreerimist. Tulevikus võivad lisanduda [vastsündinu-](StructureDefinition-ee-mpi-patient-newborn.html) ja [surnultsündinu-](StructureDefinition-ee-mpi-patient-stillborn.html) registreerimine.
Iga patsiendi lisamisel või muutmisel tuleb määrata vastav profiil.

#### Päring (request)
Patsiendi loomisel/muutmisel tuleb saata päring FHIR-i endpointile, näiteks arenduskeskkonnas aadressile: https://tis.dev.tehik.ee/mpi/fhir/Patient. 
Päringus tuleb määrata REST päringu päises (Header-is) mitmed tunnused:
- päringu keha vormingu määramiseks (päis "Accept" väärtustega "application/json" või application/xml või "application/fhir+json" või application/fhir+xml)
- vastuse keha vormingu määramiseks (päis "Content-Type" väärtustega "application/json" või application/xml või "application/fhir+json" või application/fhir+xml)
- autentimine (päis "Authorization" mille sisu kirjeldatud lehel [Autentimine](auth.html))
- unikaalne päringu id (päis "x-road-id"). 
- selgitada miks antud päring on tehtud (päis "x-road-issue"). Tunnust kasutatakse Andmejälgijas. Päis edastatakse alampäringute puhul teistesse süsteemidesse.
- loogilise transaktsiooni tunnus (päis "x-transaction-id" FIXME). Päis edastatakse alampäringute puhul teistesse süsteemidesse.
- valiidne sõnum tuleb edastada päringu kehas. Andmekoosseis on kirjeldatud lehel [Patsiendid](patient.html)


#### Vastus (response)
Eduka vastuse korral tagastab FHIR server HTTP koodi 20X. Näiteks uue patsiendi loomisel tagastatakse HTTP-kood = "201 Created".
Vastuse päis "Location" sisaldab lingi loodud ressursile.
```
Location: {MPI}/fhir/Patient/3
```
Vaikimisi loodud ressursi kehat ei tagastata. Vajadusel saate muuta vaikekäitumist määrates päises "[Prefer](http://hl7.org/fhir/http.html#ops)".
Loogilise vea puhul tuleb koodiga 40X viga. Juhul kui teenus ei ole kättesaadav, tuleb 50X viga. 
Vead tagastatakse [OperationOutcome](http://hl7.org/fhir/operationoutcome.html) vormingus. Väli "code" sisaldab tüüpiliselt ühte loogilistest [koodidest](errors.html).

#### Aeg ja ajatsoon
Ressurside vastuvõtmisel MPI FHIR liides toetab ajad erinevates ajatsoonides, näiteks UTC `1974-12-25T23:00:00Z` või offset'iga `1974-12-26T01:00:00+02:00`. Vaata formaati [spetsifikatsioonist](http://hl7.org/fhir/datatypes.html#dateTime).
Kui ajatsooni offset pole määratud, näiteks _date_ tüüpi puhul, siis arvestatakse et aeg on Eesti ajatsoonis ehk `Europe/Tallinn`. FHIR vastuses olevad ajad on alati toodud Eesti ajatsoonis.


