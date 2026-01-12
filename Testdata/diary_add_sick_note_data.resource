*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.initials=AC
    ...    input.patient.gender=Male
    ...    input.patient.dob=1990-05-15
    ...    input.patient.id=9005151234567
    ...    input.patient.cell=0821234567
    ...    input.patient.email=alex.carey@example.com
    ...    input.patient.address=123 Main Street, Johannesburg
    ...    input.patient.title=MR

&{DEBTOR_INFO}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.gender=Male
    ...    input.debtor.dob=1990-05-15
    ...    input.debtor.id=9005151234567
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.carey@example.com
    ...    input.debtor.address=123 Main Street, Johannesburg
    ...    input.debtor.title=MR

&{BOOKING_INFO}
    ...    input.booking.date=2024-06-24
    ...    input.booking.time=10:30
    ...    input.booking.doctor=Dr. Smith
    ...    input.booking.reason=Sick Note
    ...    input.booking.status=Confirmed

&{SICK_NOTE_DATA}
    ...    input.sicknote.start_date=2024-06-24
    ...    input.sicknote.end_date=2024-06-27
    ...    input.sicknote.diagnosis=Acute bronchitis
    ...    input.sicknote.comments=Patient unfit for work for 3 days
    ...    input.sicknote.signature=Dr. Smith
    ...    input.sicknote.email_to=alex.carey@example.com
    ...    input.sicknote.print_copy=Yes
    ...    input.sicknote.qr_code=Enabled

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    email=alex.carey@example.com
    ...    diagnosis=Acute bronchitis
    ...    sicknote_period=2024-06-24 to 2024-06-27
    ...    doctor_signature=Dr. Smith
    ...    qr_code=Enabled
