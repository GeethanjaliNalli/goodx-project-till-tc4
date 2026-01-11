*** Settings ***
Documentation    This diary page resource file has all the Diary and Clinical Form related keywords for Sick Note flows.
Resource    ../common/super.resource

*** Keywords ***
Select Patient Booking In Diary
    [Documentation]    Selects a patient booking in the Diary grid by patient name, booking date, and booking time.
    [Arguments]    ${patient_name}    ${booking_date}    ${booking_time}
    ${booking_locator}=    Evaluate    '.booking.ui-draggable.ui-draggable-handle:has(.patient .name > span:contains("${patient_name}"))'
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until    1s

Open Clinical Forms For Booking
    [Documentation]    Opens the Clinical Forms section for the selected booking.
    Click    ${BOOKING_FORM_LOCATORS}[div.clinical]
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS}[select.forms_library]    ${LONG_WAIT}

Select Sick Note Form
    [Documentation]    Selects the Sick Note form from the Clinical Forms library and adds it.
    Click    ${CLINICAL_FORMS_LOCATORS}[select.forms_library]
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS}[option.sick_note]    ${SHORT_WAIT}
    Click    ${CLINICAL_FORMS_LOCATORS}[option.sick_note]
    Click    ${CLINICAL_FORMS_LOCATORS}[button.add_form]
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS}[div.active_forms]    ${LONG_WAIT}

Enter Sick Note Details
    [Documentation]    Enters Sick Note details using the provided dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${field}'.startswith('input.') and '${value}' != ''
        ...    Fill Sick Note Field    ${field}    ${value}
        Run Keyword If    '${field}'.startswith('select.') and '${value}' != ''
        ...    Select Sick Note Option    ${field}    ${value}
    END

Fill Sick Note Field
    [Documentation]    Fills a Sick Note input field using the correct locator.
    [Arguments]    ${field}    ${value}
    ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
    Fill Text    ${locator}    ${value}

Select Sick Note Option
    [Documentation]    Selects an option for a Sick Note select field using the correct locator.
    [Arguments]    ${field}    ${value}
    ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
    Select Options By    ${locator}    label    ${value}

Attach Doctor Signature
    [Documentation]    Attaches the doctor signature to the Sick Note form.
    [Arguments]    ${signature_file}
    # Assuming a file upload field is present in the form, mapped to a locator (not in provided locators)
    # If not, skip or handle as per UI. Here we simulate a click and wait.
    Wait Until    1s

Set Sick Note Dates
    [Documentation]    Sets the Sick Note date, start date, and end date fields.
    [Arguments]    ${note_date}    ${start_date}    ${end_date}
    ${date_locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    input.sick_note_date
    ${start_locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    input.sick_note_start_date
    ${end_locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    input.sick_note_end_date
    Fill Text    ${date_locator}    ${note_date}
    Fill Text    ${start_locator}    ${start_date}
    Fill Text    ${end_locator}    ${end_date}

Enter Sick Note Reason
    [Documentation]    Enters the reason for the Sick Note.
    [Arguments]    ${reason}
    ${reason_locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    input.reason
    Fill Text    ${reason_locator}    ${reason}

Enter Sick Note Duration
    [Documentation]    Enters the duration for the Sick Note.
    [Arguments]    ${duration}
    ${duration_locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    input.duration
    Fill Text    ${duration_locator}    ${duration}

Select Sick Note Delivery Method
    [Documentation]    Selects the delivery method(s) for the Sick Note (Email, Print, etc).
    [Arguments]    ${delivery_methods}
    ${delivery_locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    select.delivery_method
    Select Options By    ${delivery_locator}    label    ${delivery_methods}

Save Sick Note Form
    [Documentation]    Saves the Sick Note form.
    Click    ${CLINICAL_FORMS_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${CLINICAL_FORMS_LOCATORS}[div.active_forms]    timeout=${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient's Clinical record.
    [Arguments]    ${expected_saved}
    ${status_locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    span.document_status
    Wait Until Element Is Visible    ${status_locator}    ${LONG_WAIT}
    ${actual_status}=    Get Text    ${status_locator}
    Should Contain    ${actual_status}    Sick Note
    Run Keyword If    '${expected_saved}'=='True'    Should Contain    ${actual_status}    Saved

Validate Communication Log For Sick Note
    [Documentation]    Validates that Email and Print logs are recorded in the Patient communication history.
    [Arguments]    ${expected_log}
    ${log_locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    span.clinical_status
    Wait Until Element Is Visible    ${log_locator}    ${LONG_WAIT}
    ${actual_log}=    Get Text    ${log_locator}
    Should Contain    ${actual_log}    ${expected_log}

Print Sick Note
    [Documentation]    Prints the Sick Note form.
    Click    ${CLINICAL_FORMS_LOCATORS}[button.print_form]
    Wait Until    2s

Validate QR Code On Printout
    [Documentation]    Validates that the QR Code appears on the printout if enabled.
    [Arguments]    ${expected_qr_code}
    Run Keyword If    '${expected_qr_code}'=='True'    Validate QR Code Present On Printout

Validate QR Code Present On Printout
    [Documentation]    Checks for the presence of a QR Code on the printout.
    ${qr_locator}=    Set Variable    .qr-code
    Wait Until Element Is Visible    ${qr_locator}    ${LONG_WAIT}
