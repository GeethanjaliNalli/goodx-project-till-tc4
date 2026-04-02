*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) data used in the Diary - Add Sick note test cases.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
    ...    input.patient_name=MR GoodX, GQ, QZ_TestUser
    ...    input.patient_id=9001015050088
    ...    input.booking_date=2025-11-16
    ...    input.booking_time=14:30
    ...    input.doctor_name=Dr. John Practitioner
    ...    input.doctor_signature=DrJohnSig.png
    ...    input.doctor_email=doctor@goodx.com
    ...    input.reason=Medical Certificate - Sick Note
    ...    input.sick_from=2025-11-16
    ...    input.sick_to=2025-11-18
    ...    input.diagnosis=Acute bronchitis
    ...    input.recommendations=Rest at home, avoid strenuous activity
    ...    select.include_qr_code=Yes
    ...    select.send_email=Yes
    ...    select.print=Yes
    ...    expected.clinical_record_entry=Yes
    ...    expected.email_log=Yes
    ...    expected.print_log=Yes
    ...    expected.qr_code_on_printout=Yes
