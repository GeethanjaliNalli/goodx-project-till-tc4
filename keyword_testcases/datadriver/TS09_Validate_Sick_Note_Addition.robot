*** Settings ***
Documentation    Data-driven suite to validate Sick Note addition, field validations, and error handling for a selected patient in the Diary module.
...              Ensures all mandatory fields, doctor signature, and patient details are validated with appropriate error messages.
Test Template    Validate Sick Note Addition For Patient
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=diary_add_sick_note_tc00006_datadriver

*** Test Cases ***
${test_case_name}
    [Template]    Validate Sick Note Addition For Patient

*** Keywords ***
Validate Sick Note Addition For Patient
    [Documentation]    Executes Sick Note addition and validates error handling for missing or invalid data for a patient booking.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    diary_add_sick_note_tc00006_datadriver
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${row_data}
    Open Sick Note Form
    Enter Sick Note Details    ${row_data}
    Run Keyword If    '${row_data}[Expected_Error_Message]' != ''    Validate Warning Alert Is Displayed    ${row_data}[Expected_Error_Message]
    ...    ELSE
    ...    Sign Sick Note
    ...    Send Sick Note By Email
    ...    Print Sick Note
    ...    Validate Sick Note Saved In Clinical Record
    ...    Validate Communication History Logs
