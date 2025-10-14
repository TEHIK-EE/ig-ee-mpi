FHIR operatsioon on eritegevus, mida ei ole võimalik või väga raske väljendada standardse FHIR süntaksi kaudu.
Tegevuse realiseerimine operatsioonina võib olla tingitud teise osapoole (nt xTee andmekogu) käideldavuse tõttu või erilise ligipääsu reeglite tõttu.

Välised allikad, kust MPI andmeid pärib, ei toeta tavaliselt lehekülgede numeratsiooni päringu parameetrina. Seetõttu tagastavad enamus MPI operatsioonidest
andmed "collection" tüübi Bundle-ina, mis ei sisalda informatsiooni ridade arvu ega lehekülgede kohta.

## Patsient

### Patsientide sidumine ja lahti sidumine

Patsientide sidumise ja lahti sidumise loogika ja operatsioonid on seletatud [leheküljel](link.html).

### Välismaalaste otsing

Välismaalaste otsimiseks kui identifikaator ei ole teada tuleb kasutada operatsiooni [Patient/$foreign](OperationDefinition-patient-foreign.html).

#### Toetatud otsinguparameetrid

| Parameeter         | Kohustuslik | Kirjeldus                                                                                   | Väärtustatud näidis    |   
|--------------------|-------------|---------------------------------------------------------------------------------------------|------------------------|
| gender             | ei          | Sugu. Toetatud väärtused: male,female,unknown.                                              | gender=male            |
| birthdate          | ei          | Sünnikuupäev.                                                                               | birthdate=1974-12-25   |
| family             | ei          | Perekonnanimi, pole tõstetundlik.                                                           | family=Graham          |
| given              | ei          | Eesnimi, pole tõstetundlik.                                                                 | given=Gene             |
| identifier_country | jah         | Patsiendi identifikaatori riigi ISO kood (3 tähega).                                        | identifier_country=UZB |
| telecom            | ei          | Patsiendi telefoni number või e-mail (parameetri on vaja URL-encode-da), pole tõstetundlik. | telecom=some@email.ee  |

#### Päringu näidis

```
GET {MPI}/Patient/$foreign?gender=male&birthdate=1979-12-25&family=Graham&given=Gene&identifier_country=UZB&telecom=%2B1234567
```

Vastusena tuleb (collection) Bundle mis tagastab kollektsiooni leitud ressurssidest (ilma metainformatsioonita):

```json
{
  "resourceType": "Bundle",
  "type": "collection",
  "entry": [
    {
      "resource": {
        "resourceType": "Patient",
        "id": "895",
        "meta": {
          "lastUpdated": "2024-08-05T08:41:32.120+03:00",
          "profile": [
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient-verified"
          ]
        },
        "identifier": [
          {
            "system": "https://fhir.ee/sid/pid/uzb/ppn",
            "value": "113354925133"
          }
        ],
        "active": true,
        "name": [
          {
            "use": "official",
            "family": "Graham",
            "given": [
              "Gene"
            ]
          }
        ],
        "telecom": [
          {
            "system": "phone",
            "value": "+1234567",
            "period": {
              "start": "2024-08-05T08:41:32+03:00"
            }
          }
        ],
        "gender": "male",
        "birthDate": "1979-12-25"
      }
    }
  ]
}
```

### Eesti isikukoodiga patsiendi otsing

Andmed erinevatest infosüsteemidest saab pärida [Patient/$lookup](OperationDefinition-patient-lookup.html) operatsiooniga.
Toetavate parameetrite hulka kuuluvad: identifikaator ja allikas, kust andmeid päritakse.
Hetkel toetatakse päringuna:

