*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) test data used in Diary Add Sick Note test cases.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
    ...    input.patient_name=QZ_TestUser GoodX
    ...    input.debtor_id=9001015050088
    ...    input.date_of_birth=1990-01-01
    ...    input.gender=Male
    ...    input.doctor_name=Dr. John Smith
    ...    input.doctor_signature=DrJohnSignature.png
    ...    input.doctor_email=dr.john.smith@goodx.com
    ...    input.sick_note_date=2025-11-28
    ...    input.start_date=2025-11-28
    ...    input.end_date=2025-12-02
    ...    input.days_off=5
    ...    input.reason=Medical illness
    ...    input.clinical_notes=Patient unfit for work due to flu-like symptoms.
    ...    select.qr_code=Enabled
    ...    select.email_to_patient=Yes
    ...    select.print_copy=Yes
    ...    expected.save_status=Success
    ...    expected.email_log=Email sent to patient
    ...    expected.print_log=Printout generated
    ...    expected.qr_code_on_print=Yes
