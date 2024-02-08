Patsiendi üldandmete teenus (PÜT) põhineb EEBase EEBasePatient, EEBaseRelatedPerson ja EEBaseObservation profiilidel.
Kasutame juurutusjuhendis teenuse kirjeldamiseks termineid "PÜT - patsiendi üldandmete teenus" ja "MPI - Master Patient Index", kuid peame nende all silmas sisuliselt sama teenust.

Väljavõte EE MPI profiilide sõltuvusgraafist:
```mermaid
graph TD
    EEBasePatient -->|päritud| EEMPIPatient
    EEMPIPatient -->|Tuvastatud| EEMPIPatientVerified
    EEMPIPatient -->|Tundmatu| EEMPIPatientUnknown
    EEMPIPatient -->|Vastsündinu| EEMPIPatientNewborn
    EEMPIPatient -->|Surnultsündinu| EEMPIPatientStillBorn
    EEBaseRelatedPerson --> |päritud| EEMPIRelatedPerson
    EEMPIPatient --> |seotud| EEMPIRelatedPerson
    EEBaseObservation --> |päritud| MpiSocialHistoryLegalGuardianStatus
    EEMPIPatient --> |seotud| MpiSocialHistoryLegalGuardianStatus
    EEBaseRelatedPerson --> |seotud| MpiSocialHistoryLegalGuardianStatus
```

## EEMPIPatient
Profiilid on vajalikud andmekoosseisude valideerimiseks. Selle eesmärgiga profiilid luuakse iga kasutusjuhu jaoks eraldi ja välditakse liiga üldiste profiilide kasutamist.

[EE MPI Patient](StructureDefinition-ee-mpi-patient.html) on abstraktne profiil, mille eesmärk on kirjeldada üldised MPI piirangud.

Võrreldes EEBase-iga ei toeta MPI: *maritalStatus*, *photo*, *contact*, *generalPractitioner*, *managingOrganization*	ja *link* elemente sisendina ja ei töötle neid kui neid edastatakse teenusele.
Samas pakub teenus patsientide [sidumise ja lahti sidumise](link.html) tegevusi ning sidumise tulemusi väljastab *link* elemendis.

Kasutusjuhu põhised patsiendi profiilid on 

| Profiil  | Kasutusjuht |
|---|---|
| [EEMPIPatientVerified](StructureDefinition-ee-mpi-patient-verified.html) | Dokumendi alusel tuvastatud patsiendi registreerimine |
| [EEMPIPatientUnknown](StructureDefinition-ee-mpi-patient-unknown.html) | Tundmatu või anaonüümse patsiendi registreerimine |
| [EEMPIPatientNewborn](StructureDefinition-ee-mpi-patient-newborn.html) | Vastsündinu patsiendi registreerimine (antud profiil realiseeritakse tulevikus) |
| [EEMPIPatientStillborn](StructureDefinition-ee-mpi-patient-stillborn.html) | Surnultsündinu patsiendi registreerimine (antud profiil realiseeritakse tulevikus) |

## Patsiendi otsing

Järgmine diagramm annab ülevaate vajalikest sammudest patsiendi otsinguks:

```mermaid
flowchart TD
    A{Patsiendi\notsing} -->|Eestimaalase otsing\ntäpse isikukoodi järgi PÜT-is| B(<a href='dev.html#andmete-pärimine'>GET /Patient?identifier=XXX</a>)
    B --> MPIList1{Nimekiri\npatsientidest}
    MPIList1 --> |Ei ole leitud\nUus otsing| B
    MPIList1 --> |Patsiendi otsing RR-is| RR(Otsing operatsiooni abil\n<a href='operations.html#eesti-isikukoodiga-patsiendi-otsing'>GET /Patient/$lookup?identifier=XXX</a>)
    RR --> RRlist{Nimekiri\npatsientidest}
    RRlist --> |Patsient leitud RR-is| Patient(Patsiendi päring\n<a href='dev.html#ressurss'>GET /Patient/XXX</a>)
    RRlist --> |Ei ole leitud\nUus otsing| B
    MPIList1 --> |Patsient leitud PÜT-is| Patient

    A --> |Välismaalase otsing PÜT-is\nparameetrite järgi| C(Otsing operatsiooni abil\n<a href='operations.html#välismaalaste-otsing'>GET /Patient/$foreign?name=XXX</a>)
    C --> D{Nimekiri\npatsientidest}
    D --> |Ei ole leitud\nUus otsing| C
    D --> |Patsient leitud PÜT-is| Patient
    D --> |Lisa uus patsient| NewPatient(Välismaalase lisamine\n<a href='uc.html#uc-02-patsient-teiese-riigi-dokumendiga'>POST /Patient</a>)
```

#### Eesimaalase otsing:

```plantuml
state "Patsientide nimekiri PÜTis" as MPIlist <<choice>>
note left of MPIlist: Patsientide nimekiri PÜTis
state "Puudub PÜT-is" as missingMPI
[*] -down-> MPIlist: "Eestimaalase otsing.\n[[dev.html#andmete-pärimine GET /Patient?identifier=value]]"

MPIlist --> Patsient : "Patsient leitud.\n[[dev.html#ressurss GET /Patient/$id]]"
MPIlist --> missingMPI : "Patsient pole leitud või puudub"
state missingMPI {
  state "Patsiendid RR-is" as RRlist <<choice>>
  note left of RRlist: Patsiendid RR-is
  [*] --> RRlist: "Otsing RR-is.\n[[operations.html#eesti-isikukoodiga-patsiendi-otsing GET /Patient/$lookup?identifier=value]]"
  RRlist --> Patsient: "Patsient leitud.\n[[dev.html#ressurss GET /Patient/$id]]"
}

state Patsient {
  Patsient --> Patsient: "Uuenda andmed.\nPUT /Patient/$id"
  [*] --> RelatedPerson: "Kontaktisikute\nhaldus"
  [*] --> MPIOperations: "Sotsiaalsed\nnäitajad"
}

Patsient --> [*] : Valmis
missingMPI --> [*] : "Puudub MPI-s.\nKatkestame"
RRlist --> [*]: "Puudub RR-s.\nKatkestame"
```

### Välismaalase otsing

```plantuml
state "Patsientide nimekiri PÜTis" as MPIlist <<choice>>
state "Otsus mida teha" as MPIchoice <<choice>>

MPIlist: Bundle of patients
note left of MPIlist: Patsientide nimekiri PÜTis

note right of MPIchoice: Otsustame mida teha edasi

[*] -down-> MPIlist: "Välismaalase otsing.\n[[operations.html#välismaalaste-otsing GET /Patient/$foreign?params]]"

MPIlist --> Patsient : "Patsient leitud.\nGET /Patient/${id}"
MPIlist --> MPIchoice : "Patsient pole leitud või puudub"
MPIchoice --> Patsient : "Lisa uus.\nPOST /Patient"


state Patsient {
  Patsient --> Patsient: "Uuenda andmed.\nPUT /Patient/${id}"
}


Patsient --> [*] : Valmis
MPIchoice --> [*] : "Puudub MPI-s.\nKatkestame"
```