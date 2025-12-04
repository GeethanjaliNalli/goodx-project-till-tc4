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
    [Documentation]    Create and verify a Sick Note (Medical Certificate) for a selected Patient. Preconditions: A valid Patient booking exists in the Diary. The Practitioner is logged into the system with permission to access Clinical Forms. The Patient has an existing Debtor file with complete personal details. The Doctor’s signature and Email settings are configured in the system.
    # Step 1: Navigate to Diary module
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    # Step 2: Select the Patient's booking timeslot
    Select Timeslot    ${BOOKING_INFO}[input.time]
    # Step 3: Open Clinical Sidebar for selected booking
    Open Clinical Sidebar
    # Step 4: Click on 'Forms Library' tab
    Click Forms Library Tab
    # Step 5: Search and select 'SICK NOTE' form from library
    Select Form From Library    ${SICK_NOTE_DATA.select.forms_library}
    # Step 6: Fill Sick Note form fields
    Fill Sick Note Form    &{SICK_NOTE_DATA}
    # Step 7: Save Sick Note form
    Save Clinical Form
    # Step 8: Enter Doctor PIN to confirm
    Enter Doctor Pin    ${SICK_NOTE_DATA.input.doctor_pin}
    # Step 9: Confirm Sick Note is saved in Patient’s Clinical record
    Validate Sick Note Saved In Clinical Record    ${SICK_NOTE_DATA.input.sick_note_date}
    # Step 10: Print Sick Note and verify QR code (if enabled)
    Print Sick Note
    Validate Sick Note Printout Contains QR Code
    # Step 11: Email Sick Note to Patient
    Email Sick Note To Patient
    # Step 12: Validate Email and Print logs in Patient communication history
    Validate Sick Note Communication Logs    ${SICK_NOTE_DATA.input.sick_note_date}

*** Keywords ***
Open Clinical Sidebar
    [Documentation]    Opens the Clinical sidebar for the selected booking.
    Click Element    clinical_sidebar_button

Click Forms Library Tab
    [Documentation]    Clicks on the Forms Library tab in the Clinical sidebar.
    Click Element    forms_library_tab

Select Form From Library
    [Arguments]    ${form_name}
    [Documentation]    Searches and selects the given form from the Forms Library.
    Input Text    forms_library_search_box    ${form_name}
    Click Element    //div[text()="${form_name}"]

Fill Sick Note Form
    [Arguments]    &{sick_note_data}
    [Documentation]    Fills all fields in the Sick Note form using provided test data.
    Input Text    sick_note_date_field    ${sick_note_data.input.sick_note_date}
    Input Text    unfit_from_field    ${sick_note_data.input.unfit_from}
    Input Text    unfit_to_field    ${sick_note_data.input.unfit_to}
    Input Text    light_duty_from_field    ${sick_note_data.input.light_duty_from}
    Input Text    light_duty_to_field    ${sick_note_data.input.light_duty_to}
    Input Text    extra_information_field    ${sick_note_data.input.extra_information}

Save Clinical Form
    [Documentation]    Saves the current clinical form.
    Click Element    save_clinical_form_button

Enter Doctor Pin
    [Arguments]    ${doctor_pin}
    [Documentation]    Enters the Doctor's PIN to confirm saving the form.
    Input Text    doctor_pin_field    ${doctor_pin}
    Click Element    confirm_pin_button

Validate Sick Note Saved In Clinical Record
    [Arguments]    ${sick_note_date}
    [Documentation]    Validates that the Sick Note is saved in the Patient’s Clinical record.
    Page Should Contain Element    //div[contains(text(), "Sick Note") and contains(text(), "${sick_note_date}")]

Print Sick Note
    [Documentation]    Initiates print for the Sick Note.
    Click Element    print_sick_note_button

Validate Sick Note Printout Contains QR Code
    [Documentation]    Validates that the QR code appears on the Sick Note printout (if enabled).
    # This would typically check for a QR code image or marker in the print preview
    Page Should Contain Element    qr_code_image

Email Sick Note To Patient
    [Documentation]    Sends the Sick Note to the patient via email.
    Click Element    email_sick_note_button
    # Optionally handle email dialog if present
    Click Element    send_email_button

Validate Sick Note Communication Logs
    [Arguments]    ${sick_note_date}
    [Documentation]    Validates that Email and Print logs are recorded in the Patient communication history for the Sick Note.
    Click Element    communication_history_tab
    Page Should Contain Element    //div[contains(text(), "Sick Note") and contains(text(), "${sick_note_date}") and (contains(text(), "Email") or contains(text(), "Print"))]
