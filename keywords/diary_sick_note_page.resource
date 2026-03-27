*** Settings ***
Documentation    This resource file contains all keywords for Diary - Add Sick Note functionality, including creation, population, signing, printing, emailing, and validation of Sick Notes in the Diary module.
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Select Patient Booking
    [Documentation]    Navigates to the Diary module, selects the specified date and time, and opens the booking for the given patient.
    [Arguments]    ${patient_name}    ${date}    ${time}
    Select Menu In Navigation Wheel    ${SICK_NOTE_INFO}[select.module]
    Select Appointment Date    ${date}
    Select Timeslot    ${time}
    Search And Select Patient Booking In Diary    ${patient_name}    ${date}    ${time}

Search And Select Patient Booking In Diary
    [Documentation]    Searches for and selects the patient booking in the Diary for the given date and time.
    [Arguments]    ${patient_name}    ${date}    ${time}
    ${booking_locator}    Get Booking Row Locator    ${patient_name}    ${date}    ${time}
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until Element Is Visible    ${form.clinical.sidebar}    ${LONG_WAIT}

Get Booking Row Locator
    [Documentation]    Returns the locator for the booking row in the Diary grid for the specified patient, date, and time.
    [Arguments]    ${patient_name}    ${date}    ${time}
    ${locator}    Set Variable    ${diary_booking_row}[${patient_name}][${date}][${time}]
    [Return]    ${locator}

Open Clinical Sidebar And Select Sick Note Form
    [Documentation]    Opens the Clinical sidebar and selects the Sick Note form for the patient.
    [Arguments]    ${form_type}
    Click    ${button.clinical.sidebar}
    Wait Until Element Is Visible    ${sidebar.clinical.forms}    ${LONG_WAIT}
    Select Clinical Form By Type    ${form_type}

Select Clinical Form By Type
    [Documentation]    Selects the clinical form in the sidebar by the given form type (e.g., Sick Note).
    [Arguments]    ${form_type}
    ${form_locator}    Get From Dictionary    ${CLINICAL_FORM_LOCATORS}    ${form_type}
    Click    ${form_locator}
    Wait Until Element Is Visible    ${form.sicknote}    ${LONG_WAIT}

Fill Sick Note Form
    [Documentation]    Fills the Sick Note form fields using the provided dictionary data.
    [Arguments]    &{form_data}
    Enter Sick Note Form Data    &{form_data}
    Wait Until Element Is Visible    ${button.sicknote.save}    ${LONG_WAIT}

Enter Sick Note Form Data
    [Documentation]    Enters data into the Sick Note form fields based on the values provided in the dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${SICK_NOTE_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Add Sick Note Text
    [Documentation]    Adds the specified reason or text to the Sick Note form.
    [Arguments]    ${reason}
    Fill Text    ${input.sicknote.reason}    ${reason}

Print Sick Note
    [Documentation]    Prints the Sick Note if print is enabled.
    [Arguments]    ${print_option}
    Run Keyword If    '${print_option}' == 'Yes'    Click Print Sick Note Button
    Wait Until Element Is Visible    ${dialog.print.preview}    ${LONG_WAIT}
    Click    ${button.print.confirm}
    Wait Until Element Is Invisible    ${dialog.print.preview}    ${LONG_WAIT}

Click Print Sick Note Button
    [Documentation]    Clicks the Print button on the Sick Note form.
    Click    ${button.sicknote.print}

Send Sick Note Via Email
    [Documentation]    Sends the Sick Note via email to the specified doctor email if enabled.
    [Arguments]    ${doctor_email}    ${send_email_option}
    Run Keyword If    '${send_email_option}' == 'Yes'    Click Send Sick Note Email Button
    Wait Until Element Is Visible    ${dialog.email.popup}    ${LONG_WAIT}
    Fill Text    ${input.sicknote.doctor_email}    ${doctor_email}
    Click    ${button.email.send}
    Wait Until Element Is Invisible    ${dialog.email.popup}    ${LONG_WAIT}

Click Send Sick Note Email Button
    [Documentation]    Clicks the Send Email button on the Sick Note form.
    Click    ${button.sicknote.email}

Sign Sick Note
    [Documentation]    Signs the Sick Note with the provided doctor signature and sets the status.
    [Arguments]    ${doctor_signature}    ${status}
    Fill Text    ${input.sicknote.signature}    ${doctor_signature}
    Select Options By    ${select.sicknote.status}    label    ${status}
    Click    ${button.sicknote.save}
    Wait Until Element Is Invisible    ${form.sicknote}    ${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient's Clinical record for the given patient and date.
    [Arguments]    ${patient_name}    ${date}
    Go To Clinical Record Tab
    ${record_locator}    Get Clinical Record Row Locator    ${patient_name}    ${date}
    Wait Until Element Is Visible    ${record_locator}    ${LONG_WAIT}
    ${record_text}    Get Text    ${record_locator}
    Should Contain    ${record_text}    ${patient_name}
    Should Contain    ${record_text}    ${date}
    Should Contain    ${record_text}    Sick Note

Go To Clinical Record Tab
    [Documentation]    Navigates to the Clinical Record tab for the patient.
    Click    ${tab.clinical.record}
    Wait Until Element Is Visible    ${table.clinical.records}    ${LONG_WAIT}

Get Clinical Record Row Locator
    [Documentation]    Returns the locator for the clinical record row for the specified patient and date.
    [Arguments]    ${patient_name}    ${date}
    ${locator}    Set Variable    ${clinical_record_row}[${patient_name}][${date}]
    [Return]    ${locator}

Validate QR Code On Sick Note Printout
    [Documentation]    Validates that the QR Code appears on the Sick Note printout if enabled.
    [Arguments]    ${print_qr_code_option}
    Run Keyword If    '${print_qr_code_option}' == 'Yes'    Validate QR Code Is Visible On Printout

Validate QR Code Is Visible On Printout
    [Documentation]    Validates that the QR Code is visible on the Sick Note print preview or printout.
    Wait Until Element Is Visible    ${img.sicknote.qrcode}    ${LONG_WAIT}

# Atomic low-level keywords for Sick Note form fields (for completeness)
Fill Text
    [Arguments]    ${locator}    ${value}
    Fill Text    ${locator}    ${value}

Select Options By
    [Arguments]    ${locator}    ${select_by}    ${value}
    Select Options By    ${locator}    ${select_by}    ${value}

Click
    [Arguments]    ${locator}
    Click    ${locator}

Wait Until Element Is Visible
    [Arguments]    ${locator}    ${timeout}
    Wait Until Element Is Visible    ${locator}    ${timeout}

Wait Until Element Is Invisible
    [Arguments]    ${locator}    ${timeout}
    Wait Until Element Is Invisible    ${locator}    ${timeout}

Get Text
    [Arguments]    ${locator}
    ${text}    Get Text    ${locator}
    [Return]    ${text}

Should Contain
    [Arguments]    ${actual}    ${expected}
    Should Contain    ${actual}    ${expected}
