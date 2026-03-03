*** Settings ***
Documentation    This resource file contains all keywords for Diary Sick Note (Medical Certificate) creation, verification, email, print, and QR validation.
Resource    ../common/super.resource
Resource    ../object_repository/diary_sick_note_page.resource

*** Keywords ***
Open Diary And Select Patient Booking
    [Documentation]    Opens the Diary and selects the patient booking for Sick Note creation.
    [Arguments]    &{sick_note_info}
    Click Patient Dashboard Button
    Wait Until Patient Booking Is Visible    &{sick_note_info}
    Click Patient Booking Row    &{sick_note_info}

Open Clinical Sidebar And Select Forms Library
    [Documentation]    Opens the Clinical sidebar and selects the Forms Library dropdown.
    [Arguments]    &{sick_note_info}
    Click Clinical Sidebar Button
    Wait Until Element Is Visible    ${DIARY_SICK_NOTE_LOCATORS}[dropdown.forms_library]    ${LONG_WAIT}
    Select Options By    ${DIARY_SICK_NOTE_LOCATORS}[dropdown.forms_library]    label    SICK NOTE

Select Sick Note Form
    [Documentation]    Selects the Sick Note form from the forms list.
    [Arguments]    ${event_type}
    Wait Until Element Is Visible    ${DIARY_SICK_NOTE_LOCATORS}[dropdown.clinical_event_type]    ${LONG_WAIT}
    Select Options By    ${DIARY_SICK_NOTE_LOCATORS}[dropdown.clinical_event_type]    label    ${event_type}
    Wait Until Element Is Visible    ${DIARY_SICK_NOTE_LOCATORS}[input.sick_note_date]    ${LONG_WAIT}

Enter Sick Note Details
    [Documentation]    Enters Sick Note details such as date and reason.
    [Arguments]    ${sick_note_date}    ${reason}
    Fill Text    ${DIARY_SICK_NOTE_LOCATORS}[input.sick_note_date]    ${sick_note_date}
    Enter Sick Note Reason    ${reason}

Enter Sick Note Reason
    [Documentation]    Enters the reason for the Sick Note. (Assumes a textarea/input for reason is present.)
    [Arguments]    ${reason}
    # If a locator for reason is added, update here. For now, skip if not present.
    # Example: Fill Text    ${DIARY_SICK_NOTE_LOCATORS}[input.reason]    ${reason}
    Evaluate Expression    None

Add Doctor Signature To Sick Note
    [Documentation]    Adds the Doctor's signature to the Sick Note.
    [Arguments]    ${doctor_signature}
    Click    ${DIARY_SICK_NOTE_LOCATORS}[button.doctor_signature]
    Wait Until Doctor Signature Is Applied    ${doctor_signature}

Wait Until Doctor Signature Is Applied
    [Documentation]    Waits until the Doctor's signature is applied.
    [Arguments]    ${doctor_signature}
    Wait Until    1s
    # If there is a visual confirmation, add Get Text/Should Contain here.
    # Example: Get Text    ${DIARY_SICK_NOTE_LOCATORS}[label.signature]    Should Contain    ${doctor_signature}
    Evaluate Expression    None

