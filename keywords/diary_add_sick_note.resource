*** Settings ***
Documentation    Keywords for creating, verifying, and managing Sick Notes (Medical Certificates) in the Diary module.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_page.resource

*** Keywords ***
Open Sick Note Form
    [Documentation]    Opens the Sick Note (Medical Certificate) form for the selected patient from the Diary.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.add_sick_note}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.label.sick_note}    timeout=5s

Enter Sick Note Details
    [Documentation]    Enters required medical and patient details into the Sick Note form.
    [Arguments]    &{sick_note_data}
    FOR    ${field}    ${value}    IN    &{sick_note_data}
        ${locator}=    Get From Dictionary    ${DIARY_ADD_SICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
    END

Sign Sick Note
    [Documentation]    Signs the Sick Note using the configured doctor's signature.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.complete}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.icon.verification_done}    timeout=5s

Send Sick Note By Email
    [Documentation]    Sends the Sick Note to the patient's email address and validates email log.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.email}
    Wait Until Element Is Visible    ${log.email_sent}    timeout=5s

Print Sick Note
    [Documentation]    Prints the Sick Note and checks for QR Code if enabled.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.print}
    Wait Until Element Is Visible    ${log.print_sent}    timeout=5s
    Run Keyword If    '${QR_CODE_ENABLED}' == 'True'    Validate QR Code Is Present

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient’s clinical record.
    Wait Until Element Is Visible    ${label.sick_note_saved}    timeout=5s

Validate Communication History Logs
    [Documentation]    Validates that Email and Print logs are recorded in the patient communication history.
    Wait Until Element Is Visible    ${log.email_sent}    timeout=5s
    Wait Until Element Is Visible    ${log.print_sent}    timeout=5s

Validate QR Code Is Present
    [Documentation]    Validates that a QR Code is present on the Sick Note printout if enabled.
    Wait Until Element Is Visible    ${label.qr_code}    timeout=3s
