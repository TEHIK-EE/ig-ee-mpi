Järgnev alamleht kirjeldab patsientide sidumist ja lahti-sidumist. 
### Patsientide sidumine
Kasutada [$link operatsiooni](OperationDefinition-patient-link.html)

#### Reeglid ja piirangud
- Mõlemad identifikaatorid (source ja target) peavad olema olemas. 
- Sekundaarne patsient (source) ei tohi olla Eesti isikukoodiga ehk:
  - Eesti isikukoodiga patsienti ei saa siduda teise Eesti isikukoodiga. Eesti isikukoodide muudatused tulevad Rahvastikuregistrist. 
  - Eesti isikukoodiga patsienti ei saa siduda teise välismaalase isiku koodiga. 
  - Eesti isikukoodiga patsienti ei saa siduda tundmatu identifikaatoriga patsiendiga.
- Välismaalase isiku koodiga patsienti ei saa siduda tundmatu identifikaatoriga patsiendiga.
- Tundmatu identifikaatoriga patsienti ei saa siduda teise tundmatu identifikaatoriga patsiendiga.
- Primaarne patsient (target) võib olla Eesti isikukoodiga või välismaalase isiku koodiga. Ei tohi olla tundmatu identifikaatoriga.  
- Sekundaarne patsient (source) ei tohi olla seotud juba primaarse patsiendiga. 
- Kui sidumisel on mõlemal patsiendil (source ja target) sama süsteemiga identifikaatorid (näiteks Soome isikukood), siis sekundaarse patsiendi identifikaatorile lisatakse lõpukuupäev. 
- Sidumise tulemused hoitakse `Patient.link` väljas.
  - `Patient` ressursi salvestamisel rakendus ignoreerib `link` välja sisu. 
  - `link` välja saab muuta ainult operatsioonide abil.
- Saab siduda mitu sekundaarset patsienti ühe primaarse patsiendiga:
  - Primaarsel patsiendil tekib mitu `link` välja `replaces` tüübiga.
  - Sekundaarsetel patsientidel tekib üks `link` väli `replaced-by` tüübiga.
- Primaarsel patsiendil ei tohi olla `link` väljas `replaced-by` tüüpi. Ainult `replaces`
- `replaces` tüübiga loetletakse kõik transitiivselt seotud patsiendid:
  - Näide: kui tehakse sidumised A -> B, C -> D ja B -> D, siis patsiendid A, B ja C on patsiendi D `link` väljal `replaces` tüübiga loetletud.
- Otsing annab mõlema identifikaatori puhul sama tulemuse, st mõlema identifikaatori järgi leitakse kõik patsiendid, kes on seotud ühe ja sama primaarse patsiendiga.



### Patsientide lahti sidumine
Kasutada [$unlink operatsiooni](OperationDefinition-patient-unlink.html)

#### Reeglid ja piirangud
- Lahti sidumisel peavad patsiendid olema eelnevalt seotud (`Patient.link` element on täidetud).
- Pärast lahti sidumist on eemaldatakse lingid (`Patient.link`) kahe patsiendi vahel.
- Pärast lahti sidumist saab sekundaarset patsienti (source) uuesti siduda mõne teise primaarse patsiendiga (target).
- Kui patsiendid ei ole omavahel seotud, siis lahti sidumine ebaõnnestub ning edastatakse veateade. 
- Eesti isikukoodidega isikuid ei saa lahti siduda



### Patsientide sidumine TIS-i kaudu 
TIS võimaldab siduda patsiente, kus kehtivad samad reeglid ja piirangud, mis link operatsioonil. 

Selleks kasutatakse HL7 V3 sõnumit, mille info leiab [PRPA_IN201102UV01_PatientLivingSubject_Information_Revised_duplikaadid](https://akk.tehik.ee/public_data_structure/dubleerivate-patsientide-sidumine/1.0).

**NB!** TIS-i kaudu ei saa lahti siduda patsiente. 