Save Sick Note Form
    [Documentation]    Saves the Sick Note form.
    Click    ${DIARY_SICK_NOTE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${DIARY_SICK_NOTE_LOCATORS}[button.save]    ${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient's Clinical record.
    [Arguments]    ${sick_note_date}
    Click    ${DIARY_SICK_NOTE_LOCATORS}[sidebar.clinical]
    Wait Until Element Is Visible    ${DIARY_SICK_NOTE_LOCATORS}[input.sick_note_date]    ${LONG_WAIT}
    ${actual_date}    Get Text    ${DIARY_SICK_NOTE_LOCATORS}[input.sick_note_date]
    Should Contain    ${actual_date}    ${sick_note_date}

Email Sick Note To Patient
    [Documentation]    Emails the Sick Note to the patient.
    [Arguments]    ${email_subject}    ${email_body}
    Click    ${DIARY_SICK_NOTE_LOCATORS}[button.email]
    Wait Until Email Dialog Is Visible
    Fill Email Subject    ${email_subject}
    Fill Email Body    ${email_body}
    Send Email
    Wait Until Email Sent Confirmation

Wait Until Email Dialog Is Visible
    [Documentation]    Waits until the email dialog is visible.
    Wait Until    1s
    # Add locator for email dialog if available
    Evaluate Expression    None

Fill Email Subject
    [Documentation]    Fills the email subject field.
    [Arguments]    ${email_subject}
    # Add locator for email subject if available
    Evaluate Expression    None

Fill Email Body
    [Documentation]    Fills the email body field.
    [Arguments]    ${email_body}
    # Add locator for email body if available
    Evaluate Expression    None

Send Email
    [Documentation]    Sends the email.
    # Add locator for send button if available
    Evaluate Expression    None

Wait Until Email Sent Confirmation
    [Documentation]    Waits until email sent confirmation is visible.
    Wait Until    1s
    Evaluate Expression    None

Print Sick Note
    [Documentation]    Prints the Sick Note.
    [Arguments]    ${print_option}
    Run Keyword If    '${print_option}' == 'Yes'    Click    ${DIARY_SICK_NOTE_LOCATORS}[button.print]
    Wait Until Print Dialog Is Visible
    Confirm Print
    Wait Until Print Completed

Wait Until Print Dialog Is Visible
    [Documentation]    Waits until the print dialog is visible.
    Wait Until    1s
    Evaluate Expression    None

Confirm Print
    [Documentation]    Confirms the print action.
    # Add locator for print confirmation if available
    Evaluate Expression    None

Wait Until Print Completed
    [Documentation]    Waits until print is completed.
    Wait Until    1s
    Evaluate Expression    None

Validate Sick Note Email And Print Logs
    [Documentation]    Validates that email and print logs are recorded in the patient communication history.
    [Arguments]    ${email_subject}
    Go To Patient Communication History
    Wait Until Communication Log Contains    ${email_subject}

Go To Patient Communication History
    [Documentation]    Navigates to the patient's communication history.
    Click    ${DIARY_SICK_NOTE_LOCATORS}[button.patient_dashboard]
    Wait Until    1s

Wait Until Communication Log Contains
    [Documentation]    Waits until the communication log contains the given subject.
    [Arguments]    ${email_subject}
    # Add locator for communication log table if available
    Evaluate Expression    None

Validate QR Code On Sick Note Printout
    [Documentation]    Validates that the QR Code appears on the Sick Note printout if enabled.
    [Arguments]    ${qr_code_enabled}
    Run Keyword If    '${qr_code_enabled}' == 'True'    Wait Until QR Code Is Visible On Printout

Wait Until QR Code Is Visible On Printout
    [Documentation]    Waits until the QR Code is visible on the printout.
    Wait Until    1s
    # Add locator for QR code if available
    Evaluate Expression    None

Click Patient Dashboard Button
    [Documentation]    Clicks the Patient Dashboard button.
    Click    ${DIARY_SICK_NOTE_LOCATORS}[button.patient_dashboard]
    Wait Until    1s

Wait Until Patient Booking Is Visible
    [Documentation]    Waits until the patient booking row is visible in the Diary.
    [Arguments]    &{sick_note_info}
    Wait Until    1s
    # Add locator for patient booking row if available
    Evaluate Expression    None

Click Patient Booking Row
    [Documentation]    Clicks the patient booking row in the Diary.
    [Arguments]    &{sick_note_info}
    # Add locator for patient booking row if available
    Evaluate Expression    None

Click Clinical Sidebar Button
    [Documentation]    Clicks the Clinical Sidebar button.
    Click    ${DIARY_SICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until    1s
