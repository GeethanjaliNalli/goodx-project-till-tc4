*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_08 Validate Sick Note Can Be Created And Sent For Patient In Diary
    [Documentation]    Validates that a practitioner can create, sign, and send/print a Sick Note (Medical Certificate) for a selected patient from the Diary.
    ...    Ensures the Sick Note is saved in the patient’s clinical record and communication history, and QR code is present if enabled.
    ...    Preconditions: Patient booking exists, practitioner is logged in, debtor file and signature/email settings are configured.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_DATA}
    Sign Sick Note
    Send Or Print Sick Note
    Validate Sick Note Saved In Clinical Record
    Validate Sick Note Communication History
    Validate Sick Note QR Code On Printout
