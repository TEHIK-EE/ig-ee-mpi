## Checklist MPI-ga liidestava tarkvara jaoks

- <input type="checkbox"/> Oskab teha REST päringuid üle X-tee  
- <input type="checkbox"/> Oskab kasutada MPI seotud terminoloogiat  CodeSystem, ValueSet
  - <input type="checkbox"/> Toetab kõik MPI defineeritud klassifikaatorid  Igas ressurssis on hulk klassifikaatoreid, mida tuleb toetada
  - <input type="checkbox"/> Oskab jooksvalt (on-the-fly) pärida uued väärtused mpi-identity-system koodi süsteemist ja vastuvõtta ka neid patsiendisõnumid mille kohta süsteem eelnevalt ei teadnud koodisüsteemi olemasolust  `GET /CodeSystem/identity-system`? 
- Oskab opereerida Patient ressurssiga  
  - <input type="checkbox"/> Get Patient.id järgi  `GET /Patient/{id}`
  - <input type="checkbox"/> Kindla patsiendi andmete muutmine  `PUT /Patient/{id}`
  - <input type="checkbox"/> Uue patsiendi lisamine  `POST /Patient`
  - <input type="checkbox"/> Oskab otsida patsiendi identifikaatori alusel  `GET /Patient?identifier=..`
  - <input type="checkbox"/> Oskab pärida muudetud patsiendi kirjed  GET /Patient?_lastUpdated=gt2023-01-31
  - <input type="checkbox"/> Toetab ADS-i. Oskab vastuvõtta ja saata aadressi.  
  - <input type="checkbox"/> Toetab ametliku telefoninumbri kuju  
https://www.riigiteataja.ee/akt/881042
Lauatelefoni regex: ^(32|33|35|38|39|6[0-9]|7[1-9]|88)(\\d{5})$
Mobiili regex (prefiks +372 või 00372): ^5[0-9](\\d{5,6})$
Välismaa numbri regex: ^\\+[1-9]\\d{1,14}$
  - <input type="checkbox"/> Toetab ametliku emaili kuju  
Emaili regex: ^(?=.{1,64}@)[A-Za-z0-9_+-]+(\\.[A-Za-z0-9_+-]+)*@[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$
- Patsiendiliigid  
  - <input type="checkbox"/> Toetab tuvastutud patsiendi andmekoosseisu  Kontrollitakse EE MPI Patient Verified profiili Must Support elemendid https://ig.kodality.dev/mpi/StructureDefinition-EEMPIPatientVerified.html
  - <input type="checkbox"/> Toetab tundmatu ja anonüümse patsiendi andmekoosseisu (kui TTO-l on vastav raviprofiil)  Kontrollitakse EE MPI Patient Unknown profiili Must Support elemendid https://ig.kodality.dev/mpi/StructureDefinition-EEMPIPatientUnknown.html
  - <input type="checkbox"/> Toetab vastsündinu patsiendi andmekoosseisu (kui TTO-l on vastav raviprofiil)  Kontrollitakse EE MPI Patient Newborn profiili Must Support elemendid
  - <input type="checkbox"/> Toetab surnultsündinu patsiendi andmekoosseisu (kui TTO-l on vastav raviprofiil)  
  - <input type="checkbox"/> Toetab loompatsiendi andmekoosseisu (kui TTO-l on labor või patoloogia osakond)  
  - <input type="checkbox"/> Toetab mitteelusate patsiendite andmekoosseisu, nt õhk, keskkonnaproovid, ..  (kui TTO-l on labor ja vastav raviprofiil)  
- Oskab opereerida RelatedPerson ressurssiga  
  - <input type="checkbox"/> RelatedPerson CRUD  `GET/PUT/POST/DELETE /RelatedPerson`
  - <input type="checkbox"/> Seotud isikute otsingud  
GET /RelatedPerson?identifier=system|value, `GET /Patient?patient=value`, `GET /Patient?patient.identifier=system|value`
  - <input type="checkbox"/> Oskab toetada mitu seosetüübi mitmest kodeerimist süsteemist  http://hl7.org/fhir/R4/valueset-relatedperson-relationshiptype.html
- Oskab pärida sotsiaalsed näitajad  `GET /Observation?category=system|social-history`
  - <input type="checkbox"/> Töövõimetus  `GET /Observation?code=`
  - <input type="checkbox"/> Saadud haridus, haridustase  `GET /Observation?code=http%3A%2F%2Fsnomed.info%2Fsct%7C82589-3`
  - <input type="checkbox"/> Töökoht ja amet  `GET /Observation?code=`
  - <input type="checkbox"/> Hooldusõigused  `GET /Observation?code=http%3A%2F%2Fsnomed.info%2Fsct%7C186063005`
  - <input type="checkbox"/> Eestkoste  `GET /Observation?code=http%3A%2F%2Fsnomed.info%2Fsct%7C1193838006`
- MPI operatsioonid  
  - <input type="checkbox"/> Oskab teha patsientide loogilist sidumist  Patient-Link
  - <input type="checkbox"/> Oskab teha patsientide loogilist lahtisidumist  Patient-Unlink
  - <input type="checkbox"/> Oskab teostada patsientide füüsilist liitmist?  Patient-Merge
  - <input type="checkbox"/> Oskab genereerida MPI identifikaatori operaatori väljakutsega  Patient-medical-record-number
  - <input type="checkbox"/> Oskab genereerida surnultsündinu patsiendi identifikaatori (kui TTO-l on vastav raviprofiil)  Patient-stillborn-identifier
  - <input type="checkbox"/> Töövõimetuse küsimine  
  - <input type="checkbox"/> Hariduse küsimine  
  - <input type="checkbox"/> Töökoha ja ameti küsimine  
  - <input type="checkbox"/> Hooldusõiguste küsimine  
  - <input type="checkbox"/> Eestkoste küsimine  
  - <input type="checkbox"/> Välimsaalaste otsimine  Patient-Foreigner
- Tehnilised nõuded  
  - <input type="checkbox"/> Omab FHIR tugi  Oskab kasutada FHIR teenuseid (REST client)
    - <input type="checkbox"/> Oskab kuvada kasutajale vead, mida tagastab MPI  andmed OperationOutcome elemendist
    - <input type="checkbox"/> Oskab töödelda search päringu, millele tagastakse kogum ressurssidest  Bundle
    - <input type="checkbox"/> Oskab koostada komplekssõnumi, mis koosneb mitmest ressurssidest  Bundle
  - <input type="checkbox"/> Oskab lugeda CapabilityStatement  Kirjeldab toetavad ressurssid ja nendega seotud tegevused (GET, POST, ...)
  - <input type="checkbox"/> Oskab määrata profiili iga muudetavale ressurssi kohta  POST ja PUT tegevuste puhul
  - <input type="checkbox"/> Oskab määrata päringutele erinevad security labels  TO DO
- Protsess  
  - <input type="checkbox"/> MPI integreeritud TTO kõikide patsiendi andmete käsitletavate rakenduste põhivoosse  



