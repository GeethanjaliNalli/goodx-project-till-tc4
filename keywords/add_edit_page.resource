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
    Handle Attention Alert    ${ACCEPT_ATTENTION_ALERT}
    Wait Until Element Is Invisible    ${label.addeditbooking}    timeout=5s

Select Duplicate Debtor
    [Documentation]    Clicks on the Duplicate Debtor button in the Add/Edit Booking form to select an existing debtor.
    Click    ${button.duplicate.debtor}

Enter Form Data
    [Documentation]    Enters data into the booking form fields based on the values provided in the dictionary.
    [Arguments]    ${select_by}=label    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    ${select_by}   ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Create New Patient Booking
    [Documentation]    Creates a new patient booking by entering the required booking and debtor information.
    [Arguments]    ${booking_info}    ${debtor_info}
    Enter Form Data    &{booking_info}
    Enter Form Data    &{debtor_info}

Search And Select Existing Patient
    [Documentation]    simulates searching and selecting an existing patient in the Add/Edit Booking form.
    [Arguments]    ${existingpatientname}
    Fill Text    ${input.search}    ${existingpatientname}
    Wait Until Element Is Visible    //div[@class="ui-menu-item-wrapper" and contains(text(), ${existingpatientname})]    5s
    Click    //div[@class="ui-menu-item-wrapper" and contains(text(), ${existingpatientname})]
    Wait Until    2s

Validate Warning Alert Is Displayed
    [Documentation]    Simulates handling the warning alert in Add/Edit booking screen.
    [Arguments]    ${expected_text}
    Click    ${button.save}
    Wait Until Element Is Visible    ${label.warning}    2s
    ${actual_text}    Get Text    ${label.warning.message}
    Should Contain    ${actual_text}    ${expected_text}
    Click    ${button.warning.ok}

Create Patient Booking With Existing Debtor
    [Documentation]    Creates a patient booking using an existing debtor's information.
    [Arguments]    ${booking_info}    ${existing_debtor_name}
    Enter Form Data    &{booking_info}
    Search And Select Existing Patient    ${existing_debtor_name}
    Save Booking Form