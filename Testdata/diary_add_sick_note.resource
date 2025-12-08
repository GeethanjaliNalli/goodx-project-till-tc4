*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) test data used in Diary Add Sick Note test cases.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
    ...    input.patient_name=MR GoodX, GQ, QZ_TestUser
    ...    input.date=2025-11-16
    ...    input.time=14:30
    ...    input.duration=30
    ...    input.reason=Medical Certificate
    ...    input.doctor_name=Dr. John Smith
    ...    input.doctor_signature=DrJohnSmithSignature
    ...    input.doctor_email=dr.john.smith@goodx.com
    ...    input.medical_aid=HealthPlus
    ...    input.medical_aid_option=Gold
    ...    input.medical_aid_number=HP123459
    ...    input.id_type=RSA ID
    ...    input.id_number=9001015050088
    ...    input.gender=Male
    ...    input.initials=GQ
    ...    input.title=MR
    ...    input.cellphone=9987654321
    ...    select.print_qr_code=Yes
    ...    select.send_email=Yes
    ...    select.print=Yes
    ...    select.status=Signed
    ...    select.type=Sick Note
    ...    select.module=DIARY
