*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page, Booking page, and Quick Note flows.
Resource    ../common/super.resource
Resource    ../Testdata/quick_note_data.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...  Confirms dashboard access and ensures proper logout with alert handling.
    Validate Dashboard Is Displayed
    Click Logout
    Handle Attention Alert    ${DISMISS_ATTENTION_ALERT}

TC_02 Validate User Is Able To Create New Patient Booking
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    and perform a new patient booking.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking   ${BOOKING_INFO}    ${DEBTOR_INFO}
    Select Duplicate Debtor
    Save Booking Form
    Validate Booking Timeslot Is Created    ${BOOKING_INFO}[input.time]    ${EXPECTED_DATA}[cell_no]    ${EXPECTED_DATA}[debtor_name]

TC_03 Validate User Is Unable To Create New Patient Booking
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    ...and is unable to perform a new patient booking.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking   ${BOOKING_INFO}    ${DEBTOR_INFO}
    Select Duplicate Debtor
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]

TC_04 Validate User Is Unable To Create New Patient Booking Without Name
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    ... and is not able to perform a new patient booking without entering a name.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking   ${BOOKING_INFO}    ${DEBTOR_WITHOUT_NAME}
    Select Duplicate Debtor
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]

TC_05 Validate User Is Able To Create Booking For Existing patient
    [Documentation]    Verifies that the user can successfully log in, navigate to the Diary module,
    ...     and create a booking for an existing patient.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create Patient Booking With Existing Debtor   ${BOOKING_INFO}    ${EXISTING_DEBTOR_NAME}
    Validate Booking Timeslot Is Created For Existing Patient    ${BOOKING_INFO}[input.time]

TC_06 Validate User Is Unable To Create Booking For Existing patient When Form Is Closed
    [Documentation]    Verifies that the user can log in and attempt to create a booking with
    ...    valid details, but close the Add/Edit Booking screen before saving.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Enter Form Data    &{BOOKING_INFO}
    Search And Select Existing Patient    ${EXISTING_DEBTOR_NAME}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]

TC_07 Validate User Is Unable To Create Booking Without Debtor/patient Details
    [Documentation]    Verifies that the user can log in and attempt to create a booking
    ...    without providing mandatory debtor or patient details
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Enter Form Data    &{BOOKING_INFO}
    Validate Warning Alert Is Displayed    ${INVALID_FIELD_ERROR_MESSAGE}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]

TC00005_Diary_Add Quicknote - Adding a quicknote
    [Documentation]    Adding a quick note to a booking (TC00005_Diary_Add Quicknote)
    # Step 1: Select a booking from the diary screen [Sidebar to open with Clinical button]
    Open Diary And Select Booking For Quicknote
    # Step 2: Select Clinical button [Clinical screen to open]
    Click Clinical Button In Sidebar
    # Step 3: Click on Forms Library dropdown [List of Workflow events will be displayed]
    Click Forms Library Dropdown
    # Step 4: Select QUICK NOTE from Forms Library
    Select Quick Note From Forms Library    ${QUICK_NOTE_DATA.select_quick_note}
    # Step 5: Click Add button [Quick Note form will open]
    Click Add Quick Note Button
    # Step 6: Add text to the textbox
    Add Text To Quick Note Textbox    ${QUICK_NOTE_DATA.add_text_to_textbox}
    # Step 7: Click Save [Quick Note should be saved]
    Click Save Quick Note Button
    # Step 8: Validate Quick Note is saved and visible in the list
    Validate Quick Note Is Saved    ${QUICK_NOTE_DATA.add_text_to_textbox}
    # Step 9: Click on the saved Quick Note to open it
    Open Saved Quick Note    ${QUICK_NOTE_DATA.add_text_to_textbox}
    # Step 10: Validate that the Quick Note details are correct
    Validate Quick Note Details    ${QUICK_NOTE_DATA.add_text_to_textbox}
    # Step 11: Click Edit button [Quick Note form will open in edit mode]
    Click Edit Quick Note Button
    # Step 12: Update text in the textbox
    Update Text In Quick Note Textbox    Updated note after review.
    # Step 13: Click Print [Quick Note should be auto completed and a print out should render ...]
    Click Print Quick Note Button
    Validate Print Preview For Quick Note

# MISSING LOCATORS: If any step below is missing a locator, add here.
# MISSING TEST DATA: If any step below is missing test data, add here.

*** Keywords ***
Open Diary And Select Booking For Quicknote
    [Documentation]    Opens the Diary module and selects a booking for adding a quick note.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    # Assuming booking selection is required for quick note
    Select Timeslot    ${BOOKING_INFO}[input.time]

Click Clinical Button In Sidebar
    [Documentation]    Clicks the Clinical button in the sidebar to open the Clinical screen.
    # MISSING LOCATOR: Clinical button in sidebar
    # Replace with actual locator when available
    Click Element    clinical_button_sidebar

Click Forms Library Dropdown
    [Documentation]    Clicks the Forms Library dropdown to display workflow events.
    # MISSING LOCATOR: Forms Library dropdown
    # Replace with actual locator when available
    Click Element    forms_library_dropdown

Select Quick Note From Forms Library
    [Arguments]    ${quick_note_label}
    [Documentation]    Selects QUICK NOTE from the Forms Library dropdown.
    # MISSING LOCATOR: Forms Library select list
    # Replace with actual locator when available
    Select From List By Label    forms_library_dropdown    ${quick_note_label}

Click Add Quick Note Button
    [Documentation]    Clicks the Add button to open the Quick Note form.
    # MISSING LOCATOR: Add Quick Note button
    # Replace with actual locator when available
    Click Element    add_quick_note_button

Add Text To Quick Note Textbox
    [Arguments]    ${note_text}
    [Documentation]    Adds text to the Quick Note textbox.
    # MISSING LOCATOR: Quick Note textbox
    # Replace with actual locator when available
    Input Text    quick_note_textbox    ${note_text}

Click Save Quick Note Button
    [Documentation]    Clicks the Save button to save the Quick Note.
    # MISSING LOCATOR: Save Quick Note button
    # Replace with actual locator when available
    Click Element    save_quick_note_button

Validate Quick Note Is Saved
    [Arguments]    ${note_text}
    [Documentation]    Validates that the Quick Note is saved and visible in the list.
    # MISSING LOCATOR: Quick Note list or saved note
    # Replace with actual locator when available
    Element Should Contain    quick_note_list    ${note_text}

Open Saved Quick Note
    [Arguments]    ${note_text}
    [Documentation]    Opens the saved Quick Note from the list.
    # MISSING LOCATOR: Saved Quick Note entry
    # Replace with actual locator when available
    Click Element    saved_quick_note_entry

Validate Quick Note Details
    [Arguments]    ${note_text}
    [Documentation]    Validates that the Quick Note details are correct.
    # MISSING LOCATOR: Quick Note details view
    # Replace with actual locator when available
    Element Should Contain    quick_note_details_view    ${note_text}

Click Edit Quick Note Button
    [Documentation]    Clicks the Edit button to open the Quick Note in edit mode.
    # MISSING LOCATOR: Edit Quick Note button
    # Replace with actual locator when available
    Click Element    edit_quick_note_button

Update Text In Quick Note Textbox
    [Arguments]    ${updated_text}
    [Documentation]    Updates the text in the Quick Note textbox.
    # MISSING LOCATOR: Quick Note textbox (edit mode)
    # Replace with actual locator when available
    Input Text    quick_note_textbox    ${updated_text}

Click Print Quick Note Button
    [Documentation]    Clicks the Print button for the Quick Note.
    # MISSING LOCATOR: Print Quick Note button
    # Replace with actual locator when available
    Click Element    print_quick_note_button

Validate Print Preview For Quick Note
    [Documentation]    Validates that the print preview for the Quick Note is displayed.
    # MISSING LOCATOR: Print preview window or element
    # Replace with actual locator when available
    Page Should Contain Element    print_preview_window

# MISSING LOCATORS:
# - clinical_button_sidebar (Clinical button in sidebar)
# - forms_library_dropdown (Forms Library dropdown)
# - add_quick_note_button (Add Quick Note button)
# - quick_note_textbox (Quick Note textbox)
# - save_quick_note_button (Save Quick Note button)
# - quick_note_list (Quick Note list or saved note)
# - saved_quick_note_entry (Saved Quick Note entry)
# - quick_note_details_view (Quick Note details view)
# - edit_quick_note_button (Edit Quick Note button)
# - print_quick_note_button (Print Quick Note button)
# - print_preview_window (Print preview window or element)

# MISSING TEST DATA:
# - Updated note text for edit: hardcoded as 'Updated note after review.'
