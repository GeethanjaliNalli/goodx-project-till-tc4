*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Ensures user can access and navigate all About tabs and close the dialog.
Test Template    Verify About Section Navigation Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSectionNavigation

*** Test Cases ***
# robocop disable line
Verify Navigation In The About Section
    [Template]    Verify About Section Navigation Template

*** Keywords ***
Verify About Section Navigation Template
    [Documentation]    Template to verify About section navigation using provided test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    AboutSectionNavigation
    Open About Section
    Navigate All About Tabs
    Close About Section
