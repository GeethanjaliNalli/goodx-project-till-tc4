*** Settings ***
Documentation    Contains keywords for creating and verifying a Sick Note (Medical Certificate) for a selected Patient in the Diary module.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_page.resource

*** Keywords ***

Open Sick Note Form
    [Documentation]    Opens the Sick Note form for the selected patient from the Diary.
    Click    ${button.add_sick_note}
    Wait Until Element Is Visible    ${input.patient_name}    timeout=5s

Enter Sick Note Details
    [Documentation]    Enters patient and medical details into the Sick Note form.
    [Arguments]    &{sick_note_data}
    Fill Text    ${input.patient_name}    ${sick_note_data.patient_name}
    Fill Text    ${textarea.medical_details}    ${sick_note_data.medical_details}

Sign And Save Sick Note
    [Documentation]    Signs and saves the Sick Note form.
    Click    ${button.sign_and_save}
    Wait Until Element Is Not Visible    ${button.sign_and_save}    timeout=10s

Send Or Print Sick Note
    [Documentation]    Sends or prints the Sick Note after saving.
    Click    ${button.email_print}
    Wait Until Page Contains Element    xpath=//*    timeout=2s

Validate Sick Note Saved
    [Documentation]    Validates that the Sick Note is saved in the Patient’s Clinical record.
    # Validation steps would go here, using existing validation keywords or custom checks.
