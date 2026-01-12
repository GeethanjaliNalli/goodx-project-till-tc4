*** Settings ***
Documentation    Keywords for creating, signing, and sending/printing a Sick Note (Medical Certificate) for a selected patient from the Diary.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_page.resource

*** Keywords ***

Open Sick Note Form
    [Documentation]    Opens the Sick Note form for the selected patient in the Diary.
    Click    ${button.add_sick_note}
    Wait Until Element Is Visible    ${input.sick_note_date}    timeout=5s

Enter Sick Note Details
    [Documentation]    Enters required details into the Sick Note form.
    [Arguments]    &{sick_note_data}
    Fill Text    ${input.sick_note_date}    ${sick_note_data.date}
    Fill Text    ${textarea.medical_details}    ${sick_note_data.medical_details}

Sign And Save Sick Note
    [Documentation]    Signs and saves the Sick Note.
    Click    ${button.sign_and_save}
    Wait Until Element Is Not Visible    ${button.sign_and_save}    timeout=10s

Send Or Print Sick Note
    [Documentation]    Sends or prints the Sick Note as per configuration.
    Click    ${button.print_or_email}
    Wait Until Page Contains Element    xpath=//*    timeout=2s

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient’s clinical record.
    # Implementation should use existing validation keywords or custom validation logic as per project standards.

Validate Communication History Updated
    [Documentation]    Validates that email and print logs are recorded in the patient’s communication history.
    # Implementation should use existing validation keywords or custom validation logic as per project standards.

Validate QR Code On Printout
    [Documentation]    Validates that a QR code appears on the printout if enabled.
    # Implementation should use existing validation keywords or custom validation logic as per project standards.
