*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_06 Validate Sick Note Creation And Sending From Diary
    [Documentation]    Validate that a practitioner can create, sign, and send or print a Sick Note (Medical Certificate) for a selected patient from the Diary module.
    ...    Ensures all patient, medical, and signature details are correctly populated and saved.
    ...    Confirms the Sick Note is recorded in the patient’s clinical record and communication history.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_DATA}
    Sign And Save Sick Note
    Send Or Print Sick Note
    Validate Sick Note Saved
