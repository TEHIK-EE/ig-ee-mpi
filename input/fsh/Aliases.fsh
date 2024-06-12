Alias: SCT = http://snomed.info/sct
Alias: UCUM = http://unitsofmeasure.org
Alias: LN = http://loinc.org
Alias: $ATC = urn:oid:2.16.840.1.113883.6.73
Alias: $SPECIALITY = urn:oid:1.3.6.1.4.1.28284.6.2.1.4.5
Alias: $PractROLE = urn:oid:1.3.6.1.4.1.28284.6.2.2.14.4

//Observation
Alias: INTERPETATION = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation
Alias: OBSCAT = http://terminology.hl7.org/CodeSystem/observation-category

//Patient
Alias: IdentityTypeCS =  http://terminology.hl7.org/CodeSystem/v2-0203
Alias: CountryVS = http://hl7.org/fhir/ValueSet/iso3166-1-2 
//Alias: BusinessRegister = https://ariregister.rik.ee
//Alias: ORGOID = urn:oid:1.3.6.1.4.1.28284.1

//Common extensions
Alias: $Extension-EEBase-ADS = https://hl7.ee/fhir/StructureDefinition/Extension-EEBase-ADS

/*
//Naming systems
Instance: pid-ni-est
InstanceOf: NamingSystem
Usage: #definition
* name = "Estonian Personal Identification Number"
* status = #draft
* kind = #identifier
* date = "2022-11-05T11:45:29.0437162+00:00"
* publisher = "HL7 EE"
* type =  http://terminology.hl7.org/CodeSystem/v2-0203#NI
* description = "The national identification number of Estonian citizens and residents."
* jurisdiction = urn:iso:std:iso:3166#EE
* usage = "Used in resources where the Estonian identification code for a person is needed."
* uniqueId[0]
  * type = #uri
  * value = "urn:pin:hl7.ee:pid:ni:est"
  * preferred = true
* uniqueId[+]
  * type = #uri
  * value = "https://hl7.ee/fhir/NamingSystem/pid-ni-est"
  * preferred = false
* uniqueId[+]
  * type = #oid
  * value = "urn:oid:1.3.6.1.4.1.28284.6.2.2.1"
  * preferred = false
*/