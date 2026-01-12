*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO}
    ...    input.firstname=Alex
    ...    input.surname=Carey
    ...    input.initials=AC
    ...    select.gender=Male
    ...    select.title=MR
    ...    input.dob=1990-05-15
    ...    input.idnumber=9005151234567
    ...    input.cell=0821234567
    ...    input.email=alex.carey@example.com
    ...    input.address=123 Main Street, Johannesburg

&{DEBTOR_INFO}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.idnumber=9005151234567
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.carey@example.com
    ...    input.debtor.address=123 Main Street, Johannesburg

&{BOOKING_INFO}
    ...    input.booking.date=2024-06-17
    ...    input.booking.time=09:30
    ...    input.booking.doctor=Dr. Smith
    ...    input.booking.reason=Sick Note
    ...    input.booking.status=Confirmed

&{SICK_NOTE_INFO}
    ...    input.sicknote.startdate=2024-06-17
    ...    input.sicknote.enddate=2024-06-19
    ...    input.sicknote.diagnosis=Upper respiratory tract infection
    ...    input.sicknote.comments=Patient to rest for 3 days
    ...    checkbox.sicknote.fitforwork=No
    ...    input.sicknote.doctor=Dr. Smith
    ...    input.sicknote.signature=DrSmithSignature.png
    ...    input.sicknote.qrcode=Enabled

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    email=alex.carey@example.com
    ...    doctor=Dr. Smith
    ...    sicknote_period=2024-06-17 to 2024-06-19
    ...    diagnosis=Upper respiratory tract infection
    ...    signature=DrSmithSignature.png
    ...    qrcode=Enabled
