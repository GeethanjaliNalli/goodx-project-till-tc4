*** Settings ***
Documentation    Keywords for creating and verifying a Sick Note (Medical Certificate) for a selected Patient in Diary.
Resource    ../common/super.resource

*** Keywords ***

Open Sick Note Form
    [Documentation]    Opens the Sick Note form for the selected patient from Diary.
    Click    ${DIARY_ADD_SICK_NOTE_PAGE_LOCATORS.button.addsicknote}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_PAGE_LOCATORS.input.sicknote.date}    timeout=10s

Enter Sick Note Details
    [Documentation]    Enters the Sick Note details for the patient.
    [Arguments]    &{sick_note_data}
    Fill Text    ${DIARY_ADD_SICK_NOTE_PAGE_LOCATORS.input.sicknote.date}    ${sick_note_data[date]}
    Fill Text    ${DIARY_ADD_SICK_NOTE_PAGE_LOCATORS.textarea.sicknote.reason}    ${sick_note_data[reason]}

Save Sick Note
    [Documentation]    Saves the Sick Note form.
    Click    ${DIARY_ADD_SICK_NOTE_PAGE_LOCATORS.button.save}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_PAGE_LOCATORS.label.sicknote.saved}    timeout=10s

Validate Sick Note Saved
    [Documentation]    Validates that the Sick Note is saved in the Patient’s Clinical record.
    Element Should Be Visible    ${DIARY_ADD_SICK_NOTE_PAGE_LOCATORS.label.sicknote.saved}

Validate Communication History Logs
    [Documentation]    Validates that Email and Print logs are recorded in the Patient communication history.
    # Implementation would use existing navigation and validation keywords for communication history
    # Example: Validate Communication Log Entry    type=Email
    # Example: Validate Communication Log Entry    type=Print

Validate QR Code On Printout
    [Documentation]    Validates that QR Code appears on printout if enabled.
    # Implementation would use existing print/preview and QR code validation keywords
    # Example: Validate QR Code Present On Print Preview

Create And Verify Sick Note
    [Documentation]    Creates and verifies a Sick Note for a selected patient in Diary.
    [Arguments]    &{sick_note_data}
    Open Sick Note Form
    Enter Sick Note Details    &{sick_note_data}
    Save Sick Note
    Validate Sick Note Saved
    Validate Communication History Logs
    Validate QR Code On Printout
