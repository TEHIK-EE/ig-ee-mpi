FHIR operatsioon on eritegevus, mida ei ole võimalik või väga raske väljendada standardse FHIR süntaksi kaudu.
Tegevuse realiseerimine operatsioonina võib olla tingitud teise osapoole (nt xTee andmekogu) käideldavuse tõttu või erilise ligipääsu reeglite tõttu.

Välised allikad, kust MPI andmeid pärib, ei toeta tavaliselt lehekülgede numeratsiooni päringu parameetrina. Seetõttu tagastavad enamus MPI operatsioonidest andmed "collection" tüübi Bundle-ina, mis ei sisalda informatsiooni ridade arvu ega lehekülgede kohta. 


## Patsient
### Patsientide sidumine ja lahti sidumine
Patsientide sidumise ja lahti sidumise loogika ja operatsioonid on seletatud [leheküljel](link.html).

### Välismaalaste otsing
Välismaalaste otsimiseks või patsientide otsimiseks ilma identifikaatorita tuleb kasutada operatsiooni [Patient/$foreigner](OperationDefinition-Patient-foreigner.html). Toetavate parameetrite hulka kuuluvad: identifikaatori väljastanud riik, eesnimi, perekonnanimi, sünnikuupäev, sugu ja kontaktandmed.
```
GET {MPI}/Patient/$foreign?family=smith&gender=male
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
                "id": "1027",
                "meta": {
                    "profile": [
                        "https://hl7.ee/fhir/StructureDefinition/EEMPI-Patient-Verified"
                    ]
                },
                "active": true,
                "name": [
                    {
                        "family": "SMITH",
                        "given": [
                            "JAI"
                        ]
                    }
                ],
                "gender": "male",
                "birthDate": "1930-02-20",
                "_birthDate": {
                    "extension": [
                        {
                            "url": "http://hl7.org/fhir/StructureDefinition/patient-birthTime",
                            "valueDateTime": "1930-02-20T00:00:00+00:00"
                        }
                    ]
                }
            }
        }
    ]
}
```


### Eesti isikukoodiga patsiendi otsing
Andmed erinevatest infosüsteemidest saab pärida [Patient/$lookup](OperationDefinition-Patient-lookup.html) operatsiooniga. 
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
                "id": "3744",
                "meta": {
                    "profile": [
                        "https://hl7.ee/fhir/StructureDefinition/EEMPI-Patient-Verified"
                    ]
                },
                "text": {
                    "status": "generated",
                    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div class=\"hapiHeaderText\">CARL <b>PEREA </b></div><table class=\"hapiPropertyTable\"><tbody><tr><td>Identifier</td><td>52007010062</td></tr><tr><td>Date of birth</td><td><span>01 July 2020</span></td></tr></tbody></table></div>"
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
                        "family": "PEREA",
                        "given": [
                            "CARL"
                        ]
                    }
                ],
                "gender": "male",
                "birthDate": "2020-07-01"
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
Andmed päritakse [$legal-guardian](OperationDefinition-Patient-legal-guardian.html) operatsiooniga, mis saab kaks parameetrit - viide patsiendile ja eestkoste liik SNOMED järgi(eestkostja - 58626002, eestkostetav - 365569001):

Näiteks eestkostetavate leidmine:
```
GET {MPI}/Patient/$legal-guardian?patient=Patient/572&legal-status=365569001
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
            "https://fhir.ee/StructureDefinition/ee-mpi-socialhistory-legal-guardian-status"
          ]
        },
        "contained": [
          {
            "resourceType": "RelatedPerson",
            "id": "82b67ea1-fc05-44aa-8cbe-af272bbf0a0f",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "52009010061"
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
          "reference": "Patient/572"
        },
        "effectivePeriod": {
          "start": "2020-09-28T00:00:00+03:00"
        },
        "issued": "2023-09-28T11:01:51.608+03:00",
        "performer": [
          {
            "reference": "RelatedPerson/#82b67ea1-fc05-44aa-8cbe-af272bbf0a0f"
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

#### Power of attorney
Andmed päritakse [$power-of-attorney](OperationDefinition-Patient-power-of-attorney.html) operatsiooniga, mis saab ühte parameetri - viidet patsiendile.
```
GET {MPI}/Patient/$power-of-attorney?patient=Patient/3744
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
            "https://fhir.ee/StructureDefinition/ee-mpi-socialhistory-power-of-attorney"
          ]
        },
        "contained": [
          {
            "resourceType": "RelatedPerson",
            "id": "6fb272a7-fb03-480d-baa8-343c3b0d3083",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "46905292713"
              }
            ],
            "name": [
              {
                "family": "KOVVALVII",
                "given": [
                  "URVE"
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
          "reference": "Patient/357"
        },
        "effectivePeriod": {
          "start": "2010-07-01T00:00:00+03:00"
        },
        "issued": "2023-09-28T11:09:55.591+03:00",
        "performer": [
          {
            "reference": "RelatedPerson/#6fb272a7-fb03-480d-baa8-343c3b0d3083"
          }
        ],
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/power-of-attorney",
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
            "https://fhir.ee/StructureDefinition/ee-mpi-socialhistory-power-of-attorney"
          ]
        },
        "contained": [
          {
            "resourceType": "RelatedPerson",
            "id": "e835651a-3587-4e6c-a4d7-06df450143e9",
            "identifier": [
              {
                "system": "https://fhir.ee/sid/pid/est/ni",
                "value": "46905292713"
              }
            ],
            "name": [
              {
                "family": "KOVVALVII",
                "given": [
                  "URVE"
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
          "reference": "Patient/357"
        },
        "effectivePeriod": {
          "start": "2010-07-01T00:00:00+03:00"
        },
        "issued": "2023-09-28T11:09:55.592+03:00",
        "performer": [
          {
            "reference": "RelatedPerson/#e835651a-3587-4e6c-a4d7-06df450143e9"
          }
        ],
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "https://fhir.ee/CodeSystem/power-of-attorney",
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
Andmed päritakse [$education](OperationDefinition-Patient-education.html) operatsiooniga, mis saab ühe parameetri - viide patsiendile:
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
Operatsioon tagastab [Disability](StructureDefinition-ee-mpi-socialhistory-disability.html) objekti.


## Tööprintsiip
### Vahemälu (cache)
MPI operatsioonid teostavad päringu algallikasse (registrisse) ning tagastavad vastuse kasutajale ilma andmeid salvestamata MPI andmebaasi. Iga välise registri eest vastutab omaette mikroteenus, mis säilitab päringu vastuse oma vahemälus konfigureeritud ajaks (tavaliselt ühe päeva jooksul). Päring algallikast värskendab andmed vahemälus.

### Vahemälust pärimine
Iga operatsioon mis toetab vahemälu sisaldab parameetri *nocache*. *nocache* parameetri vaikimisi väärtuseks on *false*, s.t. vaikimisi andmed võetakse vahemälust. xTee päringu käivitamiseks ilmutatud kujul *nocache* väärtuseks tuleb määrata *true*. 
