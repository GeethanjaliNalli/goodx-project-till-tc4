*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Ensures all About section tabs are accessible and the dialog can be closed.
Test Template    Execute About Section Navigation
Resource    ../../../common/super.resource
Resource    ../../../keywords/about_section.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSectionNavigation

*** Test Cases ***
# robocop disable line
Verify Navigation In The About Section
    [Template]    Execute About Section Navigation

*** Keywords ***
Execute About Section Navigation
    [Documentation]    Template keyword to verify navigation in the About section using data-driven approach.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    AboutSectionNavigation
    Navigate All About Tabs
