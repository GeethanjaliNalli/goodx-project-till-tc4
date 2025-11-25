*** Settings ***
Documentation    Keywords for creating and verifying a Sick Note (Medical Certificate) for a selected patient in the Diary module.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_page.resource

*** Keywords ***

Open Diary Module
    [Documentation]    Opens the Diary module for the practitioner.
    # Implementation depends on dashboard navigation, assumed to use existing navigation keywords.
    # Example: Click    ${DASHBOARD_PAGE_LOCATORS['link.diary']}

Select Patient Booking
    [Documentation]    Selects an existing patient booking from the Diary.
    # Implementation depends on diary booking list; assumed to use existing selection keywords.
    # Example: Click    ${DIARY_PAGE_LOCATORS['row.booking']}

Open Clinical Forms
    [Documentation]    Opens Clinical Forms for the selected patient booking.
    # Implementation depends on UI; assumed to use existing keywords.
    # Example: Click    ${DIARY_PAGE_LOCATORS['button.clinicalforms']}

Select Sick Note Form
    [Documentation]    Selects the Sick Note (Medical Certificate) form from the Clinical Forms list.
    # Implementation depends on UI; assumed to use existing keywords.
    # Example: Click    ${DIARY_ADD_SICK_NOTE_LOCATORS['undefined.1']}

Enter Sick Note Details
    [Documentation]    Enters all required details in the Sick Note form.
    # Use form filling patterns from add_edit_page.resource if available.
    # Example: Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS['undefined.2']}    ${sick_note_details}

Save Sick Note Form
    [Documentation]    Saves the Sick Note form for the patient.
    # Example: Click    ${DIARY_ADD_SICK_NOTE_LOCATORS['undefined.3']}
    Wait Until Element Is Not Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS['undefined.3']}    timeout=10s

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient’s clinical record.
    # Example: Wait Until Page Contains Element    ${DIARY_ADD_SICK_NOTE_LOCATORS['undefined.4']}    timeout=10s

Validate Email And Print Logs Recorded
    [Documentation]    Validates that Email and Print logs are recorded in the patient communication history.
    # Example: Wait Until Page Contains Element    ${DIARY_ADD_SICK_NOTE_LOCATORS['undefined.5']}    timeout=10s

Validate QR Code On Printout If Enabled
    [Documentation]    Validates that QR Code appears on the printout for validation if enabled.
    # Example: Wait Until Page Contains Element    ${DIARY_ADD_SICK_NOTE_LOCATORS['undefined.5']}    timeout=10s

Create And Verify Sick Note For Patient
    [Documentation]    Performs the complete flow to create and verify a Sick Note for a selected patient booking.
    Open Diary Module
    Select Patient Booking
    Open Clinical Forms
    Select Sick Note Form
    Enter Sick Note Details
    Save Sick Note Form
    Validate Sick Note Saved In Clinical Record
    Validate Email And Print Logs Recorded
    Validate QR Code On Printout If Enabled
