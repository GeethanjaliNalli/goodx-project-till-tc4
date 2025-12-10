*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
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

TC00006_Diary_Add Sick note - Diary - Add Sick note
    [Documentation]    Create and verify a Sick Note (Medical Certificate) for a selected Patient. Sick Note is saved in the Patient’s Clinical record. Email and Print logs are recorded in the Patient communication history. QR Code (if enabled) appears on printout for validation.
    # Step 1-2: Open Diary module and select an existing patient booking
    Open Diary And Select Existing Patient Booking    ${SICK_NOTE_DATA}
    # Step 3-4: Open Clinical Sidebar for the selected patient
    Open Clinical Sidebar For Selected Patient
    # Step 5-6: Select 'Forms Library' and choose 'SICK NOTE' form
    Select Forms Library And Choose Sick Note Form    ${SICK_NOTE_DATA}[select.form_type]
    # Step 7-9: Fill Sick Note details (date, unfit for work, reason)
    Fill Sick Note Details    ${SICK_NOTE_DATA}[input.sick_note_date]    ${SICK_NOTE_DATA}[input.unfit_for_work]    ${SICK_NOTE_DATA}[reason]
    # Step 10: Add Doctor’s signature
    Add Doctor Signature To Sick Note    ${SICK_NOTE_DATA}[doctor_signature]
    # Step 11: Save Sick Note
    Save Sick Note Form
    # Step 12: Email Sick Note to patient
    Email Sick Note To Patient    ${SICK_NOTE_DATA}[email_to]
    # Step 13: Print Sick Note
    Print Sick Note    ${SICK_NOTE_DATA}[print_option]
    # Step 14: Verify QR Code is present on printout if enabled
    Verify QR Code On Sick Note Printout    ${SICK_NOTE_DATA}[qr_code_enabled]
    # Step 15: Verify Sick Note saved in Patient’s Clinical record
    Verify Sick Note Saved In Clinical Record
    # Step 16: Verify Email log in Patient communication history
    Verify Sick Note Email Log In Communication History    ${SICK_NOTE_DATA}[email_to]
    # Step 17: Verify Print log in Patient communication history
    Verify Sick Note Print Log In Communication History
