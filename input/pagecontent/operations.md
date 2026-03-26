FHIR operatsioon on eritegevus, mida ei ole võimalik või on keeruline väljendada standardse FHIR süntaksi abil.
Tegevuse realiseerimine operatsioonina võib tuleneda teise osapoole (nt X-tee andmekogu) käideldavusest või eripärastest ligipääsupiirangutest.

Välised allikad, kust MPI andmeid pärib, ei toeta tavaliselt päringu parameetrina lehekülgede numeratsiooni.
Seetõttu tagastab enamik MPI operatsioone andmed collection-tüüpi Bundle’ina, mis ei sisalda teavet ridade koguarvu ega lehekülgede kohta.

### Vahemälu (cache) ja sealt pärimine

MPI operatsioonid teostavad päringu algallikasse (registrisse) ning tagastavad vastuse kasutajale ilma andmeid salvestamata MPI andmebaasi. Iga välise registri
eest vastutab omaette mikroteenus, mis säilitab päringu vastuse oma vahemälus konfigureeritud ajaks (tavaliselt ühe päeva jooksul). Päring algallikast
värskendab andmed vahemälus.

Iga operatsioon, mis toetab vahemälu, sisaldab parameetri *nocache*. *nocache* parameetri vaikimisi väärtuseks on *false*, s.t. vaikimisi andmed võetakse
vahemälust. xTee päringu käivitamiseks ilmutatud kujul *nocache* väärtuseks tuleb määrata *true*.

### Eesti isikukoodiga patsiendi otsing

Andmeid erinevatest infosüsteemidest saab pärida operatsiooniga [Patient/$lookup](OperationDefinition-patient-lookup.html).
Toetatud parameetrite hulka kuuluvad identifikaator ning allikas, kust andmeid päritakse.
Hetkel on toetatud järgmised päringud:

