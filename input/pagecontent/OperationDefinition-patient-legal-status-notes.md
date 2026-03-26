#### Kohustuslik põhjendus
Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

#### Näited
Näide päringust:
```
GET {MPI}/Patient/$legal-status?patient=Patient/874

GET {MPI}/Patient/$legal-status?patient.identifier=https://fhir.ee/sid/pid/est/ni|37408074944

GET {MPI}/Patient/$legal-status?patient.identifier=37408074944
```

ning saab vastuseks on [LegalStatus](StructureDefinition-ee-mpi-socialhistory-legal-status.html) Observationi

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
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-legal-status"
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
              "system": "http://snomed.info/sct",
              "code": "8625004",
              "display": "Legal status"
            }
          ]
        },
        "subject": {
          "reference": "Patient/14459"
        },
        "issued": "2026-01-23T10:04:24.472+02:00",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/teovoime-staatus",
              "code": "T2",
              "display": "Teovõimetu"
            }
          ]
        }
      }
    }
  ]
}
```