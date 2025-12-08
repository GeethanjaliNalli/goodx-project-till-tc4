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
    [Documentation]    Create and verify a Sick Note (Medical Certificate) for a selected Patient.
    ...    Preconditions: A valid Patient booking exists in the Diary. Practitioner is logged in with Clinical Forms access. Patient has a complete Debtor file. Doctor signature and Email settings configured.
    ...    Expected Result: The system successfully creates, populates, signs, and sends/prints a Sick Note with accurate Patient details, medical data, and signature, without data loss or validation errors.
    ...    Post-conditions: Sick Note is saved in the Patient’s Clinical record. Email and Print logs are recorded in the Patient communication history. QR Code (if enabled) appears on printout for validation.
    # Step 1-2: Navigate to Diary module and select patient booking
    Open Diary And Select Patient Booking    ${SICK_NOTE_INFO}[input.patient_name]    ${SICK_NOTE_INFO}[input.date]    ${SICK_NOTE_INFO}[input.time]
    # Step 3-4: Open Clinical sidebar and select Sick Note form
    Open Clinical Sidebar And Select Sick Note Form    ${SICK_NOTE_INFO}[select.type]
    # Step 5-9: Fill Sick Note form with patient and doctor details
    Fill Sick Note Form    &{SICK_NOTE_INFO}
    # Step 10: Add text to Sick Note
    Add Sick Note Text    ${SICK_NOTE_INFO}[input.reason]
    # Step 11-12: Upload PDF to Sick Note (if required)
    # TODO: MISSING TESTDATA: PDF file for Sick Note upload
    # Step 13: Print Sick Note
    Print Sick Note    ${SICK_NOTE_INFO}[select.print]
    # Step 14: Send Sick Note via Email
    Send Sick Note Via Email    ${SICK_NOTE_INFO}[input.doctor_email]    ${SICK_NOTE_INFO}[select.send_email]
    # Step 15: Sign Sick Note
    Sign Sick Note    ${SICK_NOTE_INFO}[input.doctor_signature]    ${SICK_NOTE_INFO}[select.status]
    # Step 16: Validate Sick Note is saved in Patient Clinical record
    Validate Sick Note Saved In Clinical Record    ${SICK_NOTE_INFO}[input.patient_name]    ${SICK_NOTE_INFO}[input.date]
    # Step 17: Validate QR Code appears on printout if enabled
    Validate QR Code On Sick Note Printout    ${SICK_NOTE_INFO}[select.print_qr_code]
