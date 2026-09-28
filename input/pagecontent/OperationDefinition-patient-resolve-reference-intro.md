#### Kirjeldus
The operation is allowed for everyone, authorization is not required. The requesting organization is saved in the audit log based on the **x-road-client** HTTP header. Iga esitatud identifikaatori `system` kontrollitakse väärtushulga [patsiendi-identifikaatorite-domeen](https://akk.tehik.ee/classifier/fhir/ValueSet/patsiendi-identifikaatorite-domeen) vastu. Vastuses tagastatakse alati sama identifikaator, mis päringus, lisaks kas viide leitud patsiendile või `OperationOutcome` (kui patsienti ei leitud või identifikaatori süsteem ei ole lubatud).

### Päring 
