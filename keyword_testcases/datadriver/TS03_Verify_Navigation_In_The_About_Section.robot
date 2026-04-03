*** Settings ***
Documentation    Data-driven test for verifying navigation in the About section.
...              Ensures navigation through all About tabs and closing the section.
Test Template    Execute About Section Navigation Test
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSectionNavigation

*** Test Cases ***
# robocop disable line
Verify Navigation In The About Section
    [Template]    Execute About Section Navigation Test

*** Keywords ***
Execute About Section Navigation Test
    [Documentation]    Executes the navigation flow for the About section using provided data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    AboutSectionNavigation
    Verify About Section Navigation
