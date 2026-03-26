#### Kohustuslik põhjendus
Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

#### Näited
Näide päringust:
```
GET {MPI}/Patient/$disability?patient=Patient/7073

GET {MPI}/Patient/$disability?patient.identifier=https://fhir.ee/sid/pid/est/ni|37408074944

GET {MPI}/Patient/$disability?patient.identifier=37408074944
```

ning saab vastuseks on [Disability](StructureDefinition-ee-mpi-socialhistory-disability.html) Observationi

```json
{
  "resourceType": "Bundle",
  "type": "collection",
  "entry": [
    {
      "resource": {
        "resourceType": "Observation",
        "meta": {
          "versionId": "1",
          "profile": [
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-disability"
          ]
        },
        "status": "final",
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                "code": "social-history",
                "display": "Social history"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "95377-8",
              "display": "Disability type"
            }
          ]
        },
        "subject": {
          "reference": "Patient/7073"
        },
        "effectivePeriod": {
          "start": "2024-02-29T00:00:00+02:00",
          "end": "2027-02-27T00:00:00+02:00"
        },
        "issued": "2026-01-23T10:03:48.782+02:00",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/puude-raskusaste",
              "code": "SYGAV_PUUE",
              "display": "sügav puue"
            }
          ]
        }
      }
    }
  ]
}
```