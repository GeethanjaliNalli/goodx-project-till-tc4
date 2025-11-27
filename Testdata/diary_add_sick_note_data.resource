*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO}
    ...    input.patient.firstname=Michael
    ...    input.patient.surname=Ngubane
    ...    input.patient.initials=MN
    ...    select.patient.gender=Male
    ...    input.patient.dob=1985-02-21
    ...    select.patient.idtype=RSA ID
    ...    input.patient.idnumber=8502215123082
    ...    input.patient.cell=0712345678
    ...    input.patient.email=michael.ngubane@example.com
    ...    input.patient.address=45 Rose Avenue, Pretoria

&{DEBTOR_INFO}
    ...    input.debtor.firstname=Michael
    ...    input.debtor.surname=Ngubane
    ...    input.debtor.initials=MN
    ...    select.debtor.title=MR
    ...    input.debtor.cell=0712345678
    ...    input.debtor.email=michael.ngubane@example.com
    ...    input.debtor.address=45 Rose Avenue, Pretoria
    ...    select.debtor.idtype=RSA ID
    ...    input.debtor.idnumber=8502215123082

&{BOOKING_INFO}
    ...    input.booking.date=2024-07-12
    ...    input.booking.time=10:45
    ...    input.booking.doctor=Dr. Lerato Mokoena
    ...    input.booking.location=Room 3, GoodX Clinic
    ...    input.booking.reason=Sick Note

&{SICK_NOTE_INFO}
    ...    input.sicknote.start_date=2024-07-12
    ...    input.sicknote.end_date=2024-07-15
    ...    input.sicknote.diagnosis=Influenza
    ...    input.sicknote.comments=Patient requires rest and is unfit for work
    ...    input.sicknote.doctor_signature=Dr. Lerato Mokoena
    ...    input.sicknote.qr_code=Enabled
    ...    input.sicknote.send_email=Yes
    ...    input.sicknote.print=Yes

&{EXPECTED_DATA}
    ...    debtor_name=MR Ngubane, MN, Michael
    ...    cell_no=0712345678
    ...    email=michael.ngubane@example.com
    ...    doctor=Dr. Lerato Mokoena
    ...    diagnosis=Influenza
    ...    sicknote_period=2024-07-12 to 2024-07-15
    ...    qr_code=Enabled
