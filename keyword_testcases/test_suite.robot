*** Settings ***
Documentation    This File has all the Test Cases related to the login page
Resource    ../common/super.resource


*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...  Confirms dashboard access and ensures proper logout with alert handling.
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Login To Application    ${USERNAME}    ${PASSWORD}
    Validate Dashboard Is Displayed
    Click Logout
    Handle Attention Alert    dismiss
    Logout From The Application