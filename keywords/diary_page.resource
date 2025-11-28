*** Settings ***
Documentation    This diary page resource file has all the Diary Sick Note related keywords.
Resource    ../common/super.resource

*** Keywords ***
Open Patient Clinical Forms
    [Documentation]    Opens the Clinical Forms for the selected patient from the Diary grid.
    [Arguments]    ${patient_name}
    ${patient_row_locator}=    Evaluate    "//div[contains(@class,'booking')]//span[text()='${patient_name}']/ancestor::div[contains(@class,'booking')]"
    Wait Until Element Is Visible    ${patient_row_locator}    ${LONG_WAIT}
    ${clinical_button_locator}=    Set Variable    ${BOOKING_FORM_LOCATORS}[button.clinical]
    Click    ${clinical_button_locator}
    Wait Until Element Is Visible    ${CLINICAL_FORM_LOCATORS}[button.active_forms]    ${LONG_WAIT}

Select Sick Note Form
    [Documentation]    Selects the Sick Note (Medical Certificate) form in the Clinical Forms section.
    Click    ${CLINICAL_FORM_LOCATORS}[button.sick_note]
    Wait Until Element Is Visible    ${CLINICAL_FORM_LOCATORS}[button.save]    ${LONG_WAIT}

Fill Sick Note Details
    [Documentation]    Fills in Sick Note details dynamically using dictionary keys.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Sick Note Input Field    ${field}    ${value}
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Sick Note Option Field    ${field}    ${value}
    END

Fill Sick Note Input Field
    [Documentation]    Fills input field in Sick Note form using locator dictionary.
    [Arguments]    ${field}    ${value}
    ${locator}    Get From Dictionary    ${CLINICAL_FORM_LOCATORS}    ${field}
    Fill Text    ${locator}    ${value}

Select Sick Note Option Field
    [Documentation]    Selects option field in Sick Note form using locator dictionary.
    [Arguments]    ${field}    ${value}
    ${locator}    Get From Dictionary    ${CLINICAL_FORM_LOCATORS}    ${field}
    Select Options By    ${locator}    label    ${value}

Save Sick Note Form
    [Documentation]    Saves the Sick Note form and waits for confirmation.
    Click    ${CLINICAL_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${CLINICAL_FORM_LOCATORS}[button.save]    ${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient's Clinical record.
    [Arguments]    ${patient_name}    ${expected_status}
    ${patient_row_locator}=    Evaluate    "//div[contains(@class,'booking')]//span[text()='${patient_name}']/ancestor::div[contains(@class,'booking')]"
    Wait Until Element Is Visible    ${patient_row_locator}    ${LONG_WAIT}
    Click    ${BOOKING_FORM_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${CLINICAL_FORM_LOCATORS}[button.active_forms]    ${LONG_WAIT}
    ${sick_note_event_locator}=    Set Variable    ${CLINICAL_FORM_LOCATORS}[button.sick_note_event]
    Wait Until Element Is Visible    ${sick_note_event_locator}    ${LONG_WAIT}
    Click    ${sick_note_event_locator}
    Wait Until Element Is Visible    ${CLINICAL_FORM_LOCATORS}[button.save]    ${LONG_WAIT}
    ${status_locator}=    Set Variable    ${CLINICAL_FORM_LOCATORS}[button.save]
    ${actual_status}    Get Text    ${status_locator}
    Should Contain    ${actual_status}    ${expected_status}

Validate Email Log For Sick Note
    [Documentation]    Validates that the Email log for the Sick Note is recorded in the Patient communication history.
    [Arguments]    ${expected_email_log}
    Click    ${CLINICAL_FORM_LOCATORS}[button.email_pdf]
    Wait Until Element Is Visible    ${CLINICAL_FORM_LOCATORS}[button.email_all]    ${LONG_WAIT}
    ${actual_email_log}    Get Text    ${CLINICAL_FORM_LOCATORS}[button.email_all]
    Should Contain    ${actual_email_log}    ${expected_email_log}

Validate Print Log For Sick Note
    [Documentation]    Validates that the Print log for the Sick Note is recorded in the Patient communication history.
    [Arguments]    ${expected_print_log}
    Click    ${CLINICAL_FORM_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${CLINICAL_FORM_LOCATORS}[button.save]    ${LONG_WAIT}
    ${actual_print_log}    Get Text    ${CLINICAL_FORM_LOCATORS}[button.print]
    Should Contain    ${actual_print_log}    ${expected_print_log}

Validate QR Code On Sick Note Printout
    [Documentation]    Validates that the QR Code is present on the Sick Note printout if enabled.
    [Arguments]    ${expected_qr_code}
    Click    ${CLINICAL_FORM_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${CLINICAL_FORM_LOCATORS}[button.print]    ${LONG_WAIT}
    ${qr_code_locator}=    Set Variable    //img[contains(@src,'qr')]
    ${is_qr_visible}    Evaluate Expression    page.query_selector('${qr_code_locator}') is not None
    Run Keyword If    '${expected_qr_code}' == 'Yes'    Should Be True    ${is_qr_visible}
    ...    ELSE    Should Not Be True    ${is_qr_visible}
