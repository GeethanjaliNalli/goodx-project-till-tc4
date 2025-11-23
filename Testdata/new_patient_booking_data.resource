*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{PATIENT_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.idnumber=9001015800081
    ...    input.patient.cellno=0821234567

&{BOOKING_INFO}
    ...    input.reason=Consultation for recurring headaches

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=09:00 - 09:30