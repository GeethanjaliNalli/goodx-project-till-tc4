*** Settings ***
Documentation    This common resource file has all the common keywords
Resource    ../Common/super.resource


*** Keywords ***
Launch GoodX Web Application
    [Documentation]    Launches the GoodX web application in the specified browser and navigates to the given URL.
    ...  Sets browser timeout and opens a new context and page for testing.
    [Arguments]    ${browser_type}    ${url}
    New Browser    ${browser_type}    headless=${HEADLESS_BROWSER}
    Set Browser Timeout    ${LONG_WAIT}
    New Context
    New Page    ${url}    wait_until=domcontentloaded
    Log To Console    Browser launched successfully with ${browser_type} and navigated to ${url}

Read TestData From Excel
    [Documentation]    Read TestData from excel file for required data.
    ...    Example:
    ...    Read TestData From Excel TC_01 SheetName
    [Arguments]    ${excel_path}    ${tc_id}    ${sheet_name}
    ${expected_data}    Get Ms Excel Row Values Into Dictionary Based On Key    ${excel_path}    ${tc_id}    ${sheet_name}
    RETURN    ${expected_data}

Validate Error Message Is Displayed
    [Documentation]    Validates that the displayed error message matches the expected text.
    ...  Captures the alert if present and compares the actual and expected messages.
    [Arguments]    ${expected_errormessage}
    ${actual_errormessage}    Get Text    ${label.error}
    Should Be Equal    ${actual_errormessage}    ${expected_errormessage}

Handle Attention Alert
    [Documentation]    Handles the attention alert based on the specified action.
    ...  Dismisses or accepts the alert by clicking the appropriate button.
    [Arguments]    ${action}=dismiss
    Wait Until Element Is Visible    locator=${ATTENTION_ALERT}    timeout=${LONG_WAIT}
    IF    '${action}'=='dismiss'
        Click    ${button.attention.cancel}
    ELSE IF    '${action}'=='accept'
        Click    ${button.attention.ok}
    END

Wait Until Element Is Visible
    [Documentation]    Waits until the specified element becomes visible on the page,
    ...     using the provided timeout duration.
    [Arguments]    ${locator}    ${timeout}
    Wait For Elements State    ${locator}    attached    timeout=${timeout}
    Wait For Elements State    ${locator}    visible    timeout=${timeout}

Wait Until Element Is Invisible
    [Documentation]    Waits until the specified element is no longer visible on the page,
    ...     using the provided timeout duration.
    [Arguments]    ${locator}    ${timeout}
    Wait For Elements State    ${locator}    hidden    timeout=${timeout}