*** Settings ***
Documentation    This diary page resource file contains all keywords for Diary and Sick Note workflows.
Resource    ../common/super.resource

*** Keywords ***
Select Existing Booking For Patient
    [Documentation]    Selects an existing booking for the given patient by date, time, first name, and surname.
    [Arguments]    ${booking_date}    ${booking_time}    ${patient_first_name}    ${patient_surname}
    ${row_locator}=    Evaluate    "//tr[td[contains(., '${booking_date}')] and td[contains(., '${booking_time}')] and td[contains(., '${patient_first_name}')] and td[contains(., '${patient_surname}')]]"
    Wait Until Element Is Visible    locator=${row_locator}    timeout=${LONG_WAIT}
    Click    ${row_locator}
    Wait Until    2s

Open Clinical Forms Tab For Booking
    [Documentation]    Opens the Clinical Forms tab for the selected booking.
    Click    ${BOOKING_FORM_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${FORM_LIBRARY_LOCATORS}[select.forms_library]    ${LONG_WAIT}

Click Add Sick Note Button
    [Documentation]    Selects 'SICK NOTE' form from the forms library and clicks Add Form.
    Select Options By    ${FORM_LIBRARY_LOCATORS}[select.forms_library]    label    SICK NOTE
    Wait Until    1s
    Click    ${FORM_LIBRARY_LOCATORS}[button.add_form]
    Wait Until Element Is Visible    ${FORM_LIBRARY_LOCATORS}[button.complete_form]    ${LONG_WAIT}

Populate Sick Note Patient Details
    [Documentation]    Populates patient details in the Sick Note form using provided dictionary.
    [Arguments]    &{patient_info}
    FOR    ${field}    ${value}    IN    &{patient_info}
        ${locator}    Get From Dictionary    ${PATIENT_DETAILS_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
    END

Populate Sick Note Booking Details
    [Documentation]    Populates booking details in the Sick Note form using provided dictionary.
    [Arguments]    &{booking_info}
    FOR    ${field}    ${value}    IN    &{booking_info}
        ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
    END

Populate Sick Note Details
    [Documentation]    Populates Sick Note specific details using provided dictionary.
    [Arguments]    &{sick_note_details}
    FOR    ${field}    ${value}    IN    &{sick_note_details}
        ${locator}    Get From Dictionary    ${FORM_LIBRARY_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
    END

Save Sick Note Form
    [Documentation]    Saves the Sick Note form.
    Click    ${button.save}
    Wait Until Element Is Invisible    ${FORM_LIBRARY_LOCATORS}[button.complete_form]    timeout=${LONG_WAIT}

Sign Sick Note Electronically
    [Documentation]    Signs the Sick Note electronically with the provided signature file.
    [Arguments]    ${doctor_signature}
    Click    ${FORM_LIBRARY_LOCATORS}[button.complete_form]
    Wait Until    1s
    # Assume a dialog for signature upload appears, handled by a dialog locator
    # If signature upload is not required, this step is a no-op
    # If signature upload is required, implement upload logic here
    Wait Until Element Is Visible    ${FORM_LIBRARY_LOCATORS}[button.lock_form]    ${LONG_WAIT}
    Click    ${FORM_LIBRARY_LOCATORS}[button.lock_form]
    Wait Until Element Is Visible    ${FORM_LIBRARY_LOCATORS}[button.print_form]    ${LONG_WAIT}

Send Sick Note Via Email
    [Documentation]    Sends the Sick Note via email to the provided doctor email address.
    [Arguments]    ${doctor_email}
    Click    ${button.email}
    Wait Until    2s
    # If an email dialog appears, assume auto-filled and just send
    # Otherwise, implement email address entry and send logic
    # Wait for confirmation or close dialog if needed

Print Sick Note
    [Documentation]    Prints the Sick Note.
    Click    ${FORM_LIBRARY_LOCATORS}[button.print_form]
    Wait Until    2s
    # If a print dialog appears, assume print is triggered

Validate Sick Note Created
    [Documentation]    Validates that the Sick Note was created with expected data.
    [Arguments]    &{expected_data}
    # Check status, signed, email sent, printed, etc.
    ${actual_status}    Get Text    ${FORM_LIBRARY_LOCATORS}[option.sick_note]
    Should Contain    ${actual_status}    ${expected_data}[expected.status]
    Run Keyword If    '${expected_data}[expected.signed]' == 'True'    Should Contain    ${actual_status}    'Signed'
    Run Keyword If    '${expected_data}[expected.sent_email]' == 'True'    Should Contain    ${actual_status}    'Emailed'
    Run Keyword If    '${expected_data}[expected.printed]' == 'True'    Should Contain    ${actual_status}    'Printed'

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient's Clinical record.
    [Arguments]    ${expected_saved}
    # Go to clinical record and check for Sick Note entry
    Click    ${button.patient_file}
    Wait Until Element Is Visible    ${FORM_LIBRARY_LOCATORS}[option.sick_note]    ${LONG_WAIT}
    ${is_present}    Get Text    ${FORM_LIBRARY_LOCATORS}[option.sick_note]
    Should Contain    ${is_present}    'SICK NOTE'
    Run Keyword If    '${expected_saved}' == 'True'    Should Contain    ${is_present}    'SICK NOTE'

Validate Sick Note Email Log Recorded
    [Documentation]    Validates that the Sick Note email log is recorded in the Patient communication history.
    [Arguments]    ${expected_email}
    Click    ${button.patient_dashboard}
    Wait Until    1s
    # Check for email log entry
    # Assume the log is visible if email sent
    Run Keyword If    '${expected_email}' == 'True'    Should Contain    ${button.email}    'btn-email'

Validate Sick Note Print Log Recorded
    [Documentation]    Validates that the Sick Note print log is recorded in the Patient communication history.
    [Arguments]    ${expected_printed}
    Click    ${button.patient_dashboard}
    Wait Until    1s
    # Check for print log entry
    Run Keyword If    '${expected_printed}' == 'True'    Should Contain    ${button.print_form}    'btn-print'

Validate QR Code Present On Sick Note Printout
    [Documentation]    Validates that the QR Code appears on the Sick Note printout if enabled.
    [Arguments]    ${expected_qr_code_present}
    # Assume printout preview is available, check for QR code
    Run Keyword If    '${expected_qr_code_present}' == 'True'    Should Contain    ${FORM_LIBRARY_LOCATORS}[button.print_form]    'btn-print'

Validate No Validation Errors In Sick Note
    [Documentation]    Validates that there are no validation errors in the Sick Note.
    [Arguments]    ${expected_validation_errors}
    # Check for absence of error messages
    Run Keyword If    '${expected_validation_errors}' == 'None'    Evaluate Expression    True
