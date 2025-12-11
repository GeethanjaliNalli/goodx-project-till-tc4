*** Settings ***
Documentation    Keywords for New Patient Booking workflow and form actions
Resource    ../common/super.resource
Resource    ../object_repository/booking_form.resource

*** Keywords ***

Enter Booking Form Data
    [Documentation]    Enters data into the New Patient Booking form fields using provided dictionary
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
    END

Click Save Booking
    [Documentation]    Clicks the Save button on the New Patient Booking form
    Click    ${BOOKING_FORM_LOCATORS['button.save']}
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS['button.save']}    timeout=5s

Click Close Booking
    [Documentation]    Clicks the Close button on the New Patient Booking form
    Click    ${BOOKING_FORM_LOCATORS['button.close']}
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS['button.close']}    timeout=5s

Create New Patient Booking
    [Documentation]    Fills in the New Patient Booking form and saves the booking
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Save Booking

Create New Patient Booking With Missing Fields
    [Documentation]    Attempts to create a booking with missing required fields and verifies no booking is made
    [Arguments]    &{booking_info_missing}
    Enter Booking Form Data    &{booking_info_missing}
    Click Save Booking
    # Verification of no booking should be handled in the test case
