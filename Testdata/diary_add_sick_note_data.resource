*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***

&{PATIENT_INFO}
    ...    input.firstname=Alex
    ...    input.surname=Carey
    ...    input.initials=AC
    ...    input.gender=Male
    ...    input.dob=1990-04-15
    ...    input.idnumber=9004151234567
    ...    input.email=alex.carey@example.com
    ...    input.cell=0821234567
    ...    input.address=123 Main Street, Johannesburg

&{DEBTOR_INFO}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.idnumber=9004151234567
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.carey@example.com
    ...    input.debtor.address=123 Main Street, Johannesburg

&{BOOKING_INFO}
    ...    input.booking.date=2024-06-25
    ...    input.booking.time=10:30
    ...    input.booking.doctor=Dr Smith
    ...    input.booking.reason=Sick Note
    ...    input.booking.status=Confirmed

&{SICK_NOTE_DATA}
    ...    input.sicknote.startdate=2024-06-25
    ...    input.sicknote.enddate=2024-06-27
    ...    input.sicknote.reason=Flu symptoms
    ...    input.sicknote.doctor=Dr Smith
    ...    input.sicknote.signature=Dr Smith
    ...    input.sicknote.qrcode=Enabled

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    email=alex.carey@example.com
    ...    doctor=Dr Smith
    ...    sicknote_dates=2024-06-25 to 2024-06-27
    ...    reason=Flu symptoms
    ...    qrcode=Enabled
