*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.initials=AC
    ...    input.patient.gender=Male
    ...    input.patient.dob=1990-06-15
    ...    input.patient.idtype=RSA ID
    ...    input.patient.idnumber=9006155123081
    ...    input.patient.cell=0823456789
    ...    input.patient.email=alex.carey@example.com
    ...    input.patient.address=123 Main Street, Johannesburg

&{DEBTOR_INFO}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.title=MR
    ...    input.debtor.cell=0823456789
    ...    input.debtor.email=alex.carey@example.com
    ...    input.debtor.address=123 Main Street, Johannesburg
    ...    input.debtor.idtype=RSA ID
    ...    input.debtor.idnumber=9006155123081

&{BOOKING_INFO}
    ...    input.booking.date=2024-06-10
    ...    input.booking.time=09:30
    ...    input.booking.doctor=Dr. John Smith
    ...    input.booking.location=Room 2, GoodX Clinic
    ...    input.booking.reason=Sick Note

&{SICK_NOTE_INFO}
    ...    input.sicknote.start_date=2024-06-10
    ...    input.sicknote.end_date=2024-06-12
    ...    input.sicknote.diagnosis=Acute bronchitis
    ...    input.sicknote.comments=Patient advised to rest and avoid strenuous activity
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    input.sicknote.qr_code=Enabled
    ...    input.sicknote.send_email=Yes
    ...    input.sicknote.print=Yes

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0823456789
    ...    email=alex.carey@example.com
    ...    doctor=Dr. John Smith
    ...    diagnosis=Acute bronchitis
    ...    sicknote_period=2024-06-10 to 2024-06-12
    ...    qr_code=Enabled
