*** Settings ***
Documentation    Data-driven suite for validating Sick Note (Medical Certificate) creation for a patient booking.
...              Ensures Sick Note is saved, logs are recorded, and QR code is present if enabled.
Test Template    Create And Verify Sick Note For Patient
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=diary_add_sick_note

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Create And Verify Sick Note For Patient

*** Keywords ***
Create And Verify Sick Note For Patient
    [Documentation]    Performs the complete flow to create and verify a Sick Note for a selected patient booking.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    diary_add_sick_note
    Open Diary Module
    Select Patient Booking
    Open Clinical Forms
    Select Sick Note Form
    Enter Sick Note Details
    Save Sick Note Form
    Validate Sick Note Saved In Clinical Record
    Validate Email And Print Logs Recorded
    Validate QR Code On Printout If Enabled
