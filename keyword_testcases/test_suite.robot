*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_06 Validate Sick Note Creation And Communication For Patient
    [Documentation]    Validate that a practitioner can create, sign, and send or print a Sick Note (Medical Certificate) for a selected patient from the Diary.
    ...    Ensure the Sick Note is saved in the patient’s clinical record and communication history is updated accordingly.
    ...    Confirm QR code appears on printout if enabled and no validation errors occur.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_DATA}
    Sign And Save Sick Note
    Send Or Print Sick Note
    Validate Sick Note Saved In Clinical Record
    Validate Communication History Updated
    Validate QR Code On Printout
