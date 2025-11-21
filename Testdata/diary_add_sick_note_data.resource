*** Settings ***
Documentation    This file has dictionaries for booking data used in test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.time=09:30
    ...    input.duration=30
    ...    input.reason=Sick Note - Medical Certificate

&{DEBTOR_INFO}
    ...    input.debtor.title=MR
    ...    input.debtor.surname=Smith
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AS
    ...    input.debtor.gender=Male
    ...    input.debtor.dob=1985-07-21
    ...    input.debtor.idnumber=8507215123085
    ...    input.debtor.cellno=0821234567
    ...    input.debtor.email=alex.smith@example.com
    ...    input.debtor.address=12 Main Street, Johannesburg

&{PATIENT_INFO}
    ...    input.patient.title=MR
    ...    input.patient.surname=Smith
    ...    input.patient.firstname=Alex
    ...    input.patient.initials=AS
    ...    input.patient.gender=Male
    ...    input.patient.dob=1985-07-21
    ...    input.patient.idnumber=8507215123085
    ...    input.patient.cellno=0821234567
    ...    input.patient.email=alex.smith@example.com
    ...    input.patient.address=12 Main Street, Johannesburg

&{SICK_NOTE_INFO}
    ...    input.date=2025-06-10
    ...    input.time=09:30
    ...    input.duration=30
    ...    input.reason=Flu symptoms
    ...    input.doctor=Dr. Carey
    ...    input.signature=DrCareySignature
    ...    input.qrcode=ENABLED

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, AS, Alex
    ...    cell_no=0821234567
    ...    timeslot=09:30
    ...    sick_note_reason=Flu symptoms
    ...    doctor=Dr. Carey
    ...    signature=DrCareySignature
    ...    qrcode=ENABLED