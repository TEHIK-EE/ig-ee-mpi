#### Kohustuslik põhjendus
Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu. 

#### Näited
```
GET {MPI}/Patient/$incapacity-for-work?patient=Patient/7076

GET {MPI}/Patient/$incapacity-for-work?patient.identifier=https://fhir.ee/sid/pid/est/ni|37408074944

GET {MPI}/Patient/$incapacity-for-work?patient.identifier=37408074944
```

ning saab vastuseks on [IncapacityForWork](StructureDefinition-ee-mpi-socialhistory-incapacity-for-work.html) Observationi

Operatsioon leiab alati hetkel kehtiva otsuse.

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
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-incapacity-for-work"
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
              "code": "301707001",
              "display": "Ability to perform occupation and employment activities"
            }
          ]
        },
        "subject": {
          "reference": "Patient/6230"
        },
        "effectivePeriod": {
          "start": "2020-09-14T00:00:00+03:00",
          "end": "2023-09-13T00:00:00+03:00"
        },
        "issued": "2026-01-23T10:04:54.715+02:00",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/toovoime-liik",
              "code": "Puudub",
              "display": "Puuduv töövõime"
            }
          ]
        }
      }
    }
  ]
}
```