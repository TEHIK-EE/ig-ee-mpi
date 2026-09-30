### Kirjeldus
Operatsioon on lubatud kõigile, autoriseerimine ei ole vajalik. Iga esitatud identifikaatori `system` kontrollitakse väärtushulga [patsiendi-identifikaatorite-domeen](https://akk.tehik.ee/classifier/fhir/ValueSet/patsiendi-identifikaatorite-domeen) vastu. Vastuses tagastatakse alati sama identifikaator, mis päringus, lisaks kas viide leitud patsiendile või `OperationOutcome` (kui patsienti ei leitud või identifikaatori süsteem ei ole lubatud).

### Päring 
