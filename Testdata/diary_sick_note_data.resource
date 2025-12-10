*** Settings ***
Documentation    This file contains test data dictionaries for the Diary Sick Note (Medical Certificate) test case.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
    ...    input.sick_note_date=2025-12-10
    ...    input.reason=Medical Certificate for illness
    ...    select.event_type=SICK NOTE
    ...    doctor_signature=Dr. John Smith
    ...    email_subject=Sick Note for Patient
    ...    email_body=Please find attached the medical certificate for your records.
    ...    print_option=Yes
    ...    qr_code_enabled=True
