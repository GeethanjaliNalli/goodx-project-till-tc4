*** Settings ***
Documentation    Data-driven test for verifying navigation in the About section.
...              Ensures user can navigate all About tabs and close the dialog.
Test Template    Verify Navigation In About Section Template
Resource    ../../../common/super.resource
Resource    ../../../keywords/about_section_navigation.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSectionNavigation

*** Test Cases ***
# robocop disable line
TC_03 Verify Navigation In The About Section
    [Template]    Verify Navigation In About Section Template

*** Keywords ***
Verify Navigation In About Section Template
    [Documentation]    Template for verifying navigation in the About section using DataDriver.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    AboutSectionNavigation
    Open About Section
    Navigate To Company Tab
    Navigate To Team Tab
    Navigate To Legal Tab
    Navigate To Privacy Tab
    Close About Section
