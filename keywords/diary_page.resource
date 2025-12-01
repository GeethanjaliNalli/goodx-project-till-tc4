*** Settings ***
Documentation    This diary page resource file has all the Diary and Clinical Form related keywords for Sick Note workflows.
Resource    ../common/super.resource

*** Keywords ***
Open Clinical Forms For Booking
    [Documentation]    Opens the Clinical Forms section for the selected booking from the Diary grid.
    Click    ${BOOKING_ACTION_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${dialog.forms_library}    ${LONG_WAIT}

Select Clinical Form
    [Documentation]    Selects the required clinical form (e.g., Sick Note) from the Clinical Forms library and adds it to active forms.
    [Arguments]    ${form_name}
    Click    ${CLINICAL_FORMS_LOCATORS}[select.forms_library]
    Run Keyword If    '${form_name}' == 'Sick Note'    Select Options By    ${CLINICAL_FORMS_LOCATORS}[select.forms_library]    label    SICK NOTE
    Click    ${CLINICAL_FORMS_LOCATORS}[button.add_form]
    Wait Until Element Is Visible    ${dialog.clinical_form}    ${LONG_WAIT}

Fill Sick Note Form
    [Documentation]    Fills the Sick Note (Medical Certificate) clinical form fields dynamically using dictionary keys.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${is_input}    Evaluate Expression    '${field}'.startswith('input.')
        ${is_select}    Evaluate Expression    '${field}'.startswith('select.')
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    ${is_input}    Fill Sick Note Input Field    ${field}    ${value}
        Run Keyword If    ${is_select}    Select Sick Note Option Field    ${field}    ${value}
    END

Fill Sick Note Input Field
    [Documentation]    Fills a single input field in the Sick Note form using the correct locator dictionary.
    [Arguments]    ${field}    ${value}
    ${locator}    Get From Dictionary    ${SICK_NOTE_INPUT_LOCATORS}    ${field}
    Fill Text    ${locator}    ${value}

Select Sick Note Option Field
    [Documentation]    Selects an option in a select field in the Sick Note form using the correct locator dictionary.
    [Arguments]    ${field}    ${value}
    ${locator}    Get From Dictionary    ${SICK_NOTE_SELECT_LOCATORS}    ${field}
    Select Options By    ${locator}    label    ${value}

Save Clinical Form
    [Documentation]    Saves the current Clinical Form (e.g., Sick Note) and waits for the dialog to close.
    Click    ${CLINICAL_FORMS_LOCATORS}[button.complete_stage]
    Wait Until Element Is Invisible    ${dialog.clinical_form}    ${LONG_WAIT}

Validate Clinical Record Entry
    [Documentation]    Validates that the Sick Note is saved in the Patient's Clinical record by checking for the entry with patient name, date, and reason.
    [Arguments]    ${patient_name}    ${booking_date}    ${reason}
    Click    ${BOOKING_ACTION_LOCATORS}[button.clinical_history]
    ${entry_locator}    Set Variable    //div[contains(@class,'clinical-record')]//div[contains(.,'${patient_name}') and contains(.,'${booking_date}') and contains(.,'${reason}')]
    Wait Until Element Is Visible    ${entry_locator}    ${LONG_WAIT}
    ${entry_text}    Get Text    ${entry_locator}
    Should Contain    ${entry_text}    ${patient_name}
    Should Contain    ${entry_text}    ${booking_date}
    Should Contain    ${entry_text}    ${reason}

Validate Communication Log Entry
    [Documentation]    Validates that a communication log entry (Email or Print) is recorded in the Patient's communication history.
    [Arguments]    ${patient_name}    ${log_type}    ${expected_value}
    Click    ${BOOKING_ACTION_LOCATORS}[button.patient_dashboard]
    ${log_locator}    Set Variable    //div[contains(@class,'communication-history')]//div[contains(.,'${patient_name}') and contains(.,'${log_type}') and contains(.,'${expected_value}')]
    Wait Until Element Is Visible    ${log_locator}    ${LONG_WAIT}
    ${log_text}    Get Text    ${log_locator}
    Should Contain    ${log_text}    ${log_type}
    Should Contain    ${log_text}    ${expected_value}

Validate QR Code On Printout
    [Documentation]    Validates that the QR Code appears on the printout if enabled in the Sick Note form.
    [Arguments]    ${include_qr_code}
    Run Keyword If    '${include_qr_code}' == 'Yes'    Print Sick Note And Validate QR Code

Print Sick Note And Validate QR Code
    [Documentation]    Triggers print for the Sick Note and validates QR Code presence on the print preview.
    Click    ${CLINICAL_FORMS_LOCATORS}[button.print_pdf]
    Wait Until Element Is Visible    //div[contains(@class,'print-preview')]    ${LONG_WAIT}
    ${qr_code_element}    Set Variable    //div[contains(@class,'print-preview')]//img[contains(@src,'qr')]
    Wait Until Element Is Visible    ${qr_code_element}    ${LONG_WAIT}

# --- Form Locators Dictionaries for Sick Note Clinical Form ---
&{SICK_NOTE_INPUT_LOCATORS}
    input.patient_name=${PATIENT_DETAILS_LOCATORS}[input.patient_name]
    input.patient_id=${PATIENT_DETAILS_LOCATORS}[input.patient_name]
    input.booking_date=${BOOKING_GRID_LOCATORS}[input.current_date]
    input.booking_time=${BOOKING_GRID_LOCATORS}[cell.booking_time]
    input.doctor_name=${PRACTITIONER_DETAILS_LOCATORS}[input.treating_doctor_name]
    input.doctor_signature=${PRACTITIONER_DETAILS_LOCATORS}[input.treating_doctor_name]
    input.doctor_email=${PRACTITIONER_DETAILS_LOCATORS}[input.treating_doctor_name]
    input.reason=${BOOKING_GRID_LOCATORS}[cell.reason]
    input.sick_from=${BOOKING_GRID_LOCATORS}[input.current_date]
    input.sick_to=${BOOKING_GRID_LOCATORS}[input.current_date]
    input.diagnosis=${BOOKING_GRID_LOCATORS}[cell.summary]
    input.recommendations=${BOOKING_GRID_LOCATORS}[cell.summary]

&{SICK_NOTE_SELECT_LOCATORS}
    select.include_qr_code=${CLINICAL_FORMS_LOCATORS}[select.forms_library]
    select.send_email=${CLINICAL_FORMS_LOCATORS}[select.forms_library]
    select.print=${CLINICAL_FORMS_LOCATORS}[select.forms_library]
