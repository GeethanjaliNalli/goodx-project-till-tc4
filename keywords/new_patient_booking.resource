*** Settings ***
Documentation    Keywords for New Patient Booking workflow and form handling
Resource    ../common/super.resource
Resource    ../object_repository/new_patient_booking.resource

*** Keywords ***

Enter Form Data
    [Documentation]    Enters form data into fields using provided dictionary and locators
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${field}'.startswith('select.')    Select From Dropdown    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('checkbox.')    Click Element    ${locator}
    END

Click Save Booking
    [Documentation]    Clicks the Save button on the booking form
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Click Close Booking
    [Documentation]    Clicks the Close button on the booking form
    Click    ${BOOKING_FORM_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.close]    timeout=5s

Create New Patient Booking
    [Documentation]    Creates a new patient booking by filling required fields and saving
    [Arguments]    &{patient_info}    &{booking_info}
    Enter Form Data    &{patient_info}
    Enter Form Data    &{booking_info}
    Click Save Booking