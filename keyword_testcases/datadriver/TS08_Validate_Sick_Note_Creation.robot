*** Settings ***
Documentation    Data-driven test for validating Sick Note creation, signing, and sending/printing for a patient in the Diary.
...              Ensures all key fields, communication logs, and QR code (if enabled) are validated.
Test Template    Validate Sick Note Creation For Patient
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=sick_note_details

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Validate Sick Note Creation For Patient

*** Keywords ***
Validate Sick Note Creation For Patient
    [Documentation]    Executes the end-to-end Sick Note creation, signing, and sending/printing flow for the provided patient data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    sick_note_details
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${row_data}[input.time]
    Open Sick Note Form
    Enter Sick Note Details    ${row_data}
    Sign Sick Note
    Send Or Print Sick Note
    Validate Sick Note Saved In Clinical Record
    Validate Sick Note Communication History
    Validate Sick Note QR Code On Printout