- Rahvastikuregistrist (source=https://rahvastikuregister.ee)
- MPI Patsiendiregistrist (source=https://mpi.tehik.ee)

### Patsiendi identifikaatorid operatsioonides

Operatsioonid [$disability](OperationDefinition-patient-disability.html), [$education](OperationDefinition-patient-education.html), [$legal-guardian](OperationDefinition-patient-legal-guardian.html), [$incapacity-for-work](OperationDefinition-patient-incapacity-for-work.html), [$patient-legal-relationship](OperationDefinition-patient-legal-relationship.html), [$legal-status](OperationDefinition-patient-legal-status.html), [$occupation](OperationDefinition-patient-occupation.html) ja [$power-of-attorney](OperationDefinition-patient-power-of-attorney.html) võimaldavad pärida järgmiste patsiendi identifikaatoritega:

- Viide patsiendile ```Patient/1234```

- Eesti isikukood süsteemiga ```patient.identifier=https://fhir.ee/sid/pid/est/ni|37408074944```

- Eesti isikukood süsteemita ```patient.identifier=37408074944```

- Eesti isikukood kooloniga ```patient:identifier=https://fhir.ee/sid/pid/est/ni|37408074944```

- Eesti isikukood kooloniga ja süsteemita ```patient:identifier=37408074944```



### Välismaalaste otsing

Välismaalaste otsimiseks juhul, kui identifikaator ei ole teada, tuleb kasutada operatsiooni [Patient/$foreign](OperationDefinition-patient-foreign.html).

##### Toetatud otsinguparameetrid

| Parameeter         | Kohustuslik | Kirjeldus                                                                                   | Väärtustatud näidis    |   
|--------------------|-------------|---------------------------------------------------------------------------------------------|------------------------|
| gender             | ei          | Sugu. Toetatud väärtused: male,female,unknown.                                              | gender=male            |
| birthdate          | ei          | Sünnikuupäev.                                                                               | birthdate=1974-12-25   |
| family             | ei          | Perekonnanimi, pole tõstutundlik.                                                           | family=Graham          |
| given              | ei          | Eesnimi, pole tõstutundlik.                                                                 | given=Gene             |
| identifier_country | jah         | Patsiendi identifikaatori riigi ISO kood (3 tähega).                                        | identifier_country=UZB |
| telecom            | ei          | Patsiendi telefoni number või e-mail (parameeter on vaja URL-encode-da), pole tõstutundlik. | telecom=some@email.ee  |



### Patsientide sidumine ja lahti sidumine
Patsientide sidumiseks kasutada [$link operatsiooni](OperationDefinition-patient-link.html). 

Patsientide lahti sidumiseks kasutada [$unlink operatsiooni](OperationDefinition-patient-unlink.html). 

Mõlema operatsiooni kasutamise reeglid ja piirangud on kirjeldatud [siin](link.html). 

### Sotsiaalsed tunnused

Sotsiaalsed tunnused päritakse X-tee teenuste kaudu ja tagastatakse Observation ressurssidena.
Tüüpiliselt ei sisalda tagastatav Observation ressurss id väärtust ning peegeldab päringus **hetkeolukorda**.
Sotsiaalsete tunnuste operatsioonid pärivad andmed alati allikregistritest, sõltumata nende olemasolust vahemälus.

### Seadusliku eeskostja staatus

Rahvastikuregistris nimetatud seaduslike eestkostjate nimekiri. Andmed päritakse [$legal-guardian](OperationDefinition-patient-legal-guardian.html) operatsiooniga. 

### Suhted ja hooldusõigused

Operatsioon [$legal-relationship](OperationDefinition-patient-legal-relationship.html) võimaldab pärida patsiendi seaduslikke kehtivaid suhteid teiste isikutega ja
hooldusõigusi nende vahel. Andmed tulevad Rahvastikuregistrist.


### Hooldusõiguste pärimine

Andmed päritakse [$power-of-attorney](OperationDefinition-patient-power-of-attorney.html) operatsiooniga.
**Andmed tagastatakse ainult alaealise kohta.** Kui patsiendi parameetris on märgitud täiskasvanu, tagastatakse ainult patsiendi lapsed ja alla 18-aastased ülalpeetavad.


### Haridus

Patsiendi kõrgeim haridustase. Andmed päritakse [$education](OperationDefinition-patient-education.html) operatsiooniga.  



### Puudemäär

Patsiendi puudemäär Sotsiaalkindlustusametist (SKA). Andmed päritakse [$disability](OperationDefinition-patient-disability.html) operatsiooniga. 



### Teovõime

Andmed päritakse [$legal-status](OperationDefinition-patient-legal-status.html) operatsiooniga. Antud operatsioon tagastab kehtiva teovõime otsuse, mis võib olla seotud kas teovõime puudumisega või piiratud teovõimega.



### Töövõime

Patsiendi töövõime otsus Sotsiaaklkindlustusametist (SKA). Andmed päritakse [$incapacity-for-work](OperationDefinition-patient-incapacity-for-work.html) operatsiooniga. Töövõime operatsioon tagastab kehtiva töövõime otsuse. 



### Töökoha ja ameti andmed
Patsiendi kõik töökoha ja ametikoha andmed, mis päritakse TÖR-st. Andmed päritakse [$occupation](OperationDefinition-patient-occupation.html) operatsiooniga. 


### Surmateave lisamine

Teatud operatsioonide puhul, kui tegemist on surnud isiku koodiga, siis kasutajale edastatakse [OperationOutcome-is](OperationOutcome-DeceasedWarning.html) teavitus. 

Operatsioonid, mis edastavad teavituse surnud isiku kohta: 
* [Teovõime](OperationDefinition-patient-legal-status.html) 
* [Töövõime](OperationDefinition-patient-incapacity-for-work.html) 
* [Haridus](OperationDefinition-patient-education.html)
* [Puudemäär](OperationDefinition-patient-disability.html) 

Näide, kus lisatakse operatsiooni vastusesse teavitus:
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
        "issued": "2026-03-18T13:56:22.035+02:00",
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
    },
    {
      "resource": {
        "resourceType": "OperationOutcome",
        "issue": [
          {
            "severity": "warning",
            "code": "informational",
            "details": {
              "coding": [
                {
                  "system": "https://mpi.tehik.ee",
                  "code": "MPI-101"
                }
              ],
              "text": "Patsient on surnud"
            }
          }
        ]
      }
    }
  ]
}
```