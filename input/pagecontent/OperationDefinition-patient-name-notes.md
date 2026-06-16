#### Kohustuslik põhjendus
Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

#### Näited
Näide päringust:
```
GET {MPI}/Patient/$name?patient=Patient/874

GET {MPI}/Patient/$name?patient.identifier=https://fhir.ee/sid/pid/est/ni|37408074944

GET {MPI}/Patient/$name?patient.identifier=37408074944
```

ning saab vastuseks on [Name](StructureDefinition-ee-mpi-patient-name-parameters.html) Parameteri

```json
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "name",
      "valueHumanName": {
        "use": "official",
        "family": "CASK",
        "given": [
          "CATY"
        ]
      }
    }
  ]
}
```