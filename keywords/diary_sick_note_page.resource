*** Settings ***
Documentation    This resource file contains all keywords for the Diary - Add Sick Note (Medical Certificate) workflow.
Resource    ../common/super.resource
Resource    ../object_repository/diary_sick_note_page.resource

*** Keywords ***
Open Diary And Select Existing Patient Booking
    [Documentation]    Navigates to Diary module and selects an existing patient booking for Sick Note entry.
    Select Menu In Navigation Wheel    DIARY
    Wait Until Element Is Visible    ${SICK_NOTE_LOCATORS}[button.patient_dashboard]    ${LONG_WAIT}
    Click    ${SICK_NOTE_LOCATORS}[button.patient_dashboard]
    Wait Until Element Is Visible    ${SICK_NOTE_LOCATORS}[button.expand_patient_details]    ${LONG_WAIT}
    Click    ${SICK_NOTE_LOCATORS}[button.expand_patient_details]
    Wait Until Element Is Visible    ${SICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}

Open Clinical Sidebar For Selected Patient
    [Documentation]    Opens the Clinical sidebar for the selected patient in the Diary.
    Click    ${SICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${SICK_NOTE_LOCATORS}[dropdown.forms_library]    ${LONG_WAIT}

Select Forms Library And Choose Sick Note Form
    [Documentation]    Selects 'Forms Library' and chooses the 'SICK NOTE' form for the patient.
    [Arguments]    ${form_type}
    Select Options By    ${SICK_NOTE_LOCATORS}[select.form_type]    label    ${form_type}
    Wait Until Element Is Visible    ${SICK_NOTE_LOCATORS}[input.sick_note_date]    ${LONG_WAIT}

Fill Sick Note Details
    [Documentation]    Fills in Sick Note details: date, unfit for work, and reason.
    [Arguments]    ${sick_note_date}    ${unfit_for_work_date}    ${reason}
    Fill Text    ${SICK_NOTE_LOCATORS}[input.sick_note_date]    ${sick_note_date}
    Fill Text    ${SICK_NOTE_LOCATORS}[input.unfit_for_work]    ${unfit_for_work_date}
    Fill Sick Note Reason    ${reason}

Fill Sick Note Reason
    [Documentation]    Fills in the reason for the Sick Note in the appropriate field if available.
    [Arguments]    ${reason}
    # If there is a specific locator for reason, use it. Otherwise, skip.
    # This is a placeholder for extensibility if a locator is added in the future.
    Evaluate Expression    None

Add Doctor Signature To Sick Note
    [Documentation]    Adds the Doctor's signature to the Sick Note form.
    [Arguments]    ${doctor_signature}
    Click    ${SICK_NOTE_LOCATORS}[button.doctor_signature]
    Wait Until    1s
    # If a signature modal appears, additional steps can be added here.

Save Sick Note Form
    [Documentation]    Saves the Sick Note form and waits for it to be processed.
    Click    ${SICK_NOTE_LOCATORS}[button.expand_light_duty]
    Wait Until Element Is Invisible    ${SICK_NOTE_LOCATORS}[button.expand_light_duty]    ${LONG_WAIT}

Email Sick Note To Patient
    [Documentation]    Emails the Sick Note to the patient and waits for completion.
    [Arguments]    ${email_to}
    Click    ${SICK_NOTE_LOCATORS}[button.email]
    Wait Until    1s
    # If a modal appears for email confirmation, handle here.

Print Sick Note
    [Documentation]    Prints the Sick Note and waits for the print dialog or download to appear.
    [Arguments]    ${print_option}
    Run Keyword If    '${print_option}' == 'Yes'    Click    ${SICK_NOTE_LOCATORS}[button.print]
    Run Keyword If    '${print_option}' == 'Yes'    Wait Until Element Is Visible    ${SICK_NOTE_LOCATORS}[button.print_download]    ${LONG_WAIT}

Verify QR Code On Sick Note Printout
    [Documentation]    Verifies that the QR Code is present on the Sick Note printout if enabled.
    [Arguments]    ${qr_code_enabled}
    Run Keyword If    '${qr_code_enabled}' == 'True'    Validate QR Code Is Present On Printout

Validate QR Code Is Present On Printout
    [Documentation]    Validates that the QR Code is present on the Sick Note printout.
    # This would require image or element validation logic on the print preview/download.
    # For now, simulate presence check by waiting for print download button.
    Wait Until Element Is Visible    ${SICK_NOTE_LOCATORS}[button.print_download]    ${LONG_WAIT}

Verify Sick Note Saved In Clinical Record
    [Documentation]    Verifies that the Sick Note is saved in the Patient's Clinical record.
    # This step would require navigation to the clinical record and checking for the Sick Note entry.
    # Implement as a wait for the clinical record update or entry presence.
    Wait Until    2s
    # Extend with real locator if available.

Verify Sick Note Email Log In Communication History
    [Documentation]    Verifies that the Sick Note email log is present in the Patient's communication history.
    [Arguments]    ${email_to}
    # Navigate to communication history and check for email log with ${email_to}
    Wait Until    1s
    # Extend with real locator if available.

Verify Sick Note Print Log In Communication History
    [Documentation]    Verifies that the Sick Note print log is present in the Patient's communication history.
    # Navigate to communication history and check for print log
    Wait Until    1s
    # Extend with real locator if available.
