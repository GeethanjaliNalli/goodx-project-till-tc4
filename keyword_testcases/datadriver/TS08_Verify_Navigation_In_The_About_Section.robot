*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Ensures About dialog can be opened, tabs navigated, and closed.
Test Template    Verify About Section Navigation Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section_navigation

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Verify About Section Navigation Template

*** Keywords ***
Verify About Section Navigation Template
    [Documentation]    Opens the About section, navigates through all tabs, and closes the dialog.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section_navigation
    Open About Section
    Navigate To Overview Tab
    Navigate To License Tab
    Close About Section
