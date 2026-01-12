*** Settings ***
Documentation    Data-driven test for verifying navigation in the About section.
...              Ensures user can login, open About, navigate all tabs, and close dialog.
Test Template    Run Verify About Section Navigation Scenario
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSectionNavigation

*** Test Cases ***
# robocop disable line
Verify Navigation In The About Section
    [Template]    Run Verify About Section Navigation Scenario

*** Keywords ***
Run Verify About Section Navigation Scenario
    [Documentation]    Template keyword to run About section navigation scenario using provided data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    AboutSectionNavigation
    Verify About Section Navigation
