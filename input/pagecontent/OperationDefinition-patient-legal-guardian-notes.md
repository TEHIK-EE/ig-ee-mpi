#### Kohustuslik põhjendus
Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

#### Vahemälu (cache)

Seosed päritakse Rahvastikuregistrist ja salvestatakse MPI andmebaasi. Vaikimisi tagastab MPI salvestatud andmed. Rahvastikuregistrisse tehakse päring ainult siis, kui patsiendi seoseid ei ole sealt veel kordagi päritud.

Värskete andmete saamiseks:

- parameeter `nocache=true` või päis `Cache-Control: no-cache`: MPI teeb alati uue päringu Rahvastikuregistrisse;
- päis `Cache-Control: max-age=N`: MPI teeb uue päringu, kui andmed on Rahvastikuregistrist päritud rohkem kui N sekundit tagasi.

Kasuta neid, kui on oluline saada Rahvastikuregistrist kõige värskemad andmed, nt kui andmed võivad olla hiljuti muutunud.

#### Vastus

Iga eestkoste seose kohta tagastatakse eraldi [Observation](StructureDefinition-ee-mpi-socialhistory-legal-guardian-status.html).
Parameeter `legal-status` määrab päringu suuna:

| Element | `legal-status=58626002` (patsiendi eestkostjad) | `legal-status=365569001` (patsiendi eestkostetavad) |
|---|---|---|
| `code` | SNOMED CT 58626002 | SNOMED CT 58626002 |
| `subject` | päringus antud patsient | päringus antud patsient |
| `performer` | eestkostja: contained RelatedPerson (`relationship` = GUARD, koos telefoninumbritega) või asutus, nt KOV (contained Organization) | eestkostetav: contained RelatedPerson (`relationship` = DEPEN) |
| `value` | 58626002 „Legal guardian“ – performer on patsiendi eestkostja | 365569001 „Finding of wardship“ – performer on patsiendi eestkostetav |

`value` kirjeldab alati performeri rolli patsiendi suhtes, mitte patsiendi rolli.

#### Näited
Näide patsiendi eestkostjate leidmiseks:

```
GET {MPI}/Patient/$legal-guardian?patient=Patient/168&legal-status=58626002

GET {MPI}/Patient/$legal-guardian?patient.identifier=https://fhir.ee/sid/pid/est/ni|37408074944&legal-status=58626002

GET {MPI}/Patient/$legal-guardian?patient.identifier=37408074944&legal-status=58626002
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
            "id": "0b6f4e0e-3c1a-4d5e-9a0e-2f7c8d1b6a42",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "48501212711"
              }
            ],
            "patient": {
              "reference": "Patient/168"
            },
            "relationship": [
              {
                "coding": [
                  {
                    "system": "http://terminology.hl7.org/CodeSystem/v3-RoleClass",
                    "code": "GUARD",
                    "display": "Eestkostja"
                  }
                ]
              }
            ],
            "name": [
              {
                "family": "KASK",
                "given": [
                  "MARI"
                ]
              }
            ],
            "telecom": [
              {
                "system": "phone",
                "value": "+37251234567"
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
          "start": "2021-11-23T00:00:00+02:00"
        },
        "issued": "2024-06-11T15:25:10.148+03:00",
        "performer": [
          {
            "reference": "#0b6f4e0e-3c1a-4d5e-9a0e-2f7c8d1b6a42"
          }
        ],
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "58626002",
              "display": "Legal guardian"
            }
          ]
        }
      }
    }
  ]
}
```

Kui eestkostja on asutus (nt kohalik omavalitsus), on performer contained Organization:

```json
"contained": [
  {
    "resourceType": "Organization",
    "id": "6d2b9a51-8f3e-4c7a-b1d4-0e9f2a7c5b13",
    "meta": {
      "profile": [
        "https://fhir.ee/base/StructureDefinition/ee-organization"
      ]
    },
    "identifier": [
      {
        "system": "https://fhir.ee/sid/org/est/br",
        "value": "75018816"
      }
    ],
    "active": true,
    "name": "Anija Vallavalitsus"
  }
]
```

Näide patsiendi eestkostetavate leidmiseks:

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
            "patient": {
              "reference": "Patient/168"
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
