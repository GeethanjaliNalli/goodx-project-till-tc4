*** Settings ***
Documentation    This add edit page resource file has all the add and edit page related keywords.
Resource    ../Common/super.resource

*** Keywords ***
Save Booking Form
    [Documentation]    Selects an option from dropdown using label, value, or index.
    Click    ${button.save}
    Wait Until Element Is Invisible    ${label.addeditbooking}    timeout=${LONG_WAIT}

Close Booking Form
    [Documentation]    Selects an option from dropdown using label, value, or index.
    Click    ${button.close}
    Handle Attention Alert    accept
    Wait Until Element Is Invisible    ${label.addeditbooking}    timeout=5s

Select Duplicate Debtor
    [Documentation]    Selects an option from dropdown using label, value, or index.
    Click    ${button.duplicate.debtor}
    Sleep    2s

Enter Form Data
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        # Resolve locator from the locators dictionary
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}

        # Skip empty values
        Run Keyword If    '${value}' == ''    Continue For Loop

        # If the key represents a select/dropdown (start with 'select.')
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select From Dropdown    ${locator}    ${value}

        # If the key represents an input/textarea (start with 'input.')
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Create New Patient Booking
    [Documentation]    Creates a new patient booking by entering booking and debtor information.
    [Arguments]    ${booking_info}    ${debtor_info}
    Enter Form Data    &{booking_info}
    Enter Form Data    &{debtor_info}
