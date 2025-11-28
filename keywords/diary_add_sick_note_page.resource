*** Settings ***
Documentation    This resource file contains all keywords for Diary - Add Sick Note functionality.
Resource    ../common/super.resource

*** Keywords ***
Open Patient Clinical Forms
    [Documentation]    Opens the Clinical Forms dialog for the selected patient from the Diary.
    [Arguments]    ${patient_name}
    Wait Until Element Is Visible    ${TABLE_GRID_LOCATORS}[table.diary]    ${LONG_WAIT}
    ${row_count}=    Get Element Count    ${TABLE_GRID_LOCATORS}[table.diary.row]
    FOR    ${index}    IN RANGE    1    ${row_count + 1}
        ${name_locator}=    Set Variable    ${TABLE_GRID_LOCATORS}[table.diary] + ' tbody tr:nth-child(${index}) td.name'
        ${name}=    Get Text    ${name_locator}
        Run Keyword If    '${name}' == '${patient_name}'    Click    ${TABLE_GRID_LOCATORS}[table.diary] + ' tbody tr:nth-child(${index}) td.name'
        Run Keyword If    '${name}' == '${patient_name}'    Exit For Loop
    END
    Wait Until Element Is Visible    ${dialog.sicknote}    ${LONG_WAIT}

Select Sick Note Form
    [Documentation]    Selects the Sick Note form from the Clinical Forms dialog.
    Click    ${dialog.sicknote}
    Wait Until Element Is Visible    ${SICK_NOTE_FORM_LOCATORS}[input.sicknote.date]    ${LONG_WAIT}

Populate Sick Note Details
    [Documentation]    Populates all required Sick Note form fields using patient, booking, and sick note details.
    [Arguments]    &{patient_info}    &{booking_info}    &{sick_note_details}
    Enter Patient Details Data    &{patient_info}
    Enter Booking Details Data    &{booking_info}
    Enter Sick Note Form Data    &{sick_note_details}

Enter Patient Details Data
    [Documentation]    Enters patient details into the Sick Note form using the PATIENT_DETAILS_LOCATORS dictionary.
    [Arguments]    &{patient_info}
    FOR    ${field}    ${value}    IN    &{patient_info}
        ${locator}    Get From Dictionary    ${PATIENT_DETAILS_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Enter Booking Details Data
    [Documentation]    Enters booking details into the Sick Note form using the SICK_NOTE_FORM_LOCATORS dictionary for booking-related fields.
    [Arguments]    &{booking_info}
    FOR    ${field}    ${value}    IN    &{booking_info}
        ${locator}    Get From Dictionary    ${SICK_NOTE_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Enter Sick Note Form Data
    [Documentation]    Enters sick note details into the Sick Note form using the SICK_NOTE_FORM_LOCATORS dictionary.
    [Arguments]    &{sick_note_details}
    FOR    ${field}    ${value}    IN    &{sick_note_details}
        ${locator}    Get From Dictionary    ${SICK_NOTE_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('textarea.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('checkbox.') and '${value}' == 'True'
        ...    Click    ${locator}
    END

Sign Sick Note
    [Documentation]    Signs the Sick Note by selecting the signature and entering the signature date.
    [Arguments]    ${signature}    ${signature_date}
    Fill Text    ${SICK_NOTE_FORM_LOCATORS}[input.sicknote.signature]    ${signature}
    Fill Text    ${SICK_NOTE_FORM_LOCATORS}[input.sicknote.date]    ${signature_date}
    Click    ${ACTION_BUTTON_LOCATORS}[button.sign]
    Wait Until Element Is Visible    ${DIALOG_LOCATORS}[dialog.confirmation]    ${LONG_WAIT}
    Click    ${DIALOG_LOCATORS}[button.dialog.ok]
    Wait Until Element Is Invisible    ${DIALOG_LOCATORS}[dialog.confirmation]    ${LONG_WAIT}

Save Sick Note Form
    [Documentation]    Saves the Sick Note form.
    Click    ${ACTION_BUTTON_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${dialog.sicknote}    ${LONG_WAIT}

Send Sick Note Via Email
    [Documentation]    Sends the Sick Note via email to the specified doctor email address.
    [Arguments]    ${doctor_email}
    Click    ${ACTION_BUTTON_LOCATORS}[button.email]
    Wait Until Element Is Visible    ${DIALOG_LOCATORS}[dialog.confirmation]    ${LONG_WAIT}
    Click    ${DIALOG_LOCATORS}[button.dialog.ok]
    Wait Until Element Is Invisible    ${DIALOG_LOCATORS}[dialog.confirmation]    ${LONG_WAIT}
    Wait Until Element Is Visible    ${WARNING_ALERT_LOCATORS}[alert.success]    ${LONG_WAIT}
    ${actual_text}    Get Text    ${WARNING_ALERT_LOCATORS}[alert.success]
    Should Contain    ${actual_text}    Email sent

Print Sick Note Copy
    [Documentation]    Prints a copy of the Sick Note.
    Click    ${ACTION_BUTTON_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${DIALOG_LOCATORS}[dialog.confirmation]    ${LONG_WAIT}
    Click    ${DIALOG_LOCATORS}[button.dialog.ok]
    Wait Until Element Is Invisible    ${DIALOG_LOCATORS}[dialog.confirmation]    ${LONG_WAIT}
    Wait Until Element Is Visible    ${WARNING_ALERT_LOCATORS}[alert.success]    ${LONG_WAIT}
    ${actual_text}    Get Text    ${WARNING_ALERT_LOCATORS}[alert.success]
    Should Contain    ${actual_text}    Print successful

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient’s Clinical record.
    [Arguments]    ${patient_name}
    # Assumes clinical record is visible after save
    Wait Until Element Is Visible    ${TABLE_GRID_LOCATORS}[table.diary]    ${LONG_WAIT}
    ${row_count}=    Get Element Count    ${TABLE_GRID_LOCATORS}[table.diary.row]
    ${found}=    Set Variable    False
    FOR    ${index}    IN RANGE    1    ${row_count + 1}
        ${name_locator}=    Set Variable    ${TABLE_GRID_LOCATORS}[table.diary] + ' tbody tr:nth-child(${index}) td.name'
        ${name}=    Get Text    ${name_locator}
        Run Keyword If    '${name}' == '${patient_name}'    Set Variable    ${found}    True
        Run Keyword If    '${name}' == '${patient_name}'    Exit For Loop
    END
    Should Be True    ${found}

Validate Email Log Recorded
    [Documentation]    Validates that the email log is recorded in the Patient communication history.
    [Arguments]    ${doctor_email}
    # Assumes log is displayed in a table or alert
    Wait Until Element Is Visible    ${WARNING_ALERT_LOCATORS}[alert.success]    ${LONG_WAIT}
    ${actual_text}    Get Text    ${WARNING_ALERT_LOCATORS}[alert.success]
    Should Contain    ${actual_text}    ${doctor_email}

Validate Print Log Recorded
    [Documentation]    Validates that the print log is recorded in the Patient communication history.
    Wait Until Element Is Visible    ${WARNING_ALERT_LOCATORS}[alert.success]    ${LONG_WAIT}
    ${actual_text}    Get Text    ${WARNING_ALERT_LOCATORS}[alert.success]
    Should Contain    ${actual_text}    Print

Validate QR Code Present On Printout
    [Documentation]    Validates that the QR Code is present on the Sick Note printout if enabled.
    Wait Until Element Is Visible    ${SICK_NOTE_FORM_LOCATORS}[input.sicknote.qrcode]    ${LONG_WAIT}
    ${qr_code_value}    Get Text    ${SICK_NOTE_FORM_LOCATORS}[input.sicknote.qrcode]
    Should Not Be Empty    ${qr_code_value}

Validate No Validation Errors
    [Documentation]    Validates that there are no validation errors present after Sick Note creation.
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${WARNING_ALERT_LOCATORS}[alert.validation]    2s
    ${is_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    ${WARNING_ALERT_LOCATORS}[alert.validation]    2s
    Should Be False    ${is_visible}
