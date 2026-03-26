#### Kohustuslik põhjendus
Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu. 

#### Näited
Näide päringust:


- patient - [patsiendi identifikaator](operations.html#patsienti-identifikaatorid-operatsioonipäringutes)
- guardian-only - kas tagastada ainult eestkostetavad (true). Saab määrata ainult alaealistele patsientidele. Vaikimisi väärtus on false.

```
GET {MPI}/Patient/$power-of-attorney?patient=Patient/70505&guardian-only=false

GET {MPI}/Patient/$power-of-attorney?patient.identifier=https://fhir.ee/sid/pid/est/ni|37408074944&guardian-only=false

GET {MPI}/Patient/$power-of-attorney?patient.identifier=37408074944&guardian-only=false
```

ning saab vastuseks on mitu Observation ressursi (samal isikul võib olla mitu hooldusõiguise liiki):

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
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-power-of-attorney"
          ]
        },
        "contained": [
          {
            "resourceType": "RelatedPerson",
            "id": "b5c7e30f-16c2-4d16-91a1-28d8778e8ad5",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "52009010061"
              }
            ],
            "patient": {
              "reference": "Patient/7050"
            },
            "relationship": [
              {
                "coding": [
                  {
                    "system": "http://terminology.hl7.org/CodeSystem/v3-RoleClass",
                    "code": "DEPEN",
                    "display": "Eestkostetav"
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
              "code": "186063005",
              "display": "Power of attorney"
            }
          ]
        },
        "subject": {
          "reference": "Patient/7050"
        },
        "effectivePeriod": {
          "start": "2020-09-28T00:00:00+03:00"
        },
        "issued": "2026-01-23T10:05:30.926+02:00",
        "performer": [
          {
            "reference": "#b5c7e30f-16c2-4d16-91a1-28d8778e8ad5"
          }
        ],
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/hooldusoiguse-liik",
              "code": "H10",
              "display": "Täielik isikuhooldusõigus"
            }
          ]
        }
      }
    },
    {
      "resource": {
        "resourceType": "Observation",
        "meta": {
          "profile": [
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-power-of-attorney"
          ]
        },
        "contained": [
          {
            "resourceType": "RelatedPerson",
            "id": "0c9772a4-fcaa-47e2-a606-670a2f3addf1",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "52009010061"
              }
            ],
            "patient": {
              "reference": "Patient/7050"
            },
            "relationship": [
              {
                "coding": [
                  {
                    "system": "http://terminology.hl7.org/CodeSystem/v3-RoleClass",
                    "code": "DEPEN",
                    "display": "Eestkostetav"
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
              "code": "186063005",
              "display": "Power of attorney"
            }
          ]
        },
        "subject": {
          "reference": "Patient/7050"
        },
        "effectivePeriod": {
          "start": "2020-09-28T00:00:00+03:00"
        },
        "issued": "2026-01-23T10:05:30.927+02:00",
        "performer": [
          {
            "reference": "#0c9772a4-fcaa-47e2-a606-670a2f3addf1"
          }
        ],
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/hooldusoiguse-liik",
              "code": "H20",
              "display": "Täielik varahooldusõigus"
            }
          ]
        }
      }
    }
  ]
}
```