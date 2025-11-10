*** Settings ***
Documentation    This suite validates login functionality by testing invalid username and password scenarios.
...              It launches the application, performs login, and verifies that the correct error messages are displayed.
Test Template   Validate Login Functionality With Invalid Credentails
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=login_Details


*** Test Cases ***
# robocop: disable=too-few-calls-in-test-case,not-capitalized-test-case-title
${test_case_name}
    [Template]    Validate Login Functionality With Invalid Credentails


*** Keywords ***
Validate Login Functionality With Invalid Credentails
    [Documentation]    Launches the application, performs login with invalid username or password,
    ...                and validates that the correct error message is displayed.
    [Arguments]    ${test_case_name}
    ${login_details}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    login_Details
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${login_details}[Username]    ${login_details}[Password]
    Validate Error Message Is Displayed    ${login_details}[Error_Message]
