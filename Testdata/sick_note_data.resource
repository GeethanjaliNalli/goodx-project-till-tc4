*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) data used in the Diary - Add Sick note test case.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_DATA}
...    select.forms_library=SICK NOTE
...    input.sick_note_date=2025-12-04
...    input.unfit_from=2025-12-04
...    input.unfit_to=2025-12-06
...    input.light_duty_from=2025-12-07
...    input.light_duty_to=2025-12-08
...    input.extra_information=Patient recovering from flu, advised rest
...    input.doctor_pin=1234
