#### Kohustuslik põhjendus

Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

### Päring

`GET [base]/Patient/$legal-relationship?{parameters}`

#### Päringu parameetrite lisa-kirjeldus
- `relationship-type` - suhte tüüp, mille kohta soovitakse märkusi pärida. Lubatud väärtused
  valueset-ist: https://fhir.ee/ValueSet/isiku-suhte-tyybid-hl7-ja-snomed
    - Näide: `http://terminology.hl7.org/CodeSystem/v3-RoleClass|GUARD` või `http://snomed.info/sct|127848009`
    - Ei ole lubatud määrata ilma koodisüsteemita.
- `custody-type` - hooldusõiguse liik isikute vahel mida soovitakse pärida. Lubatud väärtused valueset-ist: https://fhir.ee/ValueSet/hooldusoiguse-liik
    - Näide: `H20` (täielik isikuhooldusõigus)
    - Lubatud määrata ilma koodisüsteemita.

Sama parameeter võib esineda mitu korda (rakendatud OR loogika).

#### Näited

Näide päringust, kus soovime leida kõiki isikuid, kellega patsiendil on kas GUARD tüüpi suhe või 67822003 tüüpi suhe ning kellel on H20 või H10 tüüpi hooldusõigus:

```Patient/$legal-relationship?relationship-type=http://terminology.hl7.org/CodeSystem/v3-RoleClass%7CGUARD&relationship-type=http://snomed.info/sct%7C67822003&custody-type=H20&custody-type=H10&patient=Patient/1789933 ```


Näide vastusest:

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
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-legal-relationship"
          ]
        },
        "contained": [
          {
            "resourceType": "RelatedPerson",
            "id": "3ffbb9c2-064b-43d3-8b15-d512a743ead2",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "62308290024"
              }
            ],
            "patient": {
              "reference": "Patient/1789933"
            },
            "relationship": [
              {
                "coding": [
                  {
                    "system": "http://snomed.info/sct",
                    "code": "67822003",
                    "display": "Laps"
                  }
                ]
              }
            ],
            "name": [
              {
                "family": "KARUMÕMM",
                "given": [
                  "KATI"
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
              "code": "125676002",
              "display": "Person"
            }
          ]
        },
        "subject": {
          "reference": "Patient/1789933"
        },
        "issued": "2026-03-18T12:48:40.304+02:00",
        "performer": [
          {
            "reference": "#3ffbb9c2-064b-43d3-8b15-d512a743ead2"
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
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-legal-relationship"
          ]
        },
        "contained": [
          {
            "resourceType": "RelatedPerson",
            "id": "5b8723fb-e4bd-4293-b123-7723b85cd14b",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "62308290024"
              }
            ],
            "patient": {
              "reference": "Patient/1789933"
            },
            "relationship": [
              {
                "coding": [
                  {
                    "system": "http://snomed.info/sct",
                    "code": "67822003",
                    "display": "Laps"
                  }
                ]
              }
            ],
            "name": [
              {
                "family": "KARUMÕMM",
                "given": [
                  "KATI"
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
              "code": "125676002",
              "display": "Person"
            }
          ]
        },
        "subject": {
          "reference": "Patient/1789933"
        },
        "issued": "2026-03-18T12:48:40.304+02:00",
        "performer": [
          {
            "reference": "#5b8723fb-e4bd-4293-b123-7723b85cd14b"
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
