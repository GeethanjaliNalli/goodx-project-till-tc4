*** Settings ***
Documentation    Data-driven suite for validating Sick Note creation for a patient in Diary.
...              Each row provides Sick Note details for positive scenario.
Test Template    Validate Sick Note Creation For Patient
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=sick_note_details

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Validate Sick Note Creation For Patient

*** Keywords ***
Validate Sick Note Creation For Patient
    [Documentation]    Executes the steps to create and validate a Sick Note for a patient from test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    sick_note_details
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${row_data}[Booking_Time]
    Open Sick Note Form
    Enter Sick Note Details    ${row_data}[Sick_Note_Date]    ${row_data}[Sick_Note_Details]
    Save Sick Note
    Validate Sick Note Saved
