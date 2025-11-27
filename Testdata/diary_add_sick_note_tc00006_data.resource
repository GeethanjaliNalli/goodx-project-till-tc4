*** Settings ***
Documentation    This file contains dictionaries for TC00006_Diary_Add Sick note test case.
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO_TC00006}
    ...    input.patient.firstname=Michael
    ...    input.patient.surname=Daniels
    ...    input.patient.initials=MD
    ...    input.patient.gender=Male
    ...    input.patient.dob=1985-03-22
    ...    input.patient.idtype=RSA ID
    ...    input.patient.idnumber=8503225123085
    ...    input.patient.cell=0834567890
    ...    input.patient.email=michael.daniels@example.com
    ...    input.patient.address=45 Oak Avenue, Pretoria

&{DEBTOR_INFO_TC00006}
    ...    input.debtor.firstname=Michael
    ...    input.debtor.surname=Daniels
    ...    input.debtor.initials=MD
    ...    input.debtor.title=MR
    ...    input.debtor.cell=0834567890
    ...    input.debtor.email=michael.daniels@example.com
    ...    input.debtor.address=45 Oak Avenue, Pretoria
    ...    input.debtor.idtype=RSA ID
    ...    input.debtor.idnumber=8503225123085

&{BOOKING_INFO_TC00006}
    ...    input.booking.date=2024-07-15
    ...    input.booking.time=10:15
    ...    input.booking.doctor=Dr. Emily Carter
    ...    input.booking.location=Room 3, GoodX Clinic
    ...    input.booking.reason=Medical Certificate - Flu

&{SICK_NOTE_INFO_TC00006}
    ...    input.sicknote.start_date=2024-07-15
    ...    input.sicknote.end_date=2024-07-18
    ...    input.sicknote.diagnosis=Influenza with high fever
    ...    input.sicknote.comments=Patient unfit for work; advised rest, hydration, and follow-up if symptoms persist
    ...    input.sicknote.doctor_signature=Dr. Emily Carter
    ...    input.sicknote.qr_code=Enabled
    ...    input.sicknote.send_email=Yes
    ...    input.sicknote.print=Yes
    ...    input.sicknote.employer_name=ABC Logistics (Pty) Ltd
    ...    input.sicknote.occupation=Warehouse Supervisor
    ...    input.sicknote.work_status=Unfit for duty

&{EMAIL_INFO_TC00006}
    ...    input.email.to=michael.daniels@example.com
    ...    input.email.cc=hr@abclogistics.co.za
    ...    input.email.subject=Sick Note - Michael Daniels - 2024-07-15 to 2024-07-18
    ...    input.email.body=Please find attached the medical certificate for Michael Daniels covering the period 15-18 July 2024.

&{PRINT_INFO_TC00006}
    ...    select.print.destination=Default Clinic Printer
    ...    select.print.copies=1
    ...    check.print.include_qr_code=Yes

&{EXPECTED_DATA_TC00006}
    ...    debtor_name=MR Daniels, MD, Michael
    ...    cell_no=0834567890
    ...    email=michael.daniels@example.com
    ...    doctor=Dr. Emily Carter
    ...    diagnosis=Influenza with high fever
    ...    sicknote_period=2024-07-15 to 2024-07-18
    ...    qr_code=Enabled
    ...    work_status=Unfit for duty
    ...    employer_name=ABC Logistics (Pty) Ltd
    ...    email_subject=Sick Note - Michael Daniels - 2024-07-15 to 2024-07-18
    ...    email_sent=Yes
    ...    printed=Yes
