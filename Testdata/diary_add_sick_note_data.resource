*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.initials=AC
    ...    input.patient.gender=Male
    ...    input.patient.dob=1990-07-15
    ...    input.patient.id_number=9007155123081
    ...    input.patient.cell_no=0821234567
    ...    input.patient.email=alex.carey@example.com
    ...    input.patient.address=12 Main Street, Cape Town
    ...    input.patient.medical_aid=Discovery
    ...    input.patient.medical_aid_no=1234567890
    ...    input.patient.debtor_ref=DEB00123

&{DEBTOR_INFO}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.gender=Male
    ...    input.debtor.id_number=9007155123081
    ...    input.debtor.cell_no=0821234567
    ...    input.debtor.email=alex.carey@example.com
    ...    input.debtor.address=12 Main Street, Cape Town

&{SICK_NOTE_INFO}
    ...    input.sicknote.date=2024-06-01
    ...    input.sicknote.from_date=2024-06-01
    ...    input.sicknote.to_date=2024-06-03
    ...    input.sicknote.reason=Upper respiratory tract infection
    ...    input.sicknote.doctor=Dr. John Smith
    ...    input.sicknote.doctor_email=dr.smith@goodx.com
    ...    input.sicknote.signature=Enabled
    ...    input.sicknote.qr_code=Enabled

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    sick_note_saved=Yes
    ...    email_log_recorded=Yes
    ...    print_log_recorded=Yes
    ...    qr_code_on_printout=Yes
