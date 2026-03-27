*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) data used in the Diary - Add Sick note test case.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_PATIENT_INFO}
    ...    input.patient_name=MR GoodX, GQ, QZ_TestUser
    ...    input.patient_id=9001015050088
    ...    input.gender=Male
    ...    input.dob=1990-01-01
    ...    input.medical_aid=HealthPlus
    ...    input.medical_aid_option=Gold
    ...    input.medical_aid_number=HP123459
    ...    input.cellphone=9987654321
    ...    input.email=goodx.qztestuser@example.com
    ...    input.address=123 Main Street, Johannesburg

&{SICK_NOTE_BOOKING_INFO}
    ...    select.type=Consultation
    ...    select.status=Booked
    ...    input.date=2025-11-16
    ...    input.time=09:15
    ...    input.duration=15
    ...    input.reason=Medical Support12

&{SICK_NOTE_DETAILS}
    ...    input.issued_date=2025-11-16
    ...    input.start_date=2025-11-16
    ...    input.end_date=2025-11-18
    ...    input.days_off=3
    ...    input.diagnosis=Acute bronchitis
    ...    input.notes=Patient is unfit for work/school for the above period.
    ...    select.signature=Dr. John Smith
    ...    input.signature_date=2025-11-16
    ...    input.qr_code_enabled=True
    ...    input.send_email=True
    ...    input.print_copy=True
    ...    input.doctor_email=dr.john.smith@example.com

&{SICK_NOTE_EXPECTED_RESULTS}
    ...    output.sick_note_saved=True
    ...    output.email_log_recorded=True
    ...    output.print_log_recorded=True
    ...    output.qr_code_present=True
    ...    output.validation_errors=None
