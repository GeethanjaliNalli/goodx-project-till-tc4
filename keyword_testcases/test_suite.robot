*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_08 Validate User Is Able To Add Sick Note In Diary
    [Documentation]    Validates that a user can create and verify a Sick Note (Medical Certificate) for a selected Patient in the Diary module.
    ...    Ensures the Sick Note is saved in the Patient’s Clinical record, communication logs are updated, and QR code is present on printout if enabled.
    ...    Preconditions: Valid patient booking exists, practitioner is logged in, patient has debtor file, and doctor’s signature/email settings are configured.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create And Verify Sick Note    &{SICK_NOTE_DATA}
