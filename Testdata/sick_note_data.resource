*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) test data used in the Diary - Add Sick note test case.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
    ...    input.patient_name=MR GoodX, GQ, QZ_TestUser
    ...    input.patient_id=9001015050088
    ...    input.booking_date=2025-11-16
    ...    input.booking_time=14:30
    ...    input.doctor_name=Dr. Jane Smith
    ...    input.doctor_signature=JaneSmithSignature.png
    ...    input.doctor_email=dr.jane.smith@goodxclinic.com
    ...    input.sick_note_date=2025-11-16
    ...    input.sick_note_start_date=2025-11-16
    ...    input.sick_note_end_date=2025-11-18
    ...    input.reason=Medical illness
    ...    input.duration=3
    ...    input.qr_code_enabled=True
    ...    select.delivery_method=Email, Print
    ...    expected.communication_log=Email sent, Printout generated
    ...    expected.qr_code_on_printout=True
    ...    expected.sick_note_saved=True
