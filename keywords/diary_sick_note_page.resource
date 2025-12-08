*** Settings ***
Documentation    This resource file contains all keywords for Diary Sick Note (Medical Certificate) workflows in the Diary module.
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Select Patient Booking
    [Documentation]    Opens the Diary module and selects the booking for the specified patient.
    [Arguments]    ${patient_fullname}
    Select Menu In Navigation Wheel    DIARY
    Wait Until Patient Booking Is Visible In Diary    ${patient_fullname}
    Click Patient Booking In Diary    ${patient_fullname}

Wait Until Patient Booking Is Visible In Diary
    [Documentation]    Waits until the booking for the patient is visible in the Diary grid.
    [Arguments]    ${patient_fullname}
    ${booking_locator}=    Set Variable    //div[contains(@class,'patient')]//span[contains(text(),'${patient_fullname}')]
    Wait Until Element Is Visible    locator=${booking_locator}    timeout=${LONG_WAIT}

Click Patient Booking In Diary
    [Documentation]    Clicks the booking cell for the specified patient in the Diary grid.
    [Arguments]    ${patient_fullname}
    ${booking_locator}=    Set Variable    //div[contains(@class,'patient')]//span[contains(text(),'${patient_fullname}')]
    Click    ${booking_locator}
    Wait Until    2s

Open Clinical Sidebar And Select Forms Library
    [Documentation]    Opens the Clinical sidebar and selects the Forms Library dropdown.
    Click    ${BTN_CLINICAL_SIDEBAR}
    Wait Until Element Is Visible    ${DROPDOWN_FORMS_LIBRARY}    ${LONG_WAIT}

Search And Select Sick Note Form
    [Documentation]    Selects the Sick Note (Medical Certificate) form from the Forms Library dropdown.
    [Arguments]    ${form_type}
    Select Options By    ${SELECT_WORKFLOW_EVENT_TYPE}    label    ${form_type}
    Wait Until Element Is Visible    ${OPTION_SICK_NOTE}    ${LONG_WAIT}
    Click    ${OPTION_SICK_NOTE}
    Wait Until Element Is Visible    ${BTN_EXPAND_PATIENT_DETAILS}    ${LONG_WAIT}

Fill Sick Note Form Details
    [Documentation]    Fills in Sick Note form details: date, reason, and duration.
    [Arguments]    ${date}    ${reason}    ${duration}
    Fill Text    ${INPUT_DATE_PICKER}    ${date}
    Fill Sick Note Reason    ${reason}
    Fill Sick Note Duration    ${duration}

Fill Sick Note Reason
    [Documentation]    Fills in the reason for the Sick Note.
    [Arguments]    ${reason}
    ${reason_locator}=    Set Variable    //textarea[contains(@data-bind,'reason')]
    Fill Text    ${reason_locator}    ${reason}

Fill Sick Note Duration
    [Documentation]    Fills in the duration for the Sick Note.
    [Arguments]    ${duration}
    ${duration_locator}=    Set Variable    //input[contains(@data-bind,'duration')]
    Fill Text    ${duration_locator}    ${duration}

Add Doctor Signature To Sick Note
    [Documentation]    Adds the Doctor's signature to the Sick Note.
    [Arguments]    ${doctor_signature}
    Click    ${BTN_DOCTOR_SIGNATURE}
    Wait Until Doctor Signature Dialog Is Visible
    Fill Doctor Signature Field    ${doctor_signature}
    Save Doctor Signature

Wait Until Doctor Signature Dialog Is Visible
    [Documentation]    Waits until the Doctor Signature dialog is visible.
    ${signature_dialog_locator}=    Set Variable    //div[contains(@class,'ui-dialog') and .//label[contains(text(),'Signature')]]
    Wait Until Element Is Visible    locator=${signature_dialog_locator}    timeout=${LONG_WAIT}

Fill Doctor Signature Field
    [Documentation]    Fills in the Doctor's signature field.
    [Arguments]    ${doctor_signature}
    ${signature_field_locator}=    Set Variable    //input[contains(@data-bind,'doctor_signature')]
    Fill Text    ${signature_field_locator}    ${doctor_signature}

Save Doctor Signature
    [Documentation]    Saves the Doctor's signature in the dialog.
    ${save_signature_btn}=    Set Variable    //button[contains(@data-bind,'Save')]
    Click    ${save_signature_btn}
    Wait Until Element Is Invisible    ${save_signature_btn}    timeout=${LONG_WAIT}

Add Doctor Email To Sick Note
    [Documentation]    Adds the Doctor's email to the Sick Note.
    [Arguments]    ${doctor_email}
    ${email_field_locator}=    Set Variable    //input[contains(@data-bind,'doctor_email')]
    Fill Text    ${email_field_locator}    ${doctor_email}

