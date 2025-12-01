*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page, Booking page, and Diary - Add Sick note functionality.
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

TC_08 Diary - Add Sick note
    [Documentation]    Verifies that a practitioner can create, populate, sign, and send/print a Sick Note (Medical Certificate) for a selected patient with accurate details and no validation errors.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Booking For Patient    ${SICK_NOTE_BOOKING_INFO}[booking.date]    ${SICK_NOTE_BOOKING_INFO}[booking.time]    ${SICK_NOTE_PATIENT_INFO}[patient.first_name]    ${SICK_NOTE_PATIENT_INFO}[patient.surname]
    Open Clinical Forms Tab For Booking
    Click Add Sick Note Button
    Populate Sick Note Patient Details    &{SICK_NOTE_PATIENT_INFO}
    Populate Sick Note Booking Details    &{SICK_NOTE_BOOKING_INFO}
    Populate Sick Note Details    &{SICK_NOTE_DETAILS}
    Save Sick Note Form
    Sign Sick Note Electronically    ${SICK_NOTE_DETAILS}[sick_note.doctor_signature]
    Send Sick Note Via Email    ${SICK_NOTE_DETAILS}[sick_note.doctor_email]
    Print Sick Note
    Validate Sick Note Created    &{SICK_NOTE_EXPECTED_DATA}
    Validate Sick Note Saved In Clinical Record    ${SICK_NOTE_EXPECTED_DATA}[expected.saved_in_clinical_record]
    Validate Sick Note Email Log Recorded    ${SICK_NOTE_EXPECTED_DATA}[expected.sent_email]
    Validate Sick Note Print Log Recorded    ${SICK_NOTE_EXPECTED_DATA}[expected.printed]
    Validate QR Code Present On Sick Note Printout    ${SICK_NOTE_EXPECTED_DATA}[expected.qr_code_present]
    Validate No Validation Errors In Sick Note    ${SICK_NOTE_EXPECTED_DATA}[expected.validation_errors]
