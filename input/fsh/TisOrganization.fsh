Instance: ExampleHospital
InstanceOf: Organization
Description: "Example of organization Org1"
Usage: #example
* id = "Org1"
* name = "General Hospital"
* identifier.system = "https://fhir.ee/sid/org/est/br"
* identifier.value = "1234567"
* alias = "Hospital"
* contact
  * telecom.system = #email
  * telecom.value = "info@hospital.ee"
  * address.line = "Ravi 10"
  * address.city = "Tallinn"
