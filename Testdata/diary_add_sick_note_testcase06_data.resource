*** Settings ***
Documentation    This file contains test data dictionaries for TC00006_Diary_Add Sick note
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO}
    ...    input.patient.firstname=Michael
    ...    input.patient.surname=Smith
    ...    input.patient.initials=MS
    ...    select.patient.gender=Male
    ...    input.patient.dob=1985-04-22
    ...    select.patient.idtype=RSA ID
    ...    input.patient.idnumber=8504225123087
    ...    input.patient.cell=0831234567
    ...    input.patient.email=michael.smith@example.com
    ...    input.patient.address=45 Oak Avenue, Pretoria

&{DEBTOR_INFO}
    ...    input.debtor.firstname=Michael
    ...    input.debtor.surname=Smith
    ...    input.debtor.initials=MS
    ...    select.debtor.title=MR
    ...    input.debtor.cell=0831234567
    ...    input.debtor.email=michael.smith@example.com
    ...    input.debtor.address=45 Oak Avenue, Pretoria
    ...    select.debtor.idtype=RSA ID
    ...    input.debtor.idnumber=8504225123087

&{BOOKING_INFO}
    ...    input.booking.date=2024-07-01
    ...    input.booking.time=10:00
    ...    input.booking.doctor=Dr. Emily Jacobs
    ...    input.booking.location=Room 5, GoodX Clinic
    ...    input.booking.reason=Medical Certificate
    ...    select.booking.status=Booked

&{SICK_NOTE_INFO}
    ...    input.sicknote.start_date=2024-07-01
    ...    input.sicknote.end_date=2024-07-03
    ...    input.sicknote.diagnosis=Viral influenza
    ...    input.sicknote.comments=Patient to refrain from work and rest at home
    ...    input.sicknote.doctor_signature=Dr. Emily Jacobs
    ...    input.sicknote.qr_code=Enabled
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=Yes

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, MS, Michael
    ...    cell_no=0831234567
    ...    email=michael.smith@example.com
    ...    doctor=Dr. Emily Jacobs
    ...    diagnosis=Viral influenza
    ...    sicknote_period=2024-07-01 to 2024-07-03
    ...    qr_code=Enabled
    ...    communication_log=Email and Print recorded
    ...    clinical_record_status=Sick Note saved
