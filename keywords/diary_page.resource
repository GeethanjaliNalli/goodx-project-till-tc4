*** Settings ***
Documentation    This diary page resource file has all the Diary and Clinical Forms related keywords for Sick Note functionality.
Resource    ../common/super.resource
Resource    ../object_repository/diary_page.resource

*** Keywords ***
Open Booking Details For Patient
    [Documentation]    Opens the booking details for the specified patient in the Diary grid.
    [Arguments]    ${patient_name}
    ${booking_locator}    Set Variable    ${DIARY_GRID_LOCATORS.grid.booking_patient_name}
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    ${all_names}    Get Elements    ${booking_locator}
    FOR    ${el}    IN    @{all_names}
        ${text}    Get Text    ${el}
        Run Keyword If    '${text}' == '${patient_name}'    Click    ${el}
        Run Keyword If    '${text}' == '${patient_name}'    Exit For Loop
    END
    Wait Until    1s

Open Clinical Forms Tab
    [Documentation]    Opens the Clinical Forms tab from the booking details sidebar.
    Click    ${SIDEBAR_BUTTONS_LOCATORS.button.clinical}
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS.select.form_type}    ${LONG_WAIT}

Select Sick Note Form
    [Documentation]    Selects the Sick Note form from the Clinical Forms dropdown.
    Select Options By    ${CLINICAL_FORMS_LOCATORS.select.form_type}    label    SICK NOTE
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS.label.active_form}    ${LONG_WAIT}

Fill Sick Note Form
    [Documentation]    Fills the Sick Note form fields dynamically using the provided dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')    Fill Sick Note Select Field    ${field}    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Sick Note Input Field    ${field}    ${value}
    END

Fill Sick Note Input Field
    [Documentation]    Fills a text input field in the Sick Note form.
    [Arguments]    ${field}    ${value}
    ${input_locators}    Create Dictionary    input.patient_name=${PATIENT_DETAILS_LOCATORS.label.patient_name}    input.patient_id=${PATIENT_DETAILS_LOCATORS.label.patient_file_number}    input.booking_date=${DIARY_GRID_LOCATORS.grid.booking_date}    input.booking_time=${DIARY_GRID_LOCATORS.grid.booking_start_time}    input.doctor_name=${PRACTITIONER_DETAILS_LOCATORS.label.practitioner_name}    input.doctor_signature=    input.doctor_email=    input.reason=${DIARY_GRID_LOCATORS.grid.booking_reason}    input.illness_description=    input.sick_from=    input.sick_to=    input.days_off=
    ${locator}    Get From Dictionary    ${input_locators}    ${field}
    Run Keyword If    '${locator}' != ''    Fill Text    ${locator}    ${value}

Fill Sick Note Select Field
    [Documentation]    Selects an option in a select field in the Sick Note form.
    [Arguments]    ${field}    ${value}
    ${select_locators}    Create Dictionary    select.qr_code_enabled=${CLINICAL_FORMS_LOCATORS.select.form_type}    select.print_copy=    select.email_copy=
    ${locator}    Get From Dictionary    ${select_locators}    ${field}
    Run Keyword If    '${locator}' != ''    Select Options By    ${locator}    label    ${value}

Save Sick Note Form
    [Documentation]    Saves the Sick Note form and waits until it is saved.
    Click    ${CLINICAL_FORMS_LOCATORS.button.save}
    Wait Until Element Is Invisible    ${CLINICAL_FORMS_LOCATORS.label.active_form}    timeout=${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient's Clinical record.
    [Arguments]    ${expected_entry}
    Click    ${SIDEBAR_BUTTONS_LOCATORS.button.patient_file}
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS.label.active_form}    ${LONG_WAIT}
    ${actual_entry}    Get Text    ${CLINICAL_FORMS_LOCATORS.label.active_form}
    Should Contain    ${actual_entry}    ${expected_entry}

Validate Communication History For Sick Note
    [Documentation]    Validates that Email and Print logs are recorded in the Patient communication history for the Sick Note.
    [Arguments]    ${expected_history}
    Click    ${SIDEBAR_BUTTONS_LOCATORS.button.patient_dashboard}
    Wait Until Element Is Visible    ${SIDEBAR_BUTTONS_LOCATORS.button.email}    ${LONG_WAIT}
    Click    ${SIDEBAR_BUTTONS_LOCATORS.button.email}
    Wait Until Element Is Visible    ${SIDEBAR_BUTTONS_LOCATORS.button.email}    ${LONG_WAIT}
    ${actual_history}    Get Text    ${SIDEBAR_BUTTONS_LOCATORS.button.email}
    Should Contain    ${actual_history}    ${expected_history}

Validate QR Code On Sick Note Printout
    [Documentation]    Validates that the QR Code appears on the Sick Note printout if enabled.
    [Arguments]    ${expected_status}
    Click    ${CLINICAL_FORMS_LOCATORS.button.print_pdf}
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS.button.print_pdf}    ${LONG_WAIT}
    ${qr_code_text}    Get Text    ${CLINICAL_FORMS_LOCATORS.button.print_pdf}
    Should Contain    ${qr_code_text}    ${expected_status}
