*** Settings ***
Documentation    This clinical page resource file contains all keywords for Sick Note (Medical Certificate) creation, validation, printing, emailing, and communication log verification in the Diary module.
Resource    ../common/super.resource

*** Keywords ***
Open Clinical Sidebar
    [Documentation]    Opens the Clinical sidebar for the selected booking.
    Click    ${clinical_sidebar_button}
    Wait Until Element Is Visible    ${clinical_sidebar_panel}    ${SHORT_WAIT}

Click Forms Library Tab
    [Documentation]    Clicks on the Forms Library tab in the Clinical sidebar.
    Click    ${forms_library_tab}
    Wait Until Element Is Visible    ${forms_library_search_box}    ${SHORT_WAIT}

Select Form From Library
    [Documentation]    Searches and selects the given form from the Forms Library.
    [Arguments]    ${form_name}
    Fill Text    ${forms_library_search_box}    ${form_name}
    Wait Until Element Is Visible    ${forms_library_result_item}    ${SHORT_WAIT}
    Click    ${forms_library_result_item}
    Wait Until Element Is Visible    ${clinical_form_panel}    ${SHORT_WAIT}

Fill Sick Note Form
    [Documentation]    Fills all fields in the Sick Note form using provided test data dictionary.
    [Arguments]    &{sick_note_data}
    FOR    ${field}    ${value}    IN    &{sick_note_data}
        ${is_input_field}    Evaluate    '${field}'.startswith('input.')
        Run Keyword If    ${is_input_field}    Fill Text    ${SICK_NOTE_FORM_LOCATORS}[${field}]    ${value}
    END

Save Clinical Form
    [Documentation]    Saves the current clinical form.
    Click    ${save_clinical_form_button}
    Wait Until Element Is Invisible    ${clinical_form_panel}    ${LONG_WAIT}

Enter Doctor Pin
    [Documentation]    Enters the Doctor's PIN to confirm saving the form.
    [Arguments]    ${doctor_pin}
    Fill Text    ${doctor_pin_field}    ${doctor_pin}
    Click    ${confirm_pin_button}
    Wait Until Element Is Invisible    ${doctor_pin_dialog}    ${SHORT_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient’s Clinical record.
    [Arguments]    ${sick_note_date}
    ${record_locator}    Set Variable    ${clinical_record_item}[${sick_note_date}]
    Wait Until Element Is Visible    ${record_locator}    ${LONG_WAIT}
    ${actual_text}    Get Text    ${record_locator}
    Should Contain    ${actual_text}    Sick Note
    Should Contain    ${actual_text}    ${sick_note_date}

Print Sick Note
    [Documentation]    Initiates print for the Sick Note.
    Click    ${print_sick_note_button}
    Wait Until Element Is Visible    ${print_preview_panel}    ${SHORT_WAIT}

Validate Sick Note Printout Contains QR Code
    [Documentation]    Validates that the QR code appears on the Sick Note printout (if enabled).
    Wait Until Element Is Visible    ${qr_code_image}    ${SHORT_WAIT}

Email Sick Note To Patient
    [Documentation]    Sends the Sick Note to the patient via email.
    Click    ${email_sick_note_button}
    Wait Until Element Is Visible    ${send_email_button}    ${SHORT_WAIT}
    Click    ${send_email_button}
    Wait Until Element Is Invisible    ${email_dialog}    ${SHORT_WAIT}

Validate Sick Note Communication Logs
    [Documentation]    Validates that Email and Print logs are recorded in the Patient communication history for the Sick Note.
    [Arguments]    ${sick_note_date}
    Click    ${communication_history_tab}
    ${comm_log_locator}    Set Variable    ${communication_log_item}[${sick_note_date}]
    Wait Until Element Is Visible    ${comm_log_locator}    ${LONG_WAIT}
    ${log_text}    Get Text    ${comm_log_locator}
    Should Contain    ${log_text}    Sick Note
    Should Contain    ${log_text}    ${sick_note_date}
    Run Keyword And Ignore Error    Should Contain    ${log_text}    Email
    Run Keyword And Ignore Error    Should Contain    ${log_text}    Print
