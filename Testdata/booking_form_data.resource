*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.idnumber=9001015800081
    ...    input.patient.cellno=0821234567
    ...    input.reason=Consultation
    ...    input.time=09:00
    ...    input.duration=30

&{BOOKING_INFO_MISSING_NAME}
    ...    input.patient.firstname=
    ...    input.patient.surname=
    ...    input.patient.idnumber=9001015800081
    ...    input.patient.cellno=0821234567
    ...    input.reason=Consultation
    ...    input.time=09:00
    ...    input.duration=30

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=09:00 - 09:30
