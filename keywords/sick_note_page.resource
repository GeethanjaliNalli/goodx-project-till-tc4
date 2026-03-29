*** Settings ***
Documentation    This resource file contains all keywords related to the Sick Note (Medical Certificate) workflow for Diary - Add Sick note functionality.
Resource    ../common/super.resource

*** Keywords ***
Select Existing Booking For Patient
    [Documentation]    Selects an existing booking for the specified patient in the Diary.
    [Arguments]    ${patient_name}
    ${booking_locator}=    Evaluate    "//div[contains(@class,'booking-entry') and .//span[contains(text(), '${patient_name}')]]"
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until    1s

Open Clinical Forms For Selected Patient
    [Documentation]    Opens the Clinical Forms section for the selected patient from their booking entry.
    ${clinical_forms_button}=    Evaluate    "//button[contains(@class,'btn-clinical-forms') or .//t[contains(text(),'Clinical Forms')]]"
    Wait Until Element Is Visible    ${clinical_forms_button}    ${LONG_WAIT}
    Click    ${clinical_forms_button}
    Wait Until    1s

Select Sick Note Form
    [Documentation]    Selects the Sick Note (Medical Certificate) form from the Clinical Forms list.
    ${sick_note_form}=    Evaluate    "//div[contains(@class,'clinical-form-list')]//div[contains(text(),'Sick Note') or contains(text(),'Medical Certificate')]"
    Wait Until Element Is Visible    ${sick_note_form}    ${LONG_WAIT}
    Click    ${sick_note_form}
    Wait Until    1s

Fill Sick Note Form
    [Documentation]    Fills in the Sick Note form fields using provided data dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}=    Get From Dictionary    ${SICK_NOTE_PAGE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.icd10_search')    Fill Text    ${locator}    ${value}
        ...    Select ICD10 Code From Dropdown    ${value}
        Run Keyword If    '${field}'.startswith('input.') and not '${field}'=='input.icd10_search'    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('textarea.')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('upload.pdf.file')    Upload File    ${locator}    ${value}
    END

Select ICD10 Code From Dropdown
    [Documentation]    Selects the ICD10 code from the dropdown after typing in the search field.
    [Arguments]    ${icd10_code}
    ${dropdown_locator}=    Set Variable    //div[contains(@class, 'icd10-dropdown')]//ul/li[contains(., '${icd10_code}')]
    Wait Until Element Is Visible    ${dropdown_locator}    ${SHORT_WAIT}
    Click    ${dropdown_locator}
    Wait Until    0.5s

Save Sick Note Form
    [Documentation]    Saves the Sick Note form.
    Click    ${SICK_NOTE_PAGE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${SICK_NOTE_PAGE_LOCATORS}[button.save]    timeout=${LONG_WAIT}

Sign Sick Note Electronically
    [Documentation]    Signs the Sick Note electronically using the Sign button.
    Click    ${SICK_NOTE_PAGE_LOCATORS}[button.sign]
    Wait Until Element Is Invisible    ${SICK_NOTE_PAGE_LOCATORS}[button.sign]    timeout=${LONG_WAIT}

Send Sick Note Via Email
    [Documentation]    Sends the Sick Note to the patient via Email.
    Click    ${SICK_NOTE_PAGE_LOCATORS}[button.email]
    Wait Until Element Is Invisible    ${SICK_NOTE_PAGE_LOCATORS}[button.email]    timeout=${LONG_WAIT}

Print Sick Note
    [Documentation]    Initiates printing of the Sick Note.
    Click    ${SICK_NOTE_PAGE_LOCATORS}[button.print]
    Wait Until Element Is Invisible    ${SICK_NOTE_PAGE_LOCATORS}[button.print]    timeout=${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient’s clinical record.
    [Arguments]    ${patient_name}
    ${clinical_record_row}=    Evaluate    "//div[contains(@class,'clinical-record')]//tr[td[contains(.,'Sick Note')] and td[contains(.,'${patient_name}')]]"
    Wait Until Element Is Visible    ${clinical_record_row}    ${LONG_WAIT}
    ${record_text}=    Get Text    ${clinical_record_row}
    Should Contain    ${record_text}    Sick Note
    Should Contain    ${record_text}    ${patient_name}

Validate Communication Logs For Sick Note
    [Documentation]    Validates that Email and Print logs for the Sick Note are recorded in the patient’s communication history.
    [Arguments]    ${patient_name}
    ${email_log_row}=    Evaluate    "//div[contains(@class,'communication-history')]//tr[td[contains(.,'Email')] and td[contains(.,'Sick Note')] and td[contains(.,'${patient_name}')]]"
    ${print_log_row}=    Evaluate    "//div[contains(@class,'communication-history')]//tr[td[contains(.,'Print')] and td[contains(.,'Sick Note')] and td[contains(.,'${patient_name}')]]"
    Wait Until Element Is Visible    ${email_log_row}    ${LONG_WAIT}
    Wait Until Element Is Visible    ${print_log_row}    ${LONG_WAIT}
    ${email_text}=    Get Text    ${email_log_row}
    ${print_text}=    Get Text    ${print_log_row}
    Should Contain    ${email_text}    Sick Note
    Should Contain    ${print_text}    Sick Note

Validate QR Code On Sick Note Printout
    [Documentation]    Validates that the QR Code is present on the Sick Note printout if enabled.
    ${qr_code_locator}=    Evaluate    "//div[contains(@class,'sick-note-print')]//img[contains(@src,'qrcode')]"
    Wait Until Element Is Visible    ${qr_code_locator}    ${SHORT_WAIT}

Upload File
    [Documentation]    Uploads a file to the specified input[type=file] element.
    [Arguments]    ${locator}    ${file_path}
    Choose File    ${locator}    ${file_path}
