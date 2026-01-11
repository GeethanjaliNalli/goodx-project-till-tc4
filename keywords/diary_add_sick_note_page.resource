*** Settings ***
Documentation    This resource file contains all keywords for Diary - Add Sick note functionality, including creating, filling, signing, saving, emailing, printing, and validating Sick Notes for a patient.
Resource    ../common/super.resource

*** Keywords ***
Select Existing Booking For Patient
    [Documentation]    Selects an existing booking for the specified patient at the given booking time in the Diary.
    [Arguments]    ${booking_time}    ${patient_name}
    ${booking_locator}=    Evaluate    "//div[contains(@class,'start') and text()='${booking_time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//div[@class='patient']//div[@class='name']/span[contains(., '${patient_name}')]/ancestor::div[contains(@class,'patient')]/ancestor::div[contains(@data-bind,'borderRightColor')]"
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until    2s

Open Clinical Forms For Booking
    [Documentation]    Opens the Clinical Forms library for the selected booking.
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[select.forms.library]    ${LONG_WAIT}
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[select.forms.library]
    Wait Until    1s

Select Sick Note Form
    [Documentation]    Selects the Sick Note form from the Clinical Forms library.
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[listitem.sick_note]    ${LONG_WAIT}
    Select Options By    ${DIARY_ADD_SICK_NOTE_LOCATORS}[select.forms.library]    label    SICK NOTE
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.add.sick_note]
    Wait Until    2s

Fill Sick Note Form
    [Documentation]    Fills the Sick Note form fields dynamically using the provided dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${DIARY_ADD_SICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Sign Sick Note Form
    [Documentation]    Signs the Sick Note form with the provided doctor's signature.
    [Arguments]    ${doctor_signature}
    # Assuming a signature field exists as input.signature, mapped in locators
    ${locator}    Get From Dictionary    ${DIARY_ADD_SICK_NOTE_LOCATORS}    input.signature
    Fill Text    ${locator}    ${doctor_signature}
    Wait Until    1s

Save Sick Note Form
    [Documentation]    Saves the Sick Note form.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.save]    timeout=${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient's Clinical record.
    [Arguments]    ${patient_name}
    ${clinical_record_locator}=    Evaluate    "//div[@class='clinical-record']//div[contains(., 'SICK NOTE') and contains(., '${patient_name}')]"
    Wait Until Element Is Visible    ${clinical_record_locator}    ${LONG_WAIT}
    ${record_text}    Get Text    ${clinical_record_locator}
    Should Contain    ${record_text}    SICK NOTE
    Should Contain    ${record_text}    ${patient_name}

Send Sick Note Via Email
    [Documentation]    Sends the Sick Note via email to the specified patient email.
    [Arguments]    ${patient_email}
    # Assuming there is an email button or action, mapped as button.email in locators
    ${locator}    Get From Dictionary    ${DIARY_ADD_SICK_NOTE_LOCATORS}    button.email
    Click    ${locator}
    Wait Until    1s
    # Assuming a confirmation dialog or toast appears
    ${confirmation_locator}=    Evaluate    "//div[contains(@class,'toast') and contains(., 'Email sent')]"
    Wait Until Element Is Visible    ${confirmation_locator}    ${LONG_WAIT}

Print Sick Note
    [Documentation]    Prints the Sick Note using the print button.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.print]
    Wait Until    2s

Validate Email And Print Logs In Communication History
    [Documentation]    Validates that Email and Print logs are recorded in the Patient's communication history.
    [Arguments]    ${patient_name}
    ${comm_history_locator}=    Evaluate    "//div[@class='communication-history']//div[contains(., '${patient_name}') and (contains(., 'Email') or contains(., 'Print'))]"
    Wait Until Element Is Visible    ${comm_history_locator}    ${LONG_WAIT}
    ${comm_text}    Get Text    ${comm_history_locator}
    Should Contain    ${comm_text}    Email
    Should Contain    ${comm_text}    Print

Validate QR Code On Sick Note Printout
    [Documentation]    Validates that the QR Code appears on the Sick Note printout if enabled.
    ${qr_code_locator}=    Evaluate    "//div[@class='print-preview']//img[contains(@src, 'qr')]"
    Wait Until Element Is Visible    ${qr_code_locator}    ${LONG_WAIT}