- Rahvastikuregistrist (source=https://rahvastikuregister.ee)
- MPI Patsiendiregistrist (source=https://mpi.tehik.ee)

```
GET {MPI}/Patient/$lookup?identifier=https://fhir.ee/sid/pid/est/ni|52007010062&source=https://rahvastikuregister.ee
```

```json
{
  "resourceType": "Bundle",
  "type": "collection",
  "entry": [
    {
      "resource": {
        "resourceType": "Patient",
        "id": "899",
        "meta": {
          "lastUpdated": "2024-08-05T08:44:24.072+03:00",
          "profile": [
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient-verified"
          ]
        },
        "identifier": [
          {
            "system": "https://fhir.ee/sid/pid/est/ni",
            "value": "52007010062"
          }
        ],
        "active": true,
        "name": [
          {
            "use": "official",
            "family": "PEREA",
            "given": [
              "CARL"
            ]
          }
        ],
        "gender": "male",
        "birthDate": "2020-07-01",
        "address": [
          {
            "extension": [
              {
                "url": "http://hl7.org/fhir/StructureDefinition/address-official",
                "valueBoolean": true
              },
              {
                "url": "https://fhir.ee/base/StructureDefinition/ee-ads-adr-id",
                "valueCoding": {
                  "system": "https://fhir.ee/base/CodeSystem/ads-adr-id",
                  "code": "2187800"
                }
              },
              {
                "url": "https://fhir.ee/base/StructureDefinition/ee-ads-oid",
                "valueCoding": {
                  "system": "https://fhir.ee/base/CodeSystem/ads-oid",
                  "code": "ER01392274"
                }
              }
            ],
            "use": "home",
            "type": "physical",
            "text": "Harju maakond, Tallinn, Lasnamäe linnaosa, Virbi tn 2-99",
            "line": [
              "Virbi tn 2 - 99"
            ],
            "_line": [
              {
                "extension": [
                  {
                    "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
                    "valueString": "Virbi tn"
                  },
                  {
                    "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
                    "valueString": "2"
                  },
                  {
                    "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator",
                    "valueString": "99"
                  }
                ]
              }
            ],
            "city": "Tallinn",
            "state": "Harju maakond",
            "postalCode": "13629",
            "country": "EE",
            "period": {
              "start": "2024-01-12T00:00:00+02:00"
            }
          }
        ]
      }
    }
  ]
}
```

## Sotsiaalsed tunnused

Sotsiaalsed tunnused päritakse xTee teenuste kaudu ja tagastatakse Observation ressurssidena.
Tüüpiliselt tagastatav Observation ressurss ei sisalda **"id"** väärtust ja peegeldab hetkeseisu situatsiooni.
Sotsiaalsete tunnuste operatsioonid pärivad alati andmed allikregistritest (sõltumatu andmete olemasolust vahemälus).

### Seadusliku eeskostja staatus

Andmed päritakse [$legal-guardian](OperationDefinition-patient-legal-guardian.html) operatsiooniga, mis saab kaks parameetrit - viide patsiendile ja eestkoste
liik SNOMED järgi(eestkostja - 58626002, eestkostetav - 365569001):

Näiteks eestkostetavate leidmine:

```
GET {MPI}/Patient/$legal-guardian?patient=Patient/168&legal-status=365569001
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
                "family": "PEREA",
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
            "reference": "RelatedPerson/#a8725be4-e78d-427a-883f-d540b97bae55"
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

#### Hooldusõiguste pärimine

Andmed päritakse [$power-of-attorney](OperationDefinition-patient-power-of-attorney.html) operatsiooniga, mis saab ühte parameetri - viidet patsiendile.

```
GET {MPI}/Patient/$power-of-attorney?patient=Patient/263595
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
            "id": "c504918e-dcd2-4b11-942b-69792f980498",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "47907040020"
              }
            ],
            "relationship": [
              {
                "coding": [
                  {
                    "system": "http://snomed.info/sct",
                    "code": "72705000",
                    "display": "Mother"
                  }
                ]
              }
            ],
            "name": [
              {
                "family": "KULD",
                "given": [
                  "MILVI"
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
          "reference": "Patient/263595"
        },
        "effectivePeriod": {
          "start": "2020-09-01T00:00:00+03:00"
        },
        "issued": "2024-10-18T13:46:04.851+03:00",
        "performer": [
          {
            "reference": "RelatedPerson/#c504918e-dcd2-4b11-942b-69792f980498"
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
            "id": "a804e3f1-e0ab-4f39-ab5e-c97a03b26028",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "47907040020"
              }
            ],
            "relationship": [
              {
                "coding": [
                  {
                    "system": "http://snomed.info/sct",
                    "code": "72705000",
                    "display": "Mother"
                  }
                ]
              }
            ],
            "name": [
              {
                "family": "KULD",
                "given": [
                  "MILVI"
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
          "reference": "Patient/263595"
        },
        "effectivePeriod": {
          "start": "2020-09-01T00:00:00+03:00"
        },
        "issued": "2024-10-18T13:46:04.851+03:00",
        "performer": [
          {
            "reference": "RelatedPerson/#a804e3f1-e0ab-4f39-ab5e-c97a03b26028"
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

### Haridus

Andmed päritakse [$education](OperationDefinition-patient-education.html) operatsiooniga, mis saab ühe parameetri - viide patsiendile:

```
GET {MPI}/Patient/$education?patient=Patient/3744
```

ning saab vastuseks Observationi

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
            "https://tehik.ee/StructureDefinition/ee-mpi-social-history-education-level"
          ]
        },
        "status": "final",
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                "code": "social-history",
                "display": "Social History"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "82589-3",
              "display": "Highest level of education"
            }
          ]
        },
        "subject": {
          "reference": "Patient/3744"
        },
        "issued": "2023-04-27T13:11:56.188+00:00",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://mpi.tehik.ee/rr/education-level",
              "code": "Hariduseta, alusharidus",
              "display": "Hariduseta, alusharidus"
            }
          ]
        }
      }
    }
  ]
}
```

### Puude määr

Andmed päritakse [$disability](OperationDefinition-patient-disability.html) operatsiooniga, mis saab ühe parameetri - viide patsiendile:

```
GET {MPI}/Patient/$disability?patient=Patient/7073
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
        "issued": "2024-08-05T09:02:37.395+03:00",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/puude-raskusaste",
              "code": "sygav",
              "display": "Sügav puue"
            }
          ]
        }
      }
    }
  ]
}
```

### Teovõime

Andmed päritakse [$legal-status](OperationDefinition-patient-legal-status.html) operatsiooniga, mis saab ühe parameetri - viide patsiendile:

```
GET {MPI}/Patient/$legal-status?patient=Patient/874
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
          "reference": "Patient/874"
        },
        "issued": "2024-08-02T13:12:35.344+03:00",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/teovoime-staatus",
              "code": "T3",
              "display": "Piiratud teovõimega valimisõigusega"
            }
          ]
        }
      }
    }
  ]
}
```

### Töövõime

Andmed päritakse [$incapacity-for-work](OperationDefinition-patient-incapacity-for-work.html) operatsiooniga, mis saab ühe parameetri - viide patsiendile:

```
GET {MPI}/Patient/$incapacity-for-work?patient=Patient/7076
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
          "reference": "Patient/7076"
        },
        "effectivePeriod": {
          "start": "2024-04-03T00:00:00+03:00",
          "end": "2027-04-02T00:00:00+03:00"
        },
        "issued": "2024-08-26T11:24:19.725+03:00",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/toovoime-liik",
              "code": "puudub",
              "display": "Puuduv töövõime"
            }
          ]
        }
      }
    }
  ]
}
```

## Tööprintsiip

### Vahemälu (cache)

MPI operatsioonid teostavad päringu algallikasse (registrisse) ning tagastavad vastuse kasutajale ilma andmeid salvestamata MPI andmebaasi. Iga välise registri
eest vastutab omaette mikroteenus, mis säilitab päringu vastuse oma vahemälus konfigureeritud ajaks (tavaliselt ühe päeva jooksul). Päring algallikast
värskendab andmed vahemälus.

### Vahemälust pärimine

Iga operatsioon mis toetab vahemälu sisaldab parameetri *nocache*. *nocache* parameetri vaikimisi väärtuseks on *false*, s.t. vaikimisi andmed võetakse
vahemälust. xTee päringu käivitamiseks ilmutatud kujul *nocache* väärtuseks tuleb määrata *true*. 
