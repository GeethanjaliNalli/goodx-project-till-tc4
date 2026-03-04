*** Settings ***
Documentation    Keywords for creating and verifying a Sick Note (Medical Certificate) for a selected Patient in the Diary module
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note.resource

*** Keywords ***

Open Clinical Forms
    [Documentation]    Opens the Clinical Forms section for the selected patient
    Click    ${SICK_NOTE_LOCATORS.button.open_clinical_forms}
    Wait Until Element Is Visible    ${SICK_NOTE_LOCATORS.input.sick_note_reason}    timeout=5s

Enter Sick Note Details
    [Documentation]    Enters the sick note reason and other required details
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${SICK_NOTE_LOCATORS.${field}}    ${value}
    END

Sign Sick Note
    [Documentation]    Signs the sick note using the configured doctor's signature
    Click    ${SICK_NOTE_LOCATORS.button.sign_sick_note}
    Wait Until Element Is Visible    ${SICK_NOTE_LOCATORS.button.send_email}    timeout=5s

Send Sick Note Via Email
    [Documentation]    Sends the signed sick note to the patient's email address
    Click    ${SICK_NOTE_LOCATORS.button.send_email}
    Wait Until Element Is Invisible    ${SICK_NOTE_LOCATORS.button.send_email}    timeout=10s

Print Sick Note
    [Documentation]    Prints the signed sick note and verifies QR code if enabled
    Click    ${SICK_NOTE_LOCATORS.button.print_sick_note}
    Sleep    2s

Create And Verify Sick Note
    [Documentation]    Complete workflow to create, sign, send, and print a Sick Note for a patient
    [Arguments]    &{patient_info}    &{debtor_info}    &{sick_note_form_data}
    Open Clinical Forms
    Enter Sick Note Details    &{sick_note_form_data}
    Sign Sick Note
    Send Sick Note Via Email
    Print Sick Note
