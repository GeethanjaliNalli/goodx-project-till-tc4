*** Settings ***
Documentation    Data-driven validation of Sick Note creation, signing, and communication for a patient from the Diary.
...              Ensures clinical record, communication history, and QR code (if enabled) are correctly handled.
Test Template    Validate Sick Note Creation For Patient
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=SickNote

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Validate Sick Note Creation For Patient

*** Keywords ***
Validate Sick Note Creation For Patient
    [Documentation]    Executes the end-to-end Sick Note creation, signing, and communication validation for a patient using provided test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    SickNote
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${row_data}[input.time]
    Open Sick Note Form
    Enter Sick Note Details    ${row_data}[SICK_NOTE_DATA]
    Sign And Save Sick Note
    Send Or Print Sick Note
    Validate Sick Note Saved In Clinical Record
    Validate Communication History Updated
    Validate QR Code On Printout