Validate Sick Note Patient Details
    [Documentation]    Validates that patient details are pre-populated in the Sick Note form.
    [Arguments]    ${fullname}    ${id}    ${gender}    ${cellphone}
    ${fullname_locator}=    Set Variable    //span[contains(@data-bind,'patient_fullname')]
    ${id_locator}=    Set Variable    //span[contains(@data-bind,'patient_id')]
    ${gender_locator}=    Set Variable    //span[contains(@data-bind,'patient_gender')]
    ${cellphone_locator}=    Set Variable    //span[contains(@data-bind,'patient_cellphone')]
    ${actual_fullname}=    Get Text    ${fullname_locator}
    Should Contain    ${actual_fullname}    ${fullname}
    ${actual_id}=    Get Text    ${id_locator}
    Should Contain    ${actual_id}    ${id}
    ${actual_gender}=    Get Text    ${gender_locator}
    Should Contain    ${actual_gender}    ${gender}
    ${actual_cellphone}=    Get Text    ${cellphone_locator}
    Should Contain    ${actual_cellphone}    ${cellphone}

Save Sick Note Form
    [Documentation]    Saves the Sick Note form.
    Click    ${BTN_SAVE_LIGHT_DUTY}
    Wait Until Element Is Invisible    ${BTN_SAVE_LIGHT_DUTY}    timeout=${LONG_WAIT}

Print Sick Note
    [Documentation]    Prints the Sick Note and includes QR Code and signature if enabled.
    [Arguments]    ${qr_code_enabled}    ${include_signature}
    Click    ${BTN_PRINT_CHOOSE_DOWNLOAD}
    Wait Until Element Is Visible    ${BTN_PRINT_DOWNLOAD}    ${LONG_WAIT}
    Run Keyword If    '${qr_code_enabled}'=='True'    Validate QR Code Is Present On Printout
    Run Keyword If    '${include_signature}'=='True'    Validate Signature Is Present On Printout
    Click    ${BTN_PRINT_DOWNLOAD}
    Wait Until Element Is Invisible    ${BTN_PRINT_DOWNLOAD}    timeout=${LONG_WAIT}

Validate QR Code Is Present On Printout
    [Documentation]    Validates that QR Code is present on the printout if enabled.
    ${qr_code_locator}=    Set Variable    //img[contains(@src,'qrcode')]
    Wait Until Element Is Visible    locator=${qr_code_locator}    timeout=${LONG_WAIT}

Validate Signature Is Present On Printout
    [Documentation]    Validates that Doctor's signature is present on the printout if enabled.
    ${signature_img_locator}=    Set Variable    //img[contains(@src,'signature')]
    Wait Until Element Is Visible    locator=${signature_img_locator}    timeout=${LONG_WAIT}

Email Sick Note To Patient
    [Documentation]    Emails the Sick Note to the patient with subject and body.
    [Arguments]    ${send_to}    ${subject}    ${body}
    Click    ${BTN_EMAIL}
    Wait Until Element Is Visible    ${BTN_EMAIL_SEND}    ${LONG_WAIT}
    Fill Sick Note Email Fields    ${send_to}    ${subject}    ${body}
    Click    ${BTN_EMAIL_SEND}
    Wait Until Element Is Invisible    ${BTN_EMAIL_SEND}    timeout=${LONG_WAIT}

Fill Sick Note Email Fields
    [Documentation]    Fills in the email fields for sending the Sick Note.
    [Arguments]    ${send_to}    ${subject}    ${body}
    ${to_field_locator}=    Set Variable    //input[contains(@data-bind,'email_to')]
    ${subject_field_locator}=    Set Variable    //input[contains(@data-bind,'email_subject')]
    ${body_field_locator}=    Set Variable    //textarea[contains(@data-bind,'email_body')]
    Fill Text    ${to_field_locator}    ${send_to}
    Fill Text    ${subject_field_locator}    ${subject}
    Fill Text    ${body_field_locator}    ${body}

Validate Sick Note Saved In Clinical Record And Communication Log
    [Documentation]    Validates that the Sick Note is saved in the Clinical record and email/print logs are recorded.
    [Arguments]    ${patient_fullname}    ${email_to}
    Validate Sick Note Exists In Clinical Record    ${patient_fullname}
    Validate Sick Note Email Log Exists    ${email_to}
    Validate Sick Note Print Log Exists

Validate Sick Note Exists In Clinical Record
    [Documentation]    Validates that the Sick Note is present in the Clinical record for the patient.
    [Arguments]    ${patient_fullname}
    ${clinical_record_locator}=    Set Variable    //div[contains(@class,'clinical-record')]//span[contains(text(),'${patient_fullname}') and contains(text(),'SICK NOTE')]
    Wait Until Element Is Visible    locator=${clinical_record_locator}    timeout=${LONG_WAIT}

Validate Sick Note Email Log Exists
    [Documentation]    Validates that the email log for the Sick Note exists for the patient.
    [Arguments]    ${email_to}
    ${email_log_locator}=    Set Variable    //div[contains(@class,'communication-history')]//span[contains(text(),'${email_to}') and contains(text(),'SICK NOTE')]
    Wait Until Element Is Visible    locator=${email_log_locator}    timeout=${LONG_WAIT}

Validate Sick Note Print Log Exists
    [Documentation]    Validates that the print log for the Sick Note exists for the patient.
    ${print_log_locator}=    Set Variable    //div[contains(@class,'communication-history')]//span[contains(text(),'Print') and contains(text(),'SICK NOTE')]
    Wait Until Element Is Visible    locator=${print_log_locator}    timeout=${LONG_WAIT}
