Patsiendi üldandmete teenus PÜT (_ing k MPI ehk Master Patient Index_) on keskne teenus, 
mille raames patsiendi kohta käivad üldandmed (sh haridustase, eestkoste, hooldusõigus, töövõimekao, puudeinfo jne) on 
kättesaadavad kõik ühest kohast. Erinevates registrites olevaid andmeid ei pea patsiendilt küsima vaid need liiguvad 
automaatselt PÜT-i. PÜT teenus tagab tervishoiuteenuse osutajate jaoks kvaliteetsema andmetöötluse ning aja kokkuhoiu 
patsiendi üldandmete otsimise ja sisestamise arvelt.

Käesoleval saidil kirjeldatakse PÜT rakendamisega seotud juurutusjuhendit. PÜT kasutab interaktsiooniprotokollina [FHIR
standardit](http://fhir.hl7.org).

Kasutame juurutusjuhendis teenuse kirjeldamiseks termineid "PÜT - patsiendi üldandmete teenus" ja "MPI - Master Patient Index", kuid peame nende all silmas
sisuliselt sama teenust.


PÜT juurutusjuhend määratleb toetatud profiilide komplekti ja pakub iga profiili jaoks vähemalt ühe näidet.
FHIR profiili saab iseloomustada kui ühe fakti sisustusreeglistiku ning juurutusjuhendit kui kogumit 
sisustusreeglitest ja loenditest.

Patsiendi identifikaatorite käsitlust kirjeldab [Identifikaatorid](identifiers.html).
Patsiendi liike kirjeldab [patsiendi andmete koosseis](patient.html).


### Arendusvahendid ja lähtekood

PÜT-i juurutusjuhendi lähtekood on leitav [GitHubis](https://github.com/TEHIK-EE/ig-ee-mpi).
Antud sait on välja töötatud [FHIR Shorthand](https://build.fhir.org/ig/HL7/fhir-shorthand) abiga.
Täiendava informatsiooni FHIR Shorthand kohta saab leida [Confluence-is](https://confluence.hl7.org/display/FHIRI/FHIR+Shorthand), [GitHub-is](https://github.com/HL7/fhir-shorthand) ja [Zulip](https://chat.fhir.org) kanalis: #shorthand.



