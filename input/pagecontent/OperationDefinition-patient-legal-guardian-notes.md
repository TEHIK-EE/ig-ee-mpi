#### Kohustuslik põhjendus
Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

#### Näited
Näide eestkostjate leidmiseks:

```
GET {MPI}/Patient/$legal-guardian?patient=Patient/168&legal-status=365569001

GET {MPI}/Patient/$legal-guardian?patient.identifier=https://fhir.ee/sid/pid/est/ni|37408074944&legal-status=365569001

GET {MPI}/Patient/$legal-guardian?patient.identifier=37408074944&legal-status=365569001
```

ning saab vastuseks Observationi:

```json
{
  "resourceType": "Bundle",
  "type": "collection",
  "entry": [
    {
      "resource": {
        "resourceType": "Observation",
        "meta": {
          "profile": [
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-legal-guardian-status"
          ]
        },
        "contained": [
          {
            "resourceType": "RelatedPerson",
            "id": "a8725be4-e78d-427a-883f-d540b97bae55",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "52009010061"
              }
            ],
            "relationship": [
              {
                "coding": [
                  {
                    "system": "http://terminology.hl7.org/CodeSystem/v3-RoleClass",
                    "code": "DEPEN",
                    "display": "Dependent"
                  }
                ]
              }
            ],
            "name": [
              {
                "family": "KIVI",
                "given": [
                  "ALBERT"
                ]
              }
            ]
          }
        ],
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
              "code": "58626002",
              "display": "Legal guardian status"
            }
          ]
        },
        "subject": {
          "reference": "Patient/168"
        },
        "effectivePeriod": {
          "start": "2020-09-28T00:00:00+03:00"
        },
        "issued": "2024-06-11T15:25:10.148+03:00",
        "performer": [
          {
            "reference": "#a8725be4-e78d-427a-883f-d540b97bae55"
          }
        ],
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "365569001",
              "display": "Finding of wardship"
            }
          ]
        }
      }
    }
  ]
}
```