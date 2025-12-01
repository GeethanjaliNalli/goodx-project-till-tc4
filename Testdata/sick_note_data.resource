*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) data used in the Diary - Add Sick note test case.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
    ...    input.patient_name=MR GoodX, GQ, QZ_TestUser
    ...    input.patient_id=9001015050088
    ...    input.booking_date=2025-11-16
    ...    input.booking_time=14:30
    ...    input.doctor_name=Dr. John Smith
    ...    input.doctor_signature=JohnSmith_Signature.png
    ...    input.doctor_email=dr.john.smith@goodx.com
    ...    input.sick_note_date=2025-11-16
    ...    input.sick_note_from=2025-11-16
    ...    input.sick_note_to=2025-11-18
    ...    input.reason=Medical illness
    ...    input.qr_code_enabled=True
    ...    input.notes=Patient is unfit for work due to medical condition.

&{EXPECTED_SICK_NOTE_DATA}
    ...    saved_in_clinical_record=True
    ...    email_log_recorded=True
    ...    print_log_recorded=True
    ...    qr_code_on_printout=True
    ...    communication_history_updated=True
