FHIR operatsioon on eritegevus, mida ei ole võimalik või väga raske väljendada standardse FHIR süntaksi kaudu.
Tegevuse realiseerimine operatsioonina võib olla tingitud teise osapoole (nt xTee andmekogu) käideltadavuse tõttu või erilise liigipäsu reeglite tõttu.

Tavaliselt välised allikad kust MPI pärib andmed ei toeta lehekülgede numeratsiooni päringu parameetrina. Selle tõttu enamus MPI operatsioonidest tagastavad andmed "collection" tüübi Bundle-ina, mis ei sisalda informatsiooni ridade arvust ega leheküljetest. 


## Patsient
### Patsientide sidumine ja lahti sidumine
Patsientide sidumise ja lahti sidumise loogika ja operatsioonid seletud omaette [leheküljel](link.html).

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
Toetavate parameetrite hulka kuuluvad: identifikaator ja süsteem kust päritakse andmed. 
Hetkel toetatkse päring
- Rahvastikuregistrist (system=https://rahvastikuregister.ee)
- MPI Patsiendiregistrist (system=https://mpi.tehik.ee)

```
GET {MPI}/Patient/$lookup?identifier=https://rahvastikuregister.ee|52007010062
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
                        "system": "urn:pin:hl7.ee:pid:est:ni",
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
Sotsiaalsete tunnuste operatsioonid alati pärivad andmed allikregistritest (sõltumatu andmete olemasolust vahemälus).

### Seadusliku eeskostja staatus
Andmed päritakse [$legal-guardian](OperationDefinition-Patient-legal-guardian.html) operatsiooniga, mis saab ühte parameetri - viidet patsiendile.
```
GET {MPI}/Patient/$legal-guardian?patient=Patient/3744
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
                        "https://tehik.ee/StructureDefinition/ee-mpi-social-history-legal-guardian-status"
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
                            "code": "1193838006",
                            "display": "Legal guardian status"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/3744"
                },
                "effectivePeriod": {
                    "start": "2020-09-28T00:00:00+03:00"
                },
                "issued": "2023-04-27T12:58:38.136+00:00",
                "performer": [
                    {
                        "reference": "RelatedPerson/3746"
                    }
                ],
                "valueCodeableConcept": {
                    "coding": [
                        {
                            "system": "https://mpi.tehik.ee/rr/legal-capacity-type",
                            "display": "FIXME"
                        }
                    ]
                },
                "note": [
                    {
                        "text": "gfhsgadfjsfgdhjk\n"
                    }
                ]
            }
        },
        {
            "resource": {
                "resourceType": "Observation",
                "meta": {
                    "profile": [
                        "https://tehik.ee/StructureDefinition/ee-mpi-social-history-legal-guardian-status"
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
                            "code": "1193838006",
                            "display": "Legal guardian status"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/3744"
                },
                "effectivePeriod": {
                    "start": "2020-09-28T00:00:00+03:00"
                },
                "issued": "2023-04-27T12:58:38.350+00:00",
                "performer": [
                    {
                        "reference": "RelatedPerson/3747"
                    }
                ],
                "valueCodeableConcept": {
                    "coding": [
                        {
                            "system": "https://mpi.tehik.ee/rr/legal-capacity-type",
                            "display": "FIXME"
                        }
                    ]
                },
                "note": [
                    {
                        "text": "gfhsgadfjsfgdhjk\n"
                    }
                ]
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
                        "https://tehik.ee/StructureDefinition/ee-mpi-social-history-legal-guardian-status"
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
                            "code": "186063005"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/3744"
                },
                "effectivePeriod": {
                    "start": "2020-09-28T00:00:00+03:00"
                },
                "issued": "2023-04-27T13:02:32.726+00:00",
                "performer": [
                    {
                        "type": "RelatedPerson"
                    }
                ],
                "valueCodeableConcept": {
                    "coding": [
                        {
                            "system": "https://mpi.tehik.ee/rr/guardian-rights",
                            "display": "täielik isikuhooldusõigus"
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
                        "https://tehik.ee/StructureDefinition/ee-mpi-social-history-legal-guardian-status"
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
                            "code": "186063005"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/3744"
                },
                "effectivePeriod": {
                    "start": "2020-09-28T00:00:00+03:00"
                },
                "issued": "2023-04-27T13:02:32.726+00:00",
                "performer": [
                    {
                        "type": "RelatedPerson"
                    }
                ],
                "valueCodeableConcept": {
                    "coding": [
                        {
                            "system": "https://mpi.tehik.ee/rr/guardian-rights",
                            "display": "täielik varahooldusõigus"
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
                        "https://tehik.ee/StructureDefinition/ee-mpi-social-history-legal-guardian-status"
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
                            "code": "186063005"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/3744"
                },
                "effectivePeriod": {
                    "start": "2020-09-28T00:00:00+03:00"
                },
                "issued": "2023-04-27T13:02:32.726+00:00",
                "performer": [
                    {
                        "type": "RelatedPerson"
                    }
                ],
                "valueCodeableConcept": {
                    "coding": [
                        {
                            "system": "https://mpi.tehik.ee/rr/guardian-rights",
                            "display": "täielik isikuhooldusõigus"
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
                        "https://tehik.ee/StructureDefinition/ee-mpi-social-history-legal-guardian-status"
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
                            "code": "186063005"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/3744"
                },
                "effectivePeriod": {
                    "start": "2020-09-28T00:00:00+03:00"
                },
                "issued": "2023-04-27T13:02:32.726+00:00",
                "performer": [
                    {
                        "type": "RelatedPerson"
                    }
                ],
                "valueCodeableConcept": {
                    "coding": [
                        {
                            "system": "https://mpi.tehik.ee/rr/guardian-rights",
                            "display": "täielik varahooldusõigus"
                        }
                    ]
                }
            }
        }
    ]
}
```

### Education
Andmed päritakse [$education](OperationDefinition-Patient-education.html) operatsiooniga, mis saab ühte parameetri - viidet patsiendile.
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
### Cache
MPI operatsioonid teostavad päringu algallikasse (registri) ning tagastavad vastuse kasutajale ilma andmete salvestamata MPI andmebaasi. Iga välise registri eest vastutab omaette mikroteenus, mis säilitab päringu vastust oma vahemälus konfigureeritud ajaks (tavaliselt ühe päeva jooksul). Päring algallikast värskendab andmed vahemälus.

### Vahemälust pärimine
Iga operatsioon mis toetab vahemälu sisaldab parameetri *nocache*. *nocache* parameetri vaikimisi väärtuseks on *false*, s.t. vaikimisi andmed võetakse vahemälust. xTee päringu käivitamiseks ilmutatud kujul *nocache* väärtuseks tuleb määrata *true*. 

<!--
Vahemälust andmete pärimiseks tuleb esitada päringu Observation endpointile koos otsitava mõiste koodiga. Näiteks:
```
GET {MPI}/Observation?subject=Patient/1&code=http://snomed.info/sct|1193838006 
```
tagastab cache-is oleva eeskostja infot.
Kahest või rohkematest andmeallikatest andmete pärimisel tuleb loendada kõik vastavad mõisted.
```
GET {MPI}/Observation?subject=Patient/1&code=http://snomed.info/sct|1193838006&code=http://loinc.org|82589-3
```
--/>
