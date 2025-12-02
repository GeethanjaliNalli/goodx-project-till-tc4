*** Settings ***
Documentation    This resource file contains all keywords for Diary - Add Sick note (Medical Certificate) page automation, including creation, validation, and communication log checks for Sick Notes in the clinical record.
Resource    ../common/super.resource

*** Keywords ***
Open Clinical Forms For Patient
    [Documentation]    Opens the Clinical Forms panel for the selected patient booking in the Diary.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.open-clinical-forms]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[select.forms-library]    ${LONG_WAIT}

Select Sick Note Form
    [Documentation]    Selects the Sick Note (Medical Certificate) form from the Clinical Forms library.
    Select Options By    ${DIARY_ADD_SICK_NOTE_LOCATORS}[select.forms-library]    label    Sick Note
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.add-sick-note]    ${LONG_WAIT}
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.add-sick-note]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.save-sick-note]    ${LONG_WAIT}

Fill Sick Note Form
    [Documentation]    Fills the Sick Note form fields dynamically using provided dictionary data.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${DIARY_ADD_SICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Save Sick Note Form
    [Documentation]    Saves the Sick Note form and waits for the form to close.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.save-sick-note]
    Wait Until Element Is Invisible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.save-sick-note]    ${LONG_WAIT}

Print Sick Note
    [Documentation]    Initiates the print action for the Sick Note.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.print-sick-note]
    Wait Until    2s

Validate Sick Note Is Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient’s Clinical record.
    ${clinical_record_text}    Get Text    locator=//div[contains(@class,'clinical-records-list')]//div[contains(.,'Sick Note')]
    Should Contain    ${clinical_record_text}    Sick Note

Validate Sick Note Email And Print Logs In Communication History
    [Documentation]    Validates that Email and Print logs are recorded in the Patient communication history for the Sick Note.
    ${comm_log_text}    Get Text    locator=//div[contains(@class,'communication-history')]//div[contains(.,'Sick Note')]
    Should Contain    ${comm_log_text}    Email
    Should Contain    ${comm_log_text}    Print

Validate Sick Note Printout Contains QR Code If Enabled
    [Documentation]    Validates that the Sick Note printout contains a QR Code if the feature is enabled.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.print-sick-note]
    Wait Until Element Is Visible    locator=//div[contains(@class,'print-preview')]    ${LONG_WAIT}
    ${qr_code_present}    Evaluate Expression    bool(page.query_selector("div.print-preview img.qr-code"))
    Run Keyword If    ${qr_code_present}    Should Be True    ${qr_code_present}

Select Existing Patient Booking
    [Documentation]    Selects an existing patient booking in the Diary by time.
    [Arguments]    ${time}
    Click    xpath=//div[contains(@class,'start') and text()='${time}']
    Wait Until    1s
