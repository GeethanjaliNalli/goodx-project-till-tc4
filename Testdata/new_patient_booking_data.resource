*** Settings ***
Documentation    This file has dictionaries for booking data used in test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.time=09:30
    ...    input.duration=30
    ...    input.reason=Initial consultation

&{DEBTOR_INFO}
    ...    input.debtor.title=MR
    ...    input.debtor.surname=Smith
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AS
    ...    input.debtor.idnumber=8001015009087
    ...    input.debtor.gender=Male
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.smith@email.com

&{PATIENT_INFO}
    ...    input.patient.title=MR
    ...    input.patient.surname=Smith
    ...    input.patient.firstname=Alex
    ...    input.patient.initials=AS
    ...    input.patient.idnumber=8001015009087
    ...    input.patient.gender=Male
    ...    input.patient.cell=0821234567
    ...    input.patient.email=alex.smith@email.com

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, AS, Alex
    ...    cell_no=0821234567
    ...    timeslot=09:30
