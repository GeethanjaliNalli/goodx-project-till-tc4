*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) test data used in the Diary Add Sick Note test case.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
    ...    input.patient_name=MR GoodX, GQ, QZ_TestUser
    ...    input.patient_id=9001015050088
    ...    input.booking_date=2025-11-16
    ...    input.booking_time=14:30
    ...    input.doctor_name=Dr. John Smith
    ...    input.doctor_signature=DrJohnSmith_Signature.png
    ...    input.doctor_email=dr.johnsmith@clinic.com
    ...    input.reason=Medical Certificate - Sick Note
    ...    input.illness_description=Acute respiratory infection
    ...    input.sick_from=2025-11-16
    ...    input.sick_to=2025-11-18
    ...    input.days_off=3
    ...    select.qr_code_enabled=Yes
    ...    select.print_copy=Yes
    ...    select.email_copy=Yes
    ...    expected.save_status=Saved
    ...    expected.email_log=Email sent to patient
    ...    expected.print_log=Print action recorded
    ...    expected.qr_code=QR code present on printout

&{EXPECTED_SICK_NOTE_DATA}
    ...    clinical_record_entry=Medical Certificate - Sick Note
    ...    communication_history=Email sent; Print action recorded
    ...    qr_code_status=Present
