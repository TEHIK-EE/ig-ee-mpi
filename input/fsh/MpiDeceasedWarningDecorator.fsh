Alias: $mpi = https://mpi.tehik.ee

Instance: DeceasedWarning
InstanceOf: OperationOutcome
Usage: #example

* text.status = #additional
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p><b>Severity:</b> warning</p>
  <p><b>Code:</b> informational</p>
  <p><b>Details.coding.system:</b> https://mpi.tehik.ee</p>
  <p><b>Details.coding.code:</b> MPI-101</p>
  <p><b>Details.text:</b> Patsient on surnud</p>
</div>
"""

* issue[0].severity = #warning
* issue[0].code = #informational
* issue[0].details.coding[0].system = $mpi
* issue[0].details.coding[0].code = #MPI-101
* issue[0].details.text = "Patsient on surnud"
