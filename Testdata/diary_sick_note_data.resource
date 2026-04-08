*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) test data used in the Diary - Add Sick Note test case.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_DATA}
    ...    input.sick_note_date=2025-12-11
    ...    input.unfit_for_work=2025-12-11
    ...    select.form_type=SICK NOTE
    ...    reason=Medical illness
    ...    doctor_signature=Dr. John Smith
    ...    email_to=patient.email@example.com
    ...    print_option=Yes
    ...    qr_code_enabled=True
