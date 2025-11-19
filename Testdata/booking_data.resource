*** Settings ***
Documentation    This file contains the dictionaries for booking data used in the test cases.
Resource    ../common/super.resource

*** Variables ***
&{BOOKING_INFO}
    ...    select.type=Consultation
    ...    select.status=Booked
    ...    input.time=09:15
    ...    input.duration=15
    ...    input.reason=Medical Support12

&{DEBTOR_INFO}
    ...    input.names=QZ_TestUser
    ...    input.debtor.surname=GoodX
    ...    input.cellphone=9987654321
    ...    select.idtype=RSA ID
    ...    input.idnumber=9001015050088
    ...    input.medicalaid=HealthPlus
    ...    input.maoption=Gold
    ...    input.manumber=HP123459
    ...    select.gender=Male
    ...    input.initials=GQ
    ...    select.title=MR
    
&{DEBTOR_WITHOUT_NAME}
    ...    input.debtor.surname=Smith
    ...    input.cellphone=1234567890
    ...    select.idtype=RSA ID
    ...    input.idnumber=9001015050080
    ...    input.medicalaid=HealthPlus
    ...    input.maoption=Gold
    ...    input.manumber=HP123456
    ...    select.gender=Male
    ...    input.initials=J.S.
    ...    select.title=MR

&{PATIENT_INFO}
    ...    input.date=2025-11-16
    ...    input.time=14:30
    ...    input.duration=30
    ...    input.reason=Need wheelchair support

&{EXPECTED_DATA}
    ...    debtor_name=MR GoodX, GQ, QZ_TestUser
    ...    cell_no=9987654321