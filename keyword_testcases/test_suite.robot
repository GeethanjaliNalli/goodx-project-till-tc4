*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***

TC_09 Validate Sick Note Can Be Added And Verified For Patient In Diary
    [Documentation]    Validates that a practitioner can add a Sick Note (Medical Certificate) for a selected patient from the Diary module.
    ...    Ensures the Sick Note is saved in the patient’s clinical record, with email and print logs in communication history, and QR code on printout if enabled.
    ...    Confirms all mandatory fields, doctor signature, and patient details are handled correctly.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO}
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_INFO}
    Sign Sick Note
    Send Sick Note By Email
    Print Sick Note
    Validate Sick Note Saved In Clinical Record
    Validate Communication History Logs
