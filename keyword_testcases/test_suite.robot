*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...    User should be redirected to the dashboard upon successful login.
    ...    The dashboard should display the correct user information.
    Validate Dashboard Is Displayed

TC_02 Validate User Is Able To Create New Patient Booking
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    create a new patient booking, and validate the booking is created.
    ...    Ensures all booking details are saved correctly.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${DEBTOR_INFO}
    Save Booking Form
    Validate Booking Timeslot Is Created    ${BOOKING_INFO}[input.time]    ${EXPECTED_DATA}[cell_no]    ${EXPECTED_DATA}[debtor_name]

TC_03 Validate User Is Unable To Create New Patient Booking
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    and is unable to create a new patient booking with invalid data.
    ...    Ensures proper validation and error messages are displayed.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${DEBTOR_INFO}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]

TC_04 Validate User Is Unable To Create New Patient Booking Without Name
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    and is unable to create a new patient booking without entering the name.
    ...    Ensures proper validation and error messages are displayed.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${DEBTOR_INFO}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
    Validate Warning Alert Is Displayed    ${INVALID_FIELD_ERROR_MESSAGE}

TC_05 Validate User Is Able To Create Booking For Existing patient
    [Documentation]    Verifies that the user can successfully log in, navigate to the Diary module,
    ...    and create a booking for an existing patient.
    ...    Ensures booking is saved and visible in the diary.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${EXISTING_DEBTOR_NAME}
    Save Booking Form
    Validate Booking Timeslot Is Created    ${BOOKING_INFO}[input.time]    ${EXPECTED_DATA}[cell_no]    ${EXPECTED_DATA}[debtor_name]

TC_06 Validate User Is Unable To Create Booking For Existing patient When Form Is Closed
    [Documentation]    Verifies that the user can log in and attempt to create a booking with
    ...    an existing patient, but closes the form before saving.
    ...    Ensures booking is not created.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${EXISTING_DEBTOR_NAME}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]

TC_07 Validate User Is Unable To Create Booking Without Debtor/patient Details
    [Documentation]    Verifies that the user can log in and attempt to create a booking without debtor/patient details.
    ...    Ensures booking is not created and appropriate validation is shown.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
    Validate Warning Alert Is Displayed    ${INVALID_FIELD_ERROR_MESSAGE}

TC_08 Validate User Is Able To Add Sick Note For Patient In Diary
    [Documentation]    Verifies that a practitioner can create and save a Sick Note (Medical Certificate) for a selected patient in the Diary.
    ...    Ensures the Sick Note is saved in the Patient’s Clinical record and success message is displayed.
    ...    Confirms that all required details are entered and the form is saved successfully.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_INFO}[date]    ${SICK_NOTE_INFO}[details]
    Save Sick Note
    Validate Sick Note Saved
