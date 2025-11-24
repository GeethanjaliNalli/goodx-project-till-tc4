*** Settings ***
Documentation    Data-driven test for verifying navigation in the About section.
...              Ensures navigation through all About section tabs and closure.
Test Template    Verify Navigation In About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSection

*** Test Cases ***
# robocop disable line
TC_03_Verify_Navigation_In_The_About_Section
    [Template]    Verify Navigation In About Section Template

*** Keywords ***
Verify Navigation In About Section Template
    [Documentation]    Template keyword to verify navigation in the About section using provided data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    AboutSection
    Open About Section
    Navigate To Company Tab
    Navigate To Terms Tab
    Navigate To Privacy Tab
    Close About Section
