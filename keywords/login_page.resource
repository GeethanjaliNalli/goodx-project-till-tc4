*** Settings ***
Documentation    This login page Resource file has all the login keywords
Resource    ../Common/super.resource


*** Keywords ***
Enter Username And Password
    [Documentation]    Enters the provided username and password into the login fields.
    ...  Waits for elements to load, fills in credentials, and clicks the login button.
    [Arguments]    ${username}    ${password}
    Wait For Elements State    ${label.loadingbar}    hidden    ${LONG_WAIT}
    Wait For Elements State    ${textbox.username}    focused    ${LONG_WAIT}
    Fill Text    ${textbox.username}    ${username}
    Fill Text    ${textbox.password}    ${password}
    Click    ${button.login}

Login To Application
    [Documentation]    Enters the provided username and password into the login fields.
    ...  Waits for elements to load, fills in credentials, and clicks the login button.
    [Arguments]    ${username}    ${password}
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${username}    ${password}
    Handle Attention Alert    accept