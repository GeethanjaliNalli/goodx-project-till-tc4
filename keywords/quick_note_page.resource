*** Settings ***
Documentation    This resource file contains all keywords related to adding and validating Quick Notes in the Diary module (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Select Booking For Quicknote
    [Documentation]    Opens the Diary module and selects a booking for adding a quick note.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[clinical_button_sidebar]    ${LONG_WAIT}

Click Clinical Button In Sidebar
    [Documentation]    Clicks the Clinical button in the sidebar to open the Clinical screen.
    Click    ${QUICK_NOTE_LOCATORS}[clinical_button_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[forms_library_dropdown]    ${LONG_WAIT}

Click Forms Library Dropdown
    [Documentation]    Clicks the Forms Library dropdown to display workflow events.
    Click    ${QUICK_NOTE_LOCATORS}[forms_library_dropdown]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[forms_library_list]    ${SHORT_WAIT}

Select Quick Note From Forms Library
    [Arguments]    ${quick_note_label}
    [Documentation]    Selects QUICK NOTE from the Forms Library dropdown.
    Select Options By    ${QUICK_NOTE_LOCATORS}[forms_library_list]    label    ${quick_note_label}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[add_quick_note_button]    ${SHORT_WAIT}

Click Add Quick Note Button
    [Documentation]    Clicks the Add button to open the Quick Note form.
    Click    ${QUICK_NOTE_LOCATORS}[add_quick_note_button]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[quick_note_textbox]    ${SHORT_WAIT}

Add Text To Quick Note Textbox
    [Arguments]    ${note_text}
    [Documentation]    Adds text to the Quick Note textbox.
    Fill Text    ${QUICK_NOTE_LOCATORS}[quick_note_textbox]    ${note_text}

Click Save Quick Note Button
    [Documentation]    Clicks the Save button to save the Quick Note.
    Click    ${QUICK_NOTE_LOCATORS}[save_quick_note_button]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[quick_note_textbox]    ${SHORT_WAIT}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[quick_note_list]    ${SHORT_WAIT}

Validate Quick Note Is Saved
    [Arguments]    ${note_text}
    [Documentation]    Validates that the Quick Note is saved and visible in the list.
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[quick_note_list]    ${SHORT_WAIT}
    ${actual_text}    Get Text    ${QUICK_NOTE_LOCATORS}[quick_note_list_entry]
    Should Contain    ${actual_text}    ${note_text}

Open Saved Quick Note
    [Arguments]    ${note_text}
    [Documentation]    Opens the saved Quick Note from the list.
    Click    ${QUICK_NOTE_LOCATORS}[quick_note_list_entry]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[quick_note_details_view]    ${SHORT_WAIT}

Validate Quick Note Details
    [Arguments]    ${note_text}
    [Documentation]    Validates that the Quick Note details are correct.
    ${details_text}    Get Text    ${QUICK_NOTE_LOCATORS}[quick_note_details_view]
    Should Contain    ${details_text}    ${note_text}

Click Edit Quick Note Button
    [Documentation]    Clicks the Edit button to open the Quick Note in edit mode.
    Click    ${QUICK_NOTE_LOCATORS}[edit_quick_note_button]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[quick_note_textbox]    ${SHORT_WAIT}

Update Text In Quick Note Textbox
    [Arguments]    ${updated_text}
    [Documentation]    Updates the text in the Quick Note textbox.
    Fill Text    ${QUICK_NOTE_LOCATORS}[quick_note_textbox]    ${updated_text}

Click Print Quick Note Button
    [Documentation]    Clicks the Print button for the Quick Note.
    Click    ${QUICK_NOTE_LOCATORS}[print_quick_note_button]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[print_preview_window]    ${SHORT_WAIT}

Validate Print Preview For Quick Note
    [Documentation]    Validates that the print preview for the Quick Note is displayed.
    Page Should Contain Element    ${QUICK_NOTE_LOCATORS}[print_preview_window]
