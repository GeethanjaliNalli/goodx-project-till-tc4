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
    Handle Attention Alert    ${ACCEPT_ATTENTION_ALERT}
    Wait Until Element Is Visible    ${form.loginform}    ${SHORT_WAIT}

Click Logout
    [Documentation]    Simulate click action on logout button and wait for alert should be displayed.
    Click    ${button.logout}
    Wait Until Element Is Visible    locator=${ATTENTION_ALERT}    timeout=${LONG_WAIT}

Select Menu In Navigation Wheel
    [Documentation]    Simulates a click action on the navigation menu link and waits for
    ...     the navigation wheel to be displayed.
    [Arguments]    ${menu_name}
    VAR    &{menu_items}    CONFIGURATION=2    DIARY=3    DEBTORS=4
    VAR    ${menu_key}    ${menu_items}[${menu_name}]
    Click    ${link.navigation.menu}
    Wait Until Element Is Visible    locator=${svg.viewbox}    timeout=${SHORT_WAIT}
    Click    svg > g:nth-child(${menu_key})

Select Current Timeslot
    [Documentation]    After clicking the Now button on the Dashboard page, the user is
    ...     redirected to the current timeslot.
    Click    ${button.now}
    Click    ${div.selected.timeslot}

Select Appointment Date
    [Documentation]    Enters the appointment date in the Dashboard page navigation menu
    ...     and waits for the navigation wheel to be displayed.”
    [Arguments]    ${date}
    Fill Text    ${text.date}    ${date}
    Wait Until Element Is Visible    locator=${label.addeditbooking}    timeout=${SHORT_WAIT}

Select Timeslot
    [Documentation]    Simulates a double-click action on a timeslot in the Dashboard page
    ...     to create a new booking.
    [Arguments]    ${time}
    Sleep    3s
    Scroll To Element    xpath=//div[@class='time'][text()='${time}']
    Click With Options    xpath=//div[@class='time'][text()='${time}']    left    clickCount=2    force=True

Validate Booking Timeslot Is Created
    [Documentation]    Validates that a booking timeslot has been successfully created by
    ...     checking its visibility and verifying the cell number and debtor name.
    [Arguments]    ${time}    ${expected_cell_no}    ${expected_name}
    Wait Until Element Is Visible    locator=xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//span[@class='account-status none']   timeout=${SHORT_WAIT}
    ${element_status}    Is Element Visible    xpath=//div[contains(@class,'start') and text()='${time}']
    Should Be True   ${element_status}
    ${actual_cell_no}    Get Text    xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//span[contains(@data-bind,'mobile_no')]
    Should Be Equal    ${actual_cell_no}    ${expected_cell_no}
    ${actual_name}   Get Text    xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//div[@class='patient']//div[@class='name']/span
    Should Contain    ${actual_name}    ${expected_name}

Validate Booking Timeslot Is Not Created
    [Documentation]    Validates that a booking timeslot has not been created by confirming
    ...     that the timeslot is not visible on the dashboard.”
    [Arguments]    ${time}
    ${element_status}    Is Element Visible    xpath=//div[@class='start'][text()='${time}']
    Should Not Be True   ${element_status}

Validate Booking Timeslot Is Created For Existing Patient
    [Documentation]    Validates that a booking timeslot has been successfully created for an existing patient by 
    ...     confirming the timeslot is visible on the Dashboard after the booking process is completed.
    [Arguments]    ${time}
    ${element_status}    Is Element Visible    xpath=//div[contains(@class,'start') and text()='${time}']
    Should Be True   ${element_status}

Validate and Select Booking Timeslot Is Created For Existing Patient
    [Documentation]    Validates that a booking timeslot has been successfully created for an existing
    ...     patient by confirming its visibility on the Dashboard after the booking process is completed,
    ...     and then selects the created timeslot for further actions.
    [Arguments]    ${time}
    Wait Until Element Is Visible    locator=xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//span[@class='account-status none']   timeout=${SHORT_WAIT}
    ${element_status}    Is Element Visible    xpath=//div[contains(@class,'start') and text()='${time}']
    Should Be True   ${element_status}
    Click    xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//span[@class='account-status none']