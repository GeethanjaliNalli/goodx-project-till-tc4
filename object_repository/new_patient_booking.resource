*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_FORM_LOCATORS}
    ...    input.patient.firstname=//input[@id='patient_firstname']
    ...    input.patient.surname=//input[@id='patient_surname']
    ...    input.patient.idnumber=//input[@id='patient_idnumber']
    ...    input.patient.cellno=//input[@id='patient_cellno']
    ...    input.reason=//textarea[@id='booking_reason']
    ...    button.save=//button[@id='save_booking']
    ...    button.close=//button[@id='close_booking']