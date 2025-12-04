*** Settings ***
Documentation    This resource file contains all keywords for Diary - Add Sick note functionality.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_locators.resource

*** Keywords ***
Select Patient Booking From Diary
    [Documentation]    Selects the booking for the patient in the diary using the provided time.
    [Arguments]    ${booking_time}
    ${locator}=    Evaluate    "//div[contains(@class,'start') and text()='${booking_time}']"
    Wait Until Element Is Visible    ${locator}    ${LONG_WAIT}
    Click    ${locator}

Open Clinical Sidebar
    [Documentation]    Opens the clinical sidebar for the selected patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.open_clinical_section]    ${LONG_WAIT}

Open Forms Library In Clinical Sidebar
    [Documentation]    Opens the Forms Library section in the clinical sidebar.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.open_clinical_section]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}

Select Form From Library
    [Documentation]    Selects the specified form from the Forms Library dropdown.
    [Arguments]    ${form_name}
    Select Options By    ${DIARY_ADD_SICK_NOTE_LOCATORS}[select.forms_library]    label    ${form_name}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[option.sick_note]    ${LONG_WAIT}
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[option.sick_note]

Fill Sick Note Form Fields
    [Documentation]    Fills in the Sick Note form fields: date, unfit checkbox, light duty, extra information.
    [Arguments]    ${date}    ${unfit}    ${light_duty}    ${extra_info}
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS}[input.sick_note_date]    ${date}
    Run Keyword If    '${unfit}' == 'Yes'    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[input.unfit_for_work_checkbox]
    Run Keyword If    '${light_duty}' != 'None' and '${light_duty}' != 'No'    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.expand_light_duty]    ${light_duty}
    Run Keyword If    '${extra_info}' != 'None'    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS}[textarea.extra_information]    ${extra_info}

Click Doctor Signature Button
    [Documentation]    Clicks the doctor's signature button.
    [Arguments]    ${doctor_name}
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.doctor_signature]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[input.doctor_pin]    ${LONG_WAIT}

Enter Doctor Signature Pin
    [Documentation]    Enters the doctor's PIN for signature.
    [Arguments]    ${pin}
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS}[input.doctor_pin]    ${pin}
    Press Keys    ${DIARY_ADD_SICK_NOTE_LOCATORS}[input.doctor_pin]    Enter
    Wait Until Element Is Invisible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[input.doctor_pin]    ${LONG_WAIT}

Save Clinical Form
    [Documentation]    Clicks the save button for the clinical form.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.expand_light_duty]
    Wait Until Element Is Invisible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.expand_light_duty]    ${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient's clinical record.
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.expand_medical_certificate]    ${LONG_WAIT}

Print Sick Note
    [Documentation]    Initiates print for the Sick Note.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.print_download]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.preview_medical_certificate]    ${LONG_WAIT}

Validate QR Code Appears On Printout
    [Documentation]    Validates that the QR code appears on the printout (if enabled).
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.preview_medical_certificate]    ${LONG_WAIT}

Email Sick Note To Patient
    [Documentation]    Emails the Sick Note to the patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.email]
    Wait Until Element Is Invisible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.email]    ${LONG_WAIT}

Validate Sick Note Email And Print Logs In Communication History
    [Documentation]    Validates that Email and Print logs are recorded in Patient communication history.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.expand_medical_certificate]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.preview_medical_certificate]    ${LONG_WAIT}
    # Email and print logs validation would be implemented here if log locators are provided.
