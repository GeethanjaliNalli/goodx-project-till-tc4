*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Smith
    ...    input.patient.initials=AS
    ...    input.patient.gender=Male
    ...    input.patient.dob=1990-05-14
    ...    input.patient.idnumber=9005145123087
    ...    input.patient.cell=0821234567
    ...    input.patient.email=alex.smith@example.com
    ...    input.patient.address=123 Main Street, Cape Town
    ...    input.patient.medicalaid=Discovery
    ...    input.patient.medicalaidno=1234567890

&{DEBTOR_INFO}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Smith
    ...    input.debtor.initials=AS
    ...    input.debtor.gender=Male
    ...    input.debtor.idnumber=9005145123087
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.smith@example.com
    ...    input.debtor.address=123 Main Street, Cape Town

&{BOOKING_INFO}
    ...    input.booking.date=2024-07-01
    ...    input.booking.time=10:30
    ...    input.booking.doctor=Dr John Carey
    ...    input.booking.reason=Sick Note
    ...    input.booking.status=Confirmed

&{SICK_NOTE_INFO}
    ...    input.sicknote.startdate=2024-07-01
    ...    input.sicknote.enddate=2024-07-03
    ...    input.sicknote.reason=Flu symptoms
    ...    input.sicknote.doctor=Dr John Carey
    ...    input.sicknote.signature=Enabled
    ...    input.sicknote.qrcode=Enabled
    ...    input.sicknote.email=Enabled
    ...    input.sicknote.print=Enabled

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, AS, Alex
    ...    cell_no=0821234567
    ...    sick_note_saved=True
    ...    email_log_recorded=True
    ...    print_log_recorded=True
    ...    qrcode_on_printout=True
