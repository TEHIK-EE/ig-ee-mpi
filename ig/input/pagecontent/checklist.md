## Checklist MPI-ga liidestava tarkvara jaoks

- [] Oskab teha REST päringuid üle X-tee	
- [] Oskab kasutada MPI seotud terminoloogiat	CodeSystem, ValueSet
  - [] Toetab kõik MPI defineeritud klassifikaatorid	Igas ressurssis on hulk klassifikaatoreid, mida tuleb toetada
  - [] Oskab jooksvalt (on-the-fly) pärida uued väärtused mpi-identity-system koodi süsteemist ja vastuvõtta ka neid patsiendisõnumid mille kohta süsteem eelnevalt ei teadnud koodisüsteemi olemasolust	GET /CodeSystem/identity-system? GET /NamingSystem?

- Oskab opereerida Patient ressurssiga	
  - [] Get Patient.id järgi	GET /Patient/{id}
  - [] Kindla patsiendi andmete muutmine	PUT /Patient/{id}
  - [] Uue patsiendi lisamine	POST /Patient
  - [] Vigase patsiendi kustutamine	DELETE /Patient
  - [] Oskab otsida patsiendi identifikaatori alusel	GET /Patient?identifier=system|value
  - [] Oskab pärida muudetud patsiendi kirjed	GET /Patient?_lastUpdated=gt2023-01-31
  - [] Toetab ADS-i. Oskab vastuvõtta ja saata aadressi.	
  - [] Toetab ametliku telefoninumbri kuju	
https://www.riigiteataja.ee/akt/881042
Lauatelefoni regex: ^(32|33|35|38|39|6[0-9]|7[1-9]|88)(\\d{5})$
Mobiili regex (prefiks +372 või 00372): ^5[0-9](\\d{5,6})$
Välismaa numbri regex: ^\\+[1-9]\\d{1,14}$
  - [] Toetab ametliku emaili kuju	
Emaili regex: ^(?=.{1,64}@)[A-Za-z0-9_+-]+(\\.[A-Za-z0-9_+-]+)*@[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$
- Patsiendiliigid	
  - [] Toetab tuvastutud patsiendi andmekoosseisu	Kontrollitakse EE MPI Patient Verified profiili Must Support elemendid https://ig.kodality.dev/mpi/StructureDefinition-EEMPIPatientVerified.html
  - [] Toetab tundmatu ja anonüümse patsiendi andmekoosseisu (kui TTO-l on vastav raviprofiil)	Kontrollitakse EE MPI Patient Unknown profiili Must Support elemendid https://ig.kodality.dev/mpi/StructureDefinition-EEMPIPatientUnknown.html
  - [] Toetab vastsündinu patsiendi andmekoosseisu (kui TTO-l on vastav raviprofiil)	Kontrollitakse EE MPI Patient Newborn profiili Must Support elemendid
  - [] Toetab surnultsündinu patsiendi andmekoosseisu (kui TTO-l on vastav raviprofiil)	
  - [] Toetab loompatsiendi andmekoosseisu (kui TTO-l on labor või patoloogia osakond)	
  - [] Toetab mitteelusate patsiendite andmekoosseisu, nt õhk, keskkonnaproovid, ..  (kui TTO-l on labor ja vastav raviprofiil)	
- Oskab opereerida RelatedPerson ressurssiga	
  - [] RelatedPerson CRUD	GET/PUT/POST/DELETE /RelatedPerson
  - [] Seotud isikute otsingud	
GET /RelatedPerson?identifier=system|value, GET /Patient?patient=value, GET /Patient?patient.identifier=system|value
  - [] Oskab toetada mitu seosetüübi mitmest kodeerimist süsteemist	http://hl7.org/fhir/R4/valueset-relatedperson-relationshiptype.html
- Oskab pärida sotsiaalsed näitajad	GET /Observation?category=system|social-history
  - [] Töövõimetus	GET /Observation?code=
  - [] Saadud haridus, haridustase	GET /Observation?code=http%3A%2F%2Fsnomed.info%2Fsct%7C82589-3
  - [] Töökoht ja amet	GET /Observation?code=
  - [] Hooldusõigused	GET /Observation?code=http%3A%2F%2Fsnomed.info%2Fsct%7C186063005
  - [] Eestkoste	GET /Observation?code=http%3A%2F%2Fsnomed.info%2Fsct%7C1193838006
- MPI operatsioonid	
  - [] Oskab teha patsientide loogilist sidumist	Patient-Link
  - [] Oskab teha patsientide loogilist lahtisidumist	Patient-Unlink
  - [] Oskab teostada patsientide füüsilist liitmist?	Patient-Merge
  - [] Oskab genereerida MPI identifikaatori operaatori väljakutsega	Patient-medical-record-number
  - [] Oskab genereerida surnultsündinu patsiendi identifikaatori (kui TTO-l on vastav raviprofiil)	Patient-stillborn-identifier
  - [] Töövõimetuse küsimine	
  - [] Hariduse küsimine	
  - [] Töökoha ja ameti küsimine	
  - [] Hooldusõiguste küsimine	
  - [] Eestkoste küsimine	
  - [] Välimsaalaste otsimine	Patient-Foreigner
- Tehnilised nõuded	
  - [] Omab FHIR tugi	Oskab kasutada FHIR teenuseid (REST client)
    - [] Oskab kuvada kasutajale vead, mida tagastab MPI	andmed OperationOutcome elemendist
    - [] Oskab töödelda search päringu, millele tagastakse kogum ressurssidest	Bundle
    - [] Oskab koostada komplekssõnumi, mis koosneb mitmest ressurssidest	Bundle
  - [] Oskab lugeda CapabilityStatement	Kirjeldab toetavad ressurssid ja nendega seotud tegevused (GET, POST, ...)
  - [] Oskab määrata profiili iga muudetavale ressurssi kohta	POST ja PUT tegevuste puhul
  - [] Oskab määrata päringutele erinevad security labels	TO DO
- Protsess	
  - [] MPI integreeritud TTO kõikide patsiendi andmete käsitletavate rakenduste põhivoosse	



