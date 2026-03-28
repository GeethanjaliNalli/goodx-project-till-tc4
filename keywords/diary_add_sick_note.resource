*** Settings ***
Documentation    Keywords for creating and verifying a Sick Note (Medical Certificate) for a selected Patient in the Diary module
Resource    ../common/super.resource

*** Keywords ***

Open Patient Diary Entry
    [Documentation]    Opens the Diary entry for the selected patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.open_diary]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[input.patient_search]    timeout=5s

Select Patient For Sick Note
    [Documentation]    Selects the patient for whom the Sick Note will be created.
    [Arguments]    ${patient_name}
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS}[input.patient_search]    ${patient_name}
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.select_patient]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.add_sick_note]    timeout=5s

Click Add Sick Note
    [Documentation]    Clicks the button to add a new Sick Note for the patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.add_sick_note]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[input.sick_note_reason]    timeout=5s

Enter Sick Note Details
    [Documentation]    Enters all required details for the Sick Note form.
    [Arguments]    &{sick_note_data}
    FOR    ${field}    ${value}    IN    &{sick_note_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        ${locator}=    Get From Dictionary    ${DIARY_ADD_SICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${field}'.startswith('select.')    Select From Dropdown    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('checkbox.')    Set Checkbox    ${locator}    ${value}
    END

Sign Sick Note
    [Documentation]    Signs the Sick Note using the configured doctor's signature.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.sign]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[icon.signature_applied]    timeout=5s

Send Or Print Sick Note
    [Documentation]    Sends or prints the Sick Note as per system configuration.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.send_or_print]
    Wait Until Element Is Invisible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[modal.sending]    timeout=10s

Verify Sick Note Saved In Clinical Record
    [Documentation]    Verifies that the Sick Note is saved in the patient's clinical record.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[tab.clinical_record]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[row.sick_note_entry]    timeout=5s

Verify Email And Print Logs
    [Documentation]    Verifies that email and print logs are recorded in the patient communication history.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[tab.communication_history]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[row.sick_note_email_log]    timeout=5s
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[row.sick_note_print_log]    timeout=5s

Verify QR Code On Printout
    [Documentation]    Verifies that the QR code appears on the Sick Note printout if enabled.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.print_preview]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[img.qr_code]    timeout=5s

Create And Verify Sick Note Workflow
    [Documentation]    Complete workflow to create, sign, send/print and verify a Sick Note for a patient.
    [Arguments]    ${patient_name}    &{sick_note_data}
    Open Patient Diary Entry
    Select Patient For Sick Note    ${patient_name}
    Click Add Sick Note
    Enter Sick Note Details    &{sick_note_data}
    Sign Sick Note
    Send Or Print Sick Note
    Verify Sick Note Saved In Clinical Record
    Verify Email And Print Logs
    Verify QR Code On Printout
