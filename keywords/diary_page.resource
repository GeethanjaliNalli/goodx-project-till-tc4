*** Settings ***
Documentation    This diary page resource file has all the diary and sick note keywords.
Resource    ../common/super.resource

*** Keywords ***
Open Clinical Forms For Patient
    [Documentation]    Opens the Clinical Forms for the selected patient from the Diary.
    [Arguments]    &{patient_info}
    Click    ${DIARY_GRID_LOCATORS}[button.patient_dashboard]
    Wait Until Element Is Visible    ${DIARY_GRID_LOCATORS}[button.clinical]    ${LONG_WAIT}
    Click    ${DIARY_GRID_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[select.forms_library]    ${LONG_WAIT}

Select Sick Note Form
    [Documentation]    Selects the Sick Note (Medical Certificate) form from the Clinical Forms library.
    Click    ${BOOKING_FORM_LOCATORS}[button.forms_library_dropdown]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[select.forms_library]    ${SHORT_WAIT}
    Select Options By    ${BOOKING_FORM_LOCATORS}[select.forms_library]    label    Medical Certificate
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[panel.medical_certificate]    ${LONG_WAIT}

Fill Sick Note Patient Details
    [Documentation]    Fills in the patient details section of the Sick Note form using the provided dictionary.
    [Arguments]    &{patient_info}
    FOR    ${field}    ${value}    IN    &{patient_info}
        ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
    END

Fill Sick Note Doctor Details
    [Documentation]    Fills in the doctor details section of the Sick Note form using the provided dictionary.
    [Arguments]    &{doctor_info}
    FOR    ${field}    ${value}    IN    &{doctor_info}
        ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
    END

Fill Sick Note Details
    [Documentation]    Fills in the Sick Note details (dates, diagnosis, comments, etc.) using the provided dictionary.
    [Arguments]    &{sick_note_details}
    FOR    ${field}    ${value}    IN    &{sick_note_details}
        ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
    END

Sign Sick Note
    [Documentation]    Signs the Sick Note using the doctor's signature image or configured signature.
    [Arguments]    ${signature_image}
    Click    ${BOOKING_FORM_LOCATORS}[button.load_user_signature]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[button.doctor_signature]    ${SHORT_WAIT}
    Click    ${BOOKING_FORM_LOCATORS}[button.doctor_signature]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[button.save]    ${SHORT_WAIT}

Save Sick Note Form
    [Documentation]    Saves the Sick Note form and waits until the form is closed.
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[panel.medical_certificate]    ${LONG_WAIT}

Send Sick Note Via Email
    [Documentation]    Sends the Sick Note via email to the patient.
    [Arguments]    ${patient_email}
    Click    ${BOOKING_FORM_LOCATORS}[button.email]
    Wait Until Element Is Visible    ${WARNING_ALERT_LOCATORS}[dialog.toast_screen]    ${LONG_WAIT}
    ${toast_message}    Get Text    ${WARNING_ALERT_LOCATORS}[span.toast_message]
    Should Contain    ${toast_message}    Email sent

Print Sick Note
    [Documentation]    Prints the Sick Note and waits for the print dialog or confirmation.
    Click    ${BOOKING_FORM_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[button.preview_medical_certificate]    ${LONG_WAIT}

Validate QR Code Is Present On Sick Note
    [Documentation]    Validates that the QR code is present on the Sick Note printout if enabled.
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[button.preview_medical_certificate]    ${LONG_WAIT}
    Click    ${BOOKING_FORM_LOCATORS}[button.preview_medical_certificate]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[panel.medical_certificate]    ${LONG_WAIT}
    ${qr_code_present}    Evaluate Expression    'QR' in Get Text    ${BOOKING_FORM_LOCATORS}[panel.medical_certificate]
    Should Contain    ${qr_code_present}    True

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient's clinical record.
    [Arguments]    &{expected_results}
    Click    ${DIARY_GRID_LOCATORS}[button.clinical_history]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[panel.medical_certificate]    ${LONG_WAIT}
    ${status}    Get Text    ${BOOKING_FORM_LOCATORS}[panel.medical_certificate]
    Should Contain    ${status}    ${expected_results}[status]
    Run Keyword If    '${expected_results}[saved_in_clinical_record]' == 'True'
    ...    Should Contain    ${status}    Medical Certificate

Validate Email And Print Logs Recorded
    [Documentation]    Validates that email and print logs are recorded in the patient's communication history.
    [Arguments]    &{expected_results}
    Click    ${DIARY_GRID_LOCATORS}[button.account_details]
    Wait Until Element Is Visible    ${DEBTOR_DETAILS_LOCATORS}[label.debtor_details]    ${LONG_WAIT}
    ${email_log}    Get Text    ${DEBTOR_DETAILS_LOCATORS}[label.debtor_details]
    Should Contain    ${email_log}    Email
    Run Keyword If    '${expected_results}[email_log_recorded]' == 'True'
    ...    Should Contain    ${email_log}    sent
    Run Keyword If    '${expected_results}[print_log_recorded]' == 'True'
    ...    Should Contain    ${email_log}    Print

Validate No Validation Errors In Sick Note
    [Documentation]    Validates that there are no validation errors present in the Sick Note form.
    [Arguments]    &{expected_results}
    Run Keyword If    '${expected_results}[validation_errors]' == 'None'
    ...    Wait Until Element Is Invisible    ${WARNING_ALERT_LOCATORS}[alert.validation_error]    ${SHORT_WAIT}
