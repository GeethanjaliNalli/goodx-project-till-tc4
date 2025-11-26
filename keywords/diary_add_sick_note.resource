*** Settings ***
Documentation    Keywords for creating, verifying, and managing Sick Notes (Medical Certificates) in the Diary module.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_page.resource

*** Keywords ***
Open Sick Note Form
    [Documentation]    Opens the Sick Note (Medical Certificate) form for the selected patient from the Diary.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.add_sick_note}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sick_note_details}    timeout=5s

Enter Sick Note Details
    [Documentation]    Enters required medical and patient details into the Sick Note form.
    [Arguments]    &{sick_note_data}
    FOR    ${field}    ${value}    IN    &{sick_note_data}
        ${locator}=    Get From Dictionary    ${DIARY_ADD_SICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Fill Text    ${locator}    ${value}
    END

Sign Sick Note
    [Documentation]    Signs the Sick Note using the configured doctor's signature.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.sign_sick_note}
    Wait Until Page Contains Element    Signed    timeout=3s

Send Sick Note By Email
    [Documentation]    Sends the Sick Note to the patient's email address.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.send_email}
    Wait Until Page Contains Element    Email sent successfully    timeout=5s

Print Sick Note
    [Documentation]    Prints the Sick Note and checks for QR Code if enabled.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.print_sick_note}
    Wait Until Page Contains Element    Print preview    timeout=5s
    Run Keyword If    '${QR_CODE_ENABLED}' == 'True'    Validate QR Code Is Present

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient’s clinical record.
    Go To Clinical Records
    Wait Until Page Contains Element    Sick Note    timeout=5s

Validate Communication History Logs
    [Documentation]    Validates that Email and Print logs are recorded in the patient communication history.
    Go To Communication History
    Wait Until Page Contains Element    Email    timeout=3s
    Wait Until Page Contains Element    Print    timeout=3s

Validate QR Code Is Present
    [Documentation]    Validates that a QR Code is present on the Sick Note printout if enabled.
    Wait Until Page Contains Element    QR Code    timeout=3s
