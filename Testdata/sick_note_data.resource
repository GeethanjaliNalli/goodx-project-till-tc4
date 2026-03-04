*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) test data used in Diary module test cases.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_PATIENT_INFO}
    ...    input.patient_name=MR GoodX, GQ, QZ_TestUser
    ...    input.patient_id=9001015050088
    ...    input.gender=Male
    ...    input.dob=1990-01-01
    ...    input.contact_no=9987654321
    ...    input.medical_aid=HealthPlus
    ...    input.medical_aid_option=Gold
    ...    input.medical_aid_number=HP123459
    ...    input.email=goodx.qztestuser@example.com
    ...    input.address=123 Test Street, Testville

&{SICK_NOTE_BOOKING_INFO}
    ...    select.type=Consultation
    ...    select.status=Booked
    ...    input.date=2025-11-16
    ...    input.time=09:15
    ...    input.duration=15
    ...    input.reason=Medical Certificate

&{SICK_NOTE_DOCTOR_INFO}
    ...    input.doctor_name=Dr. John Smith
    ...    input.practice_no=MP1234567
    ...    input.signature=DrJohnSmith_Signature.png
    ...    input.email=dr.johnsmith@example.com
    ...    input.signature_configured=True
    ...    input.email_configured=True

&{SICK_NOTE_DETAILS}
    ...    input.issued_date=2025-11-16
    ...    input.sick_from=2025-11-16
    ...    input.sick_to=2025-11-18
    ...    input.days=3
    ...    input.diagnosis=Acute bronchitis
    ...    input.comments=Patient advised to rest and avoid strenuous activity.
    ...    select.qr_code_enabled=True
    ...    select.send_email=True
    ...    select.print=True

&{SICK_NOTE_EXPECTED_RESULTS}
    ...    status=Created
    ...    saved_in_clinical_record=True
    ...    email_log_recorded=True
    ...    print_log_recorded=True
    ...    qr_code_present=True
    ...    validation_errors=None
