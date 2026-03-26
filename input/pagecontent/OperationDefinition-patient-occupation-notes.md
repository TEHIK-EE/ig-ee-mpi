#### Kohustuslik põhjendus
Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

#### Näited
Näide päringust:

```
Patient/$occupation?patient=Patient/7079
```

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
                        "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-occupation"
                    ]
                },
                "contained": [
                    {
                        "resourceType": "Organization",
                        "id": "08fdb2e4-b7cc-4623-aeeb-d71911719fda",
                        "meta": {
                            "profile": [
                                "https://fhir.ee/base/StructureDefinition/ee-organization"
                            ]
                        },
                        "identifier": [
                            {
                                "system": "https://fhir.ee/sid/org/est/br",
                                "value": "10006966"
                            }
                        ],
                        "active": true,
                        "name": "CGI EESTI AS",
                        "contact": [
                            {
                                "address": {
                                    "extension": [
                                        {
                                            "url": "https://fhir.ee/base/StructureDefinition/ee-address-notice",
                                            "valueCoding": {
                                                "system": "https://mpi.tehik.ee",
                                                "code": "MPI-081",
                                                "display": "Aadressiobjektiga on seotud mitu hoone osa"
                                            }
                                        },
                                        {
                                            "url": "https://fhir.ee/base/StructureDefinition/ee-ads-adr-id",
                                            "valueCoding": {
                                                "system": "https://fhir.ee/base/CodeSystem/ads-adr-id",
                                                "code": "3042061"
                                            }
                                        },
                                        {
                                            "url": "https://fhir.ee/base/StructureDefinition/ee-ads-oid",
                                            "valueCoding": {
                                                "system": "https://fhir.ee/base/CodeSystem/ads-oid",
                                                "code": "EE00751946"
                                            }
                                        }
                                    ],
                                    "use": "work",
                                    "text": "Tartu maakond, Tartu linn, Tartu linn, Pikk tn 2",
                                    "line": [
                                        "Pikk tn 2"
                                    ],
                                    "_line": [
                                        {
                                            "extension": [
                                                {
                                                    "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
                                                    "valueString": "Pikk tn"
                                                },
                                                {
                                                    "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
                                                    "valueString": "2"
                                                }
                                            ]
                                        }
                                    ],
                                    "city": "Tartu linn",
                                    "state": "Tartu maakond",
                                    "postalCode": "51009",
                                    "country": "EE"
                                }
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
                            "code": "184104002",
                            "display": "Patient occupation"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/7079"
                },
                "issued": "2026-03-17T10:40:54.408+02:00",
                "performer": [
                    {
                        "reference": "#08fdb2e4-b7cc-4623-aeeb-d71911719fda"
                    }
                ]
            }
        },
        {
            "resource": {
                "resourceType": "Observation",
                "meta": {
                    "profile": [
                        "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-occupation"
                    ]
                },
                "contained": [
                    {
                        "resourceType": "Organization",
                        "id": "f46e276c-8bf2-44f3-9817-d16d977980cf",
                        "meta": {
                            "profile": [
                                "https://fhir.ee/base/StructureDefinition/ee-organization"
                            ]
                        },
                        "identifier": [
                            {
                                "system": "https://fhir.ee/sid/org/est/br",
                                "value": "11079281"
                            }
                        ],
                        "active": true,
                        "name": "TRIOGAMES OÜ",
                        "contact": [
                            {
                                "address": {
                                    "extension": [
                                        {
                                            "url": "https://fhir.ee/base/StructureDefinition/ee-ads-adr-id",
                                            "valueCoding": {
                                                "system": "https://fhir.ee/base/CodeSystem/ads-adr-id",
                                                "code": "3705721"
                                            }
                                        },
                                        {
                                            "url": "https://fhir.ee/base/StructureDefinition/ee-ads-oid",
                                            "valueCoding": {
                                                "system": "https://fhir.ee/base/CodeSystem/ads-oid",
                                                "code": "EE02154356"
                                            }
                                        }
                                    ],
                                    "use": "work",
                                    "text": "Harju maakond, Saku vald, Kasemetsa küla, Kaseurva",
                                    "city": "Kasemetsa küla",
                                    "district": "Saku vald",
                                    "state": "Harju maakond",
                                    "postalCode": "75510",
                                    "country": "EE"
                                }
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
                            "code": "184104002",
                            "display": "Patient occupation"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/7079"
                },
                "issued": "2026-03-17T10:40:54.408+02:00",
                "performer": [
                    {
                        "reference": "#f46e276c-8bf2-44f3-9817-d16d977980cf"
                    }
                ]
            }
        },
        {
            "resource": {
                "resourceType": "Observation",
                "meta": {
                    "profile": [
                        "https://fhir.ee/mpi/StructureDefinition/ee-mpi-socialhistory-occupation"
                    ]
                },
                "contained": [
                    {
                        "resourceType": "Organization",
                        "id": "9ee4ab5f-30c0-46f7-8c1c-f4046a9a9c22",
                        "meta": {
                            "profile": [
                                "https://fhir.ee/base/StructureDefinition/ee-organization"
                            ]
                        },
                        "identifier": [
                            {
                                "system": "https://fhir.ee/sid/org/est/br",
                                "value": "124456464"
                            }
                        ],
                        "active": true,
                        "name": "STRADOMSKI ALEKSANDER, SOLOMON",
                        "contact": [
                            {
                                "address": {
                                    "extension": [
                                        {
                                            "url": "https://fhir.ee/base/StructureDefinition/ee-ads-adr-id",
                                            "valueCoding": {
                                                "system": "https://fhir.ee/base/CodeSystem/ads-adr-id",
                                                "code": "3348477"
                                            }
                                        },
                                        {
                                            "url": "https://fhir.ee/base/StructureDefinition/ee-ads-oid",
                                            "valueCoding": {
                                                "system": "https://fhir.ee/base/CodeSystem/ads-oid",
                                                "code": "ME01148920"
                                            }
                                        }
                                    ],
                                    "use": "work",
                                    "text": "Jõgeva maakond, Mustvee vald, Voore küla, Kaalukoja",
                                    "city": "Voore küla",
                                    "district": "Mustvee vald",
                                    "state": "Jõgeva maakond",
                                    "postalCode": "49324",
                                    "country": "EE"
                                }
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
                            "code": "184104002",
                            "display": "Patient occupation"
                        }
                    ]
                },
                "subject": {
                    "reference": "Patient/7079"
                },
                "issued": "2026-03-17T10:40:54.408+02:00",
                "performer": [
                    {
                        "reference": "#9ee4ab5f-30c0-46f7-8c1c-f4046a9a9c22"
                    }
                ],
                "component": [
                    {
                        "code": {
                            "coding": [
                                {
                                    "system": "http://snomed.info/sct",
                                    "code": "160922003",
                                    "display": "Job details"
                                }
                            ]
                        },
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://fhir.ee/CodeSystem/ametite-klassifikaator",
                                    "code": "73220002",
                                    "display": "Trükimasina sööturi operaator"
                                }
                            ]
                        }
                    },
                    {
                        "code": {
                            "coding": [
                                {
                                    "system": "http://snomed.info/sct",
                                    "code": "224374003",
                                    "display": "Regularity of work"
                                }
                            ]
                        },
                        "valueQuantity": {
                            "value": 1.0,
                            "unit": "1"
                        }
                    }
                ]
            }
        }
    ]
}
```