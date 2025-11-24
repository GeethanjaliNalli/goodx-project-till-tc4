*** Settings ***
Documentation    Data-driven test for verifying navigation in the About section.
...              Ensures all About tabs are accessible and the dialog can be closed.
Test Template    Execute Verify Navigation In The About Section
Resource    ../../../common/super.resource
Resource    ../../../keywords/about_section.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSection

*** Test Cases ***
# robocop disable line
Verify Navigation In The About Section
    [Template]    Execute Verify Navigation In The About Section

*** Keywords ***
Execute Verify Navigation In The About Section
    [Documentation]    Executes navigation and validation for all About section tabs and closes the dialog.
    [Arguments]    ${test_case_name}
    Navigate All About Tabs
    Close About Section
