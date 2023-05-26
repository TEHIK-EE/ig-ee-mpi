
### Sissejuhatus 

Patsiendi üldandmete teenus PÜT (ing k MPI ehk master patient index) on keskne teenus mille raames patsiendi kohta käivad üldandmed 
(sh haridustase, eestkoste, hooldusõigus, töövõimekao ja puude info jne) on kättesaadavad kõik ühest kohast. Erinevates registrites olevaid andmeid ei pea patsiendilt küsima vaid need liiguvad automaatselt PÜT-i. PÜT teenus tagab tervishoiuteenuse osutajate jaoks kvaliteetsema andmetöötluse ning aja kokkuhoiu patsiendi üldandmete otsimise ja sisetsamise arvelt. 

Käesoleval saidil kirjeldatakse PÜT rakendamisega seotud juurutisjuhendit. PÜT kasutab interaktsiooniprotokollina [FHIR 
standardit](http://fhir.hl7.org). 

PÜT juurutusjuhend määratleb toetatud profiilide komplekti ja pakub iga profiili jaoks vähemalt ühe näite.
FHIR profiili saab iseloomustada kui ühe fakti sisustusreeglistiku ning juurutusjuhendi kui kogumi sisustusreeglitest ja loenditest.

Patsiendi identifikaatorite käsitlust kirjeldab [Identifikaatorid](identifiers.html).
Patsiendi liike kirjeldab [patsiendi andmete koosseis](patient.html).


### Arendusvahendid ja lähtekood

Antud sait on välja töötatud [FHIR Shorthand](https://build.fhir.org/ig/HL7/fhir-shorthand) abiga.
Täiendava informatsiooni FHIR Shorthand kohta saab leida [Confluence-is](https://confluence.hl7.org/display/FHIRI/FHIR+Shorthand), [GitHub-is](https://github.com/HL7/fhir-shorthand) ja [Zulip](https://chat.fhir.org) kanalis: #shorthand.
PÜT-i juurutusjuhendi lähtekood on leitav [Gitlabis](https://gitlab.com/kodality/ig/ig-mpi).


