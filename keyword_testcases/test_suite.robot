*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page, Booking page, and Diary Sick Note functionality.
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
    [Documentation]    Create and verify a Sick Note (Medical Certificate) for a selected Patient. Ensures the Sick Note is saved in the Patient’s Clinical record, communication logs are updated, and QR Code appears on printout if enabled.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Patient Booking In Diary    ${SICK_NOTE_INFO}[input.patient_name]    ${SICK_NOTE_INFO}[input.booking_date]    ${SICK_NOTE_INFO}[input.booking_time]
    Open Clinical Forms For Booking
    Select Sick Note Form
    Enter Sick Note Details    &{SICK_NOTE_INFO}
    Attach Doctor Signature    ${SICK_NOTE_INFO}[input.doctor_signature]
    Set Sick Note Dates    ${SICK_NOTE_INFO}[input.sick_note_date]    ${SICK_NOTE_INFO}[input.sick_note_start_date]    ${SICK_NOTE_INFO}[input.sick_note_end_date]
    Enter Sick Note Reason    ${SICK_NOTE_INFO}[input.reason]
    Enter Sick Note Duration    ${SICK_NOTE_INFO}[input.duration]
    Select Sick Note Delivery Method    ${SICK_NOTE_INFO}[select.delivery_method]
    Save Sick Note Form
    Validate Sick Note Saved In Clinical Record    ${SICK_NOTE_INFO}[expected.sick_note_saved]
    Validate Communication Log For Sick Note    ${SICK_NOTE_INFO}[expected.communication_log]
    Print Sick Note
    Validate QR Code On Printout    ${SICK_NOTE_INFO}[expected.qr_code_on_printout]
