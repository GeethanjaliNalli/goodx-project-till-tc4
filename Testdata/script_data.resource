*** Settings ***
Documentation    This file contains the dictionaries for script (prescription) data used in TC00007_Diary_Script test case.
Resource    ../common/super.resource

*** Variables ***
&{SCRIPT_DATA}
...    select.script.type=Acute
...    input.diagnosis=J06.9 (Acute upper respiratory infection)
...    input.medicine=Paracetamol 500mg Tablet
...    input.directions=Take 1 tablet orally every 6 hours as needed for pain
...    input.total.quantity=20
...    input.repeat.count=0
...    checkbox.not.substitutable=False
