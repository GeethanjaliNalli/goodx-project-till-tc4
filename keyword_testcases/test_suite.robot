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
    [Documentation]    Create and verify a Sick Note (Medical Certificate) for a selected Patient
    ...    Preconditions: A valid Patient booking exists in the Diary. The Practitioner is logged into the system with permission to access Clinical Forms. The Patient has an existing Debtor file with complete personal details. The Doctor’s signature and Email settings are configured in the system.
    ...    Expected Result: The system successfully creates, populates, signs, and sends/prints a Sick Note with accurate Patient details, medical data, and signature, without data loss or validation errors. Sick Note is saved in the Patient’s Clinical record. Email and Print logs are recorded in the Patient communication history. QR Code (if enabled) appears on printout for validation.
    # Step 1-2: Open Diary module and select the patient booking
    Open Diary And Select Patient Booking    ${SICK_NOTE_INFO}[patient.fullname]
    # Step 3-4: Open Clinical sidebar and select Forms Library
    Open Clinical Sidebar And Select Forms Library
    # Step 5-6: Search and select Sick Note (Medical Certificate) form
    Search And Select Sick Note Form    ${SICK_NOTE_INFO}[select.type]
    # Step 7-9: Fill in Sick Note form details (date, reason, duration)
    Fill Sick Note Form Details    ${SICK_NOTE_INFO}[input.date]    ${SICK_NOTE_INFO}[input.reason]    ${SICK_NOTE_INFO}[input.duration]
    # Step 10: Add Doctor's signature
    Add Doctor Signature To Sick Note    ${SICK_NOTE_INFO}[doctor.signature]
    # Step 11: Add Doctor's email
    Add Doctor Email To Sick Note    ${SICK_NOTE_INFO}[doctor.email]
    # Step 12-13: Validate patient details are pre-populated
    Validate Sick Note Patient Details    ${SICK_NOTE_INFO}[patient.fullname]    ${SICK_NOTE_INFO}[patient.id]    ${SICK_NOTE_INFO}[patient.gender]    ${SICK_NOTE_INFO}[patient.cellphone]
    # Step 14: Save Sick Note
    Save Sick Note Form
    # Step 15: Print Sick Note with QR Code and signature if enabled
    Print Sick Note    ${SICK_NOTE_INFO}[print.qr_code_enabled]    ${SICK_NOTE_INFO}[print.include_signature]
    # Step 16: Email Sick Note to patient
    Email Sick Note To Patient    ${SICK_NOTE_INFO}[email.send_to]    ${SICK_NOTE_INFO}[email.subject]    ${SICK_NOTE_INFO}[email.body]
    # Step 17: Validate Sick Note is saved in Clinical record and communication logs
    Validate Sick Note Saved In Clinical Record And Communication Log    ${SICK_NOTE_INFO}[patient.fullname]    ${SICK_NOTE_INFO}[email.send_to]
