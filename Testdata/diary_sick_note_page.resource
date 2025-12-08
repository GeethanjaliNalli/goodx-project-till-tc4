*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) test data used in Diary module test cases.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
    ...    input.date=2025-12-08
    ...    input.reason=Medical certificate for illness
    ...    input.duration=2
    ...    select.type=SICK NOTE
    ...    doctor.signature=Dr. GoodX
    ...    doctor.email=doctor.goodx@example.com
    ...    patient.fullname=MR GoodX, GQ, QZ_TestUser
    ...    patient.id=9001015050088
    ...    patient.gender=Male
    ...    patient.cellphone=9987654321
    ...    print.qr_code_enabled=True
    ...    print.include_signature=True
    ...    email.send_to=patient.goodx@example.com
    ...    email.subject=Sick Note - Medical Certificate
    ...    email.body=Please find attached your medical certificate.
