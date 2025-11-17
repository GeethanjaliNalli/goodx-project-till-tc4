*** Settings ***
Documentation    This dashboard page resource file has all the dashboard keywords.
Resource    ../Common/super.resource


*** Keywords ***
Validate Dashboard Is Displayed
    [Documentation]    Verifies that the Dashboard page is successfully loaded.
    ...  Checks that the Diary link is visible to confirm page display.
    Get Element States    ${link.diary}     contains    visible

Logout From The Application
    [Documentation]    Logs out from the application by clicking the logout button.
    ...  Ensures the user session ends and the application returns to the login page.
    Click Logout
    Handle Attention Alert    accept
    Wait Until Element Is Visible    ${form.loginform}    ${SHORT_WAIT}

Click Logout
    [Documentation]    Simulate click action on logout button and wait for alert should be displayed.
    Click    ${button.logout}
    Wait Until Element Is Visible    locator=${ATTENTION_ALERT}    timeout=${LONG_WAIT}

Select Menu In Navigation Wheel
    [Documentation]    Simulate click action on navigation menu link and wait for navigation wheel should be displayed.
    [Arguments]    ${menu_name}
    VAR    &{menu_items}    CONFIGURATION=2    DIARY=3    DEBTORS=4
    VAR    ${menu_key}    ${menu_items}[${menu_name}]
    Click    ${link.navigation.menu}
    Wait Until Element Is Visible    locator=${svg.viewbox}    timeout=${SHORT_WAIT}
    Click    svg > g:nth-child(${menu_key})

Select Current Timeslot
    [Documentation]    After click on now button in dashboard page then it will redirect to 
    ...    current timeslot.
    Click    ${button.now}
    Click    ${div.selected.timeslot}

Select Appointment Date
    [Documentation]    Enter appointment date in dashboard page navigation menu link and wait 
    ...    for navigation wheel should be displayed.
    [Arguments]    ${date}
    Fill Text    ${text.date}    ${date}
    Wait Until Element Is Visible    locator=${label.addeditbooking}    timeout=${SHORT_WAIT}

Select Timeslot
    [Documentation]    Simulate double click action on timeslot in dashboard page to create new booking.
    [Arguments]    ${time}
    Sleep    10s
    Scroll To Element    xpath=//div[@class='time'][text()='${time}']
    Sleep    3s
    Click With Options    xpath=//div[@class='time'][text()='${time}']    left    clickCount=2    force=True

Validate Booking Timeslot Is Created
    [Documentation]    Validates that a booking timeslot has been successfully created.
    ...  Checks the visibility of the timeslot and verifies the cell number and debtor name.
    [Arguments]    ${time}    ${expected_cell_no}    ${expected_name}
    Wait Until Element Is Visible    locator=xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//span[@class='account-status none']   timeout=${SHORT_WAIT}
    ${element_status}    Is Element Visible    xpath=//div[contains(@class,'start') and text()='${time}']
    Should Be True    True
    ${actual_cell_no} =    Get Text    xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//span[contains(@data-bind,'mobile_no')]
    Should Be Equal    ${actual_cell_no}    ${expected_cell_no}
    ${actual_name} =    Get Text    xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//div[@class='patient']//div[@class='name']/span
    Should Contain    ${actual_name}    ${expected_name}

Validate Booking Timeslot Is Not Created
    [Documentation]    Validates that a booking timeslot has not been created.
    ...  Checks that the timeslot is not visible on the dashboard.
    [Arguments]    ${time}
    ${element_status}    Is Element Visible    xpath=//div[@class='start'][text()='${time}']   timeout=${SHORT_WAIT}
    Should Be Equal   ${element_status}  False