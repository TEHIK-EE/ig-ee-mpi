Sellel lehel kirjeldatud võimalikud olukorrad ja näited.

### UC-01 Eesti patsient
Vastuvõtule tuleb patsient, kes tuvastab end Eesti dokumendiga. 
Kasutada Eesti isikukood.

Näide:
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

### UC-02 Välisriigi patsient
Vastuvõtule tuleb patsient, kes tuvastab end teise riigi dokumendiga. 
- Eelistada välisriigi isiku identifikaatori (nt isikukood);
- Eelistada dokumentidest passi;
  - passi puudumisel veenduda, et antud dokument on toetatud dokumentide hulgas (vaata loendit [Patsiendi identifikaatorite domeen](https://akk.tehik.ee/classifier/resources/value-sets/patsiendi-identifikaatorite-domeen/summary));
- Kasutada dokumendi numbrit ja vastavat identifitseerimissüsteemi patsiendi identifitseerimiseks.

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

### UC-03 Patsient dokumendita
Vastuvõtule saabub patsient, keda ei suudata identifitseerida või tema antud dokumendi liik ei kuulu toetatavate hulka. Patsienti tuleb registreerida tundmatu patsiendina.
Soovituslikult võiks katsiendi registreerimisele eelneda MRN numbri päring.

Näide MRN numbri päringust:
```
POST /Patient/$mrn
```
Näide vastusest:
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

Näide tundmatu patsiendi registreerimisest:
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

