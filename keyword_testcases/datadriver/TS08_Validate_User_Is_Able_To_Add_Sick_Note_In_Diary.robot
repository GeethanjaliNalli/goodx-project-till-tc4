*** Settings ***
Documentation    Data-driven suite for validating Sick Note creation in Diary.
...              Ensures Sick Note is saved, communication logs are updated, and QR code is present if enabled.
Test Template    Create And Verify Sick Note Data Driven
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=sick_note_details

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Create And Verify Sick Note Data Driven

*** Keywords ***
Create And Verify Sick Note Data Driven
    [Documentation]    Creates and verifies a Sick Note for a selected patient in Diary using data-driven approach.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    sick_note_details
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${row_data}[input.time]
    Create And Verify Sick Note    &{row_data}
