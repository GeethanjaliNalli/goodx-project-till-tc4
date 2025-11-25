*** Settings ***
Documentation    Data-driven suite to validate Sick Note creation, signing, emailing, and printing for a selected patient in the Diary module.
...              Ensures all patient, medical, and communication details are handled correctly.
Test Template    Validate Sick Note Creation For Patient
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=sick_note_details

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Validate Sick Note Creation For Patient

*** Keywords ***
Validate Sick Note Creation For Patient
    [Documentation]    Executes the end-to-end Sick Note creation, signing, emailing, and printing flow for a patient booking.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    sick_note_details
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${row_data}[PATIENT_BOOKING_INFO]
    Open Sick Note Form
    Enter Sick Note Details    ${row_data}[SICK_NOTE_DATA]
    Sign Sick Note
    Send Sick Note By Email
    Print Sick Note
    Validate Sick Note Saved In Clinical Record
    Validate Communication History Logs
