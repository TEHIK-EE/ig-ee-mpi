Sellel lehel kirjeldatud võimalikud olukorrad ja soovitused nende lahendamiseks.

### UC-01 Patsient Eesti dokumendiga
Juhul kui vastuvõtule tuleb patsient kes suudab tuvastada ennast Eesti dokumendiga patsiendi tuvastamiseks tuleb kasutada Eesti isikukood.

Näide patsiendist Eesti isikukoodiga:
```json
{
    "resourceType": "Patient",
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
                "Tiit Priit"
            ]
        }
    ],
    "gender": "male"
}
```

### UC-02 Patsient teiese riigi dokumendiga
Juhul kui vastuvõtule tuleb patsient kes suudab tuvastada ennast teise riigi dokumendiga siis tuleb:
- tuleb eelistada välisriigi isiku identifikaatori (a la isikukoodi);
- dokumentidest tuleb eelistada passi;
- kui passi pole siis tuleb veenduda, et antud dokument on toetatud dokumentide hulgas (vaata loendi [Patsiendi identifikaatorite domeen](https://akk.tehik.ee/classifier/resources/value-sets/patsiendi-identifikaatorite-domeen/summary));
- tuleb kasutada dokumendi numbri ja vastava identifitseerimissüsteemi patsiendi identifitseerimiseks.

Näide patsiendist Saksamaa passiga:
```json
{
    "resourceType": "Patient",
    "meta": {
        "profile": [
            "https://hl7.ee/fhir/StructureDefinition/ee-mpi-patient-verified"
        ]
    },
    "identifier": [
        {
            "system": "https://fhir.ee/sid/pid/deu/ppn",
            "value": "C01X00T47"
        }
    ],
    "name": [
        {
            "use": "official",
            "text": "Gabler",
            "given": [
                "Erika"
            ]
        }
    ],
    "gender": "female"
}
```

### UC-03 Patsient ilma dokumendita
Juhul kui vastuvõtule tuleb patsient kes ei suuda tõestada enda identiteedi või dokumendi liik ei kuulu toetatavate hulka siis antud patsiendi tuleb registreerida tundmatu patsiendina.
Patsiendi registreerimisele võiks eelneda MRN numbri päring.

Näide MRN numbri päringust:
```
POST /Patient/$mrn
```
ja vastusest
```json
{
    "resourceType": "Parameters",
    "parameter": [
        {
            "name": "return",
            "valueIdentifier": {
                "system": "https://fhir.ee/sid/pid/est/mr",
                "value": "5adcc2ca-f231-445c-a7e5-76eb11625e68"
            }
        }
    ]
} 
```

Ning näide tundmatu patsiendi registreemisest:
```json
{
    "resourceType": "Patient",
    "meta": {
        "profile": [
            "https://hl7.ee/fhir/StructureDefinition/ee-mpi-patient-unknown"
        ]
    },
    "identifier": [
        {
            "system": "https://fhir.ee/sid/pid/est/mr",
            "value": "5adcc2ca-f231-445c-a7e5-76eb11625e68"
        }
    ],
    "name": [
        {
            "use": "nickname",
            "text": "Epp Kai"
        }
    ],
    "gender": "female"
}
```

