*** Settings ***
Documentation    This add edit page resource file has all the add and edit page related keywords.
Resource    ../Common/super.resource

*** Keywords ***
Save Booking Form
    [Documentation]    Saves the Add/Edit Booking form.
    Click    ${button.save}
    Wait Until Element Is Invisible    ${label.addeditbooking}    timeout=${LONG_WAIT}

Close Booking Form
    [Documentation]    Closes the Add/Edit Booking form.
    Click    ${button.close}
    Handle Attention Alert    accept
    Wait Until Element Is Invisible    ${label.addeditbooking}    timeout=5s

Select Duplicate Debtor
    [Documentation]    Clicks on the Duplicate Debtor button in the Add/Edit Booking form to select an existing debtor.
    Click    ${button.duplicate.debtor}

Enter Form Data
    [Documentation]    Enters data into the booking form fields based on the values provided in the dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select From Dropdown    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Create New Patient Booking
    [Documentation]    Creates a new patient booking by entering the required booking and debtor information.
    [Arguments]    ${booking_info}    ${debtor_info}
    Enter Form Data    &{booking_info}
    Enter Form Data    &{debtor_info}