*** Settings ***
Documentation    This file has dictionaries for booking data used in test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.time=09:30
    ...    input.duration=30
    ...    input.reason=Medical Certificate - Sick Note

&{DEBTOR_INFO}
    ...    input.debtor.surname=Smith
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AS
    ...    input.debtor.idnumber=9001015800081
    ...    input.debtor.gender=Male
    ...    input.debtor.title=MR
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.smith@example.com
    ...    input.debtor.address=12 Main Street, Johannesburg

&{PATIENT_INFO}
    ...    input.patient.surname=Smith
    ...    input.patient.firstname=Alex
    ...    input.patient.initials=AS
    ...    input.patient.idnumber=9001015800081
    ...    input.patient.gender=Male
    ...    input.patient.title=MR
    ...    input.patient.cell=0821234567
    ...    input.patient.email=alex.smith@example.com
    ...    input.patient.address=12 Main Street, Johannesburg
    ...    input.patient.dob=1990-01-01

&{SICK_NOTE_INFO}
    ...    input.sicknote.date=2025-06-12
    ...    input.sicknote.reason=Flu and fever
    ...    input.sicknote.doctor=Dr. Carey
    ...    input.sicknote.signature=DrCareySignature
    ...    input.sicknote.qrcode=Enabled

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, AS, Alex
    ...    cell_no=0821234567
    ...    timeslot=09:30
    ...    sicknote_reason=Flu and fever
    ...    doctor=Dr. Carey
    ...    qrcode=Enabled