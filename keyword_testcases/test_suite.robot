*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page, Booking page, and Diary - Add Sick note.
Resource    ../common/super.resource
Resource    ../Testdata/booking_data.resource
Resource    ../Testdata/constants.resource
Resource    ../Testdata/sick_note_data.resource
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

TC00006_Diary_Add Sick note
    [Documentation]    Create and verify a Sick Note (Medical Certificate) for a selected Patient.
    ...    Preconditions: A valid Patient booking exists in the Diary. The Practitioner is logged into the system with permission to access Clinical Forms. The Patient has an existing Debtor file with complete personal details. The Doctor’s signature and Email settings are configured in the system.
    ...    Expected Result: Sick Note is saved in the Patient’s Clinical record. Email and Print logs are recorded in the Patient communication history. QR Code (if enabled) appears on printout for validation.
    # Step 1: Navigate to Diary module
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    # Step 2: Select existing patient booking from Diary
    Select Patient Booking From Diary    ${BOOKING_INFO}[input.time]
    # Step 3: Open Clinical Sidebar for selected patient
    Open Clinical Sidebar
    # Step 4: Click on 'Forms Library' in Clinical Sidebar
    Open Forms Library In Clinical Sidebar
    # Step 5: Select 'Sick Note' from Forms Library dropdown
    Select Form From Library    ${SICK_NOTE_DATA.forms_library_dropdown}
    # Step 6: Fill in Sick Note form fields (dates, unfit, light duty, extra info)
    Fill Sick Note Form Fields    ${SICK_NOTE_DATA.in_the_dates_section_enter}    ${SICK_NOTE_DATA.tick_relevant_boxes_under_unfit}    ${SICK_NOTE_DATA.expand_light_duty_and_input}    ${SICK_NOTE_DATA.select_extra_information_option_e}
    # Step 7: Click on Doctor's signature button
    Click Doctor Signature Button    ${SICK_NOTE_DATA.click_doctor_signature_button}
    # Step 8: Enter correct PIN for signature
    Enter Doctor Signature Pin    ${SICK_NOTE_DATA.enter_pin_1234_correct_pin}
    # Step 9: Save Sick Note form
    Save Clinical Form
    # Step 10: Validate Sick Note is saved in Patient’s Clinical record
    Validate Sick Note Saved In Clinical Record
    # Step 11: Print Sick Note and verify QR code appears (if enabled)
    Print Sick Note
    Validate QR Code Appears On Printout
    # Step 12: Email Sick Note to patient
    Email Sick Note To Patient
    # Step 13: Validate Email and Print logs are recorded in Patient communication history
    Validate Sick Note Email And Print Logs In Communication History

*** Keywords ***
Select Patient Booking From Diary
    [Arguments]    ${booking_time}
    # Select the booking for the patient in the diary using the provided time
    # (Assumes booking_time is unique for the test context)
    Click Element    locator=diary_booking_time_${booking_time}

Open Clinical Sidebar
    # Opens the clinical sidebar for the selected patient
    Click Element    locator=clinical_sidebar_button

Open Forms Library In Clinical Sidebar
    # Opens the Forms Library section in the clinical sidebar
    Click Element    locator=forms_library_tab

Select Form From Library
    [Arguments]    ${form_name}
    # Selects the specified form from the Forms Library dropdown
    Select From List By Label    locator=forms_library_dropdown    ${form_name}

Fill Sick Note Form Fields
    [Arguments]    ${date}    ${unfit}    ${light_duty}    ${extra_info}
    # Fill in the Sick Note form fields
    Input Text    locator=sick_note_date_field    ${date}
    ${unfit}    Run Keyword If    '${unfit}' == 'Yes'    Click Element    locator=sick_note_unfit_checkbox
    ${light_duty}    Run Keyword If    '${light_duty}' != 'None'    Input Text    locator=sick_note_light_duty_field    ${light_duty}
    ${extra_info}    Run Keyword If    '${extra_info}' != 'None'    Select From List By Label    locator=sick_note_extra_info_dropdown    ${extra_info}

Click Doctor Signature Button
    [Arguments]    ${doctor_name}
    # Clicks the doctor's signature button
    Click Element    locator=doctor_signature_button
    # Optionally select doctor if multiple available
    ${doctor_name}    Run Keyword If    '${doctor_name}' != ''    Select From List By Label    locator=doctor_signature_doctor_list    ${doctor_name}

Enter Doctor Signature Pin
    [Arguments]    ${pin}
    # Enter the doctor's PIN for signature
    Input Text    locator=doctor_signature_pin_field    ${pin}
    Click Button    locator=doctor_signature_confirm_button

Save Clinical Form
    # Clicks the save button for the clinical form
    Click Button    locator=clinical_form_save_button

Validate Sick Note Saved In Clinical Record
    # Validates that the Sick Note is saved in the patient's clinical record
    Page Should Contain Element    locator=sick_note_in_clinical_record

Print Sick Note
    # Initiates print for the Sick Note
    Click Button    locator=print_sick_note_button
    Wait Until Page Contains Element    locator=print_preview_dialog

Validate QR Code Appears On Printout
    # Validates that the QR code appears on the printout (if enabled)
    Page Should Contain Element    locator=sick_note_qr_code

Email Sick Note To Patient
    # Emails the Sick Note to the patient
    Click Button    locator=email_sick_note_button
    Wait Until Page Contains Element    locator=email_sent_confirmation

Validate Sick Note Email And Print Logs In Communication History
    # Validates that Email and Print logs are recorded in Patient communication history
    Click Element    locator=communication_history_tab
    Page Should Contain Element    locator=sick_note_email_log
    Page Should Contain Element    locator=sick_note_print_log
