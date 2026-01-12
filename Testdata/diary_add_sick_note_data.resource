*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Smith
    ...    input.patient.initials=AS
    ...    input.patient.gender=Male
    ...    input.patient.dob=1990-05-15
    ...    input.patient.idnumber=9005151234567
    ...    input.patient.cell=0821234567
    ...    input.patient.email=alex.smith@example.com

&{DEBTOR_INFO}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Smith
    ...    input.debtor.initials=AS
    ...    input.debtor.idnumber=9005151234567
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.smith@example.com
    ...    input.debtor.address=123 Main Road, Cape Town

&{BOOKING_INFO}
    ...    input.booking.date=2024-06-25
    ...    input.booking.time=09:30
    ...    input.booking.practitioner=Dr. Carey
    ...    input.booking.reason=Sick Note
    ...    input.booking.duration=30

&{SICK_NOTE_INFO}
    ...    input.sicknote.start_date=2024-06-25
    ...    input.sicknote.end_date=2024-06-27
    ...    input.sicknote.reason=Flu symptoms
    ...    input.sicknote.doctor=Dr. Carey
    ...    input.sicknote.signature=enabled
    ...    input.sicknote.qr_code=enabled

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, AS, Alex
    ...    cell_no=0821234567
    ...    sicknote_status=Saved
    ...    email_log=Recorded
    ...    print_log=Recorded
    ...    qr_code=Visible
