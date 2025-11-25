*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...    Ensures the login process works as expected for valid users.
    ...    Confirms successful navigation to the dashboard after login.
    Validate Dashboard Is Displayed

TC_02 Validate User Is Able To Create New Patient Booking
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    create a new patient booking, and save the booking form.
    ...    Ensures the booking is created and visible in the Diary.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${DEBTOR_INFO}
    Save Booking Form
    Validate Booking Timeslot Is Created    ${BOOKING_INFO}[input.time]    ${EXPECTED_DATA}[cell_no]    ${EXPECTED_DATA}[debtor_name]

TC_03 Validate User Is Unable To Create New Patient Booking
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    and is unable to create a new patient booking due to invalid or missing data.
    ...    Ensures the booking is not created and appropriate warnings are displayed.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${DEBTOR_INFO}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
    Validate Warning Alert Is Displayed    ${INVALID_FIELD_ERROR_MESSAGE}

TC_04 Validate User Is Unable To Create New Patient Booking Without Name
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    and is unable to create a new patient booking without entering the patient's name.
    ...    Ensures the booking is not created and appropriate warnings are displayed.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${DEBTOR_INFO}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
    Validate Warning Alert Is Displayed    ${INVALID_FIELD_ERROR_MESSAGE}

TC_05 Validate User Is Able To Create Booking For Existing patient
    [Documentation]    Verifies that the user can successfully log in, navigate to the Diary module,
    ...    and create a booking for an existing patient.
    ...    Ensures the booking is created and visible in the Diary.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${EXISTING_DEBTOR_NAME}
    Save Booking Form
    Validate Booking Timeslot Is Created    ${BOOKING_INFO}[input.time]    ${EXPECTED_DATA}[cell_no]    ${EXPECTED_DATA}[debtor_name]

TC_06 Validate User Is Unable To Create Booking For Existing patient When Form Is Closed
    [Documentation]    Verifies that the user can log in and attempt to create a booking with
    ...    an existing patient but closes the form before saving.
    ...    Ensures the booking is not created.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${EXISTING_DEBTOR_NAME}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]

TC_07 Validate User Is Unable To Create Booking Without Debtor/patient Details
    [Documentation]    Verifies that the user can log in and attempt to create a booking with
    ...    missing debtor or patient details.
    ...    Ensures the booking is not created and appropriate warnings are displayed.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
    Validate Warning Alert Is Displayed    ${INVALID_FIELD_ERROR_MESSAGE}

TC_08 Validate User Is Able To Add Sick Note For Patient Booking
    [Documentation]    Validates that a practitioner can create and verify a Sick Note (Medical Certificate) for a selected patient booking.
    ...    Ensures the Sick Note is saved in the patient’s clinical record, email and print logs are recorded, and QR code appears on the printout if enabled.
    ...    Preconditions: A valid patient booking exists in the Diary. Practitioner is logged in with access to Clinical Forms. Patient has a complete debtor file. Doctor’s signature and email settings are configured.
    Open Diary Module
    Select Patient Booking
    Open Clinical Forms
    Select Sick Note Form
    Enter Sick Note Details
    Save Sick Note Form
    Validate Sick Note Saved In Clinical Record
    Validate Email And Print Logs Recorded
    Validate QR Code On Printout If Enabled
