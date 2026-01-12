*** Settings ***
Documentation    Data-driven test for validating Sick Note creation, signing, and sending from Diary.
...              Uses multiple data sets to ensure robustness of Sick Note workflow.
Test Template    Validate Sick Note Creation From Diary
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=SickNote

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Validate Sick Note Creation From Diary

*** Keywords ***
Validate Sick Note Creation From Diary
    [Documentation]    Executes the end-to-end Sick Note creation and sending workflow using provided test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    SickNote
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${row_data}[input.time]
    Open Sick Note Form
    Enter Sick Note Details    ${row_data}
    Sign And Save Sick Note
    Send Or Print Sick Note
    Validate Sick Note Saved
