*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) data used in Diary - Add Sick note test cases.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_PATIENT_INFO}
    ...    patient.first_name=QZ_TestUser
    ...    patient.surname=GoodX
    ...    patient.gender=Male
    ...    patient.dob=1990-01-01
    ...    patient.id_type=RSA ID
    ...    patient.id_number=9001015050088
    ...    patient.medical_aid=HealthPlus
    ...    patient.medical_aid_option=Gold
    ...    patient.medical_aid_number=HP123459
    ...    patient.cellphone=9987654321
    ...    patient.email=qz_testuser@goodx.com
    ...    patient.address=123 Test Street, Cape Town
    ...    patient.title=MR
    ...    patient.initials=GQ

&{SICK_NOTE_BOOKING_INFO}
    ...    booking.type=Consultation
    ...    booking.status=Booked
    ...    booking.date=2025-12-01
    ...    booking.time=09:15
    ...    booking.duration=15
    ...    booking.reason=Medical Certificate

&{SICK_NOTE_DETAILS}
    ...    sick_note.issue_date=2025-12-01
    ...    sick_note.start_date=2025-12-01
    ...    sick_note.end_date=2025-12-03
    ...    sick_note.diagnosis=Upper Respiratory Tract Infection
    ...    sick_note.comments=Patient advised to rest for 2 days.
    ...    sick_note.doctor_name=Dr. John Smith
    ...    sick_note.doctor_practice_no=MP1234567
    ...    sick_note.doctor_signature=DrJohnSmithSignature.png
    ...    sick_note.doctor_email=dr.john@goodx.com
    ...    sick_note.qr_code_enabled=True

&{SICK_NOTE_EXPECTED_DATA}
    ...    expected.status=Created
    ...    expected.signed=True
    ...    expected.sent_email=True
    ...    expected.printed=True
    ...    expected.saved_in_clinical_record=True
    ...    expected.qr_code_present=True
    ...    expected.validation_errors=None
