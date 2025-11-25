*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...    Ensures access to the application dashboard upon login.
    ...    Checks for any login errors and validates successful authentication.
    # (existing steps not shown)
TC_02 Validate User Is Able To Create New Patient Booking
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    create a new patient booking, and save the booking details.
    ...    Ensures booking is visible in the Diary grid after creation.
    # (existing steps not shown)
TC_03 Validate User Is Unable To Create New Patient Booking
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    attempt to create a booking with invalid or incomplete data, and receive appropriate validation errors.
    ...    Ensures booking is not created in the Diary grid.
    # (existing steps not shown)
TC_04 Validate User Is Unable To Create New Patient Booking Without Name
    [Documentation]    Verifies that the user can successfully log in, access the Diary page,
    ...    attempt to create a booking without entering the patient's name, and receive a validation error.
    ...    Ensures booking is not created in the Diary grid.
    # (existing steps not shown)
TC_05 Validate User Is Able To Create Booking For Existing patient
    [Documentation]    Verifies that the user can successfully log in, navigate to the Diary module,
    ...    create a booking for an existing patient, and save the booking details.
    ...    Ensures booking is visible in the Diary grid after creation.
    # (existing steps not shown)
TC_06 Validate User Is Unable To Create Booking For Existing patient When Form Is Closed
    [Documentation]    Verifies that the user can log in and attempt to create a booking with
    ...    the booking form closed, ensuring no booking is created.
    ...    Ensures booking is not created in the Diary grid.
    # (existing steps not shown)
TC_07 Validate User Is Unable To Create Booking Without Debtor/patient Details
    [Documentation]    Verifies that the user can log in and attempt to create a booking
    ...    without debtor or patient details, ensuring a validation error is displayed.
    ...    Ensures booking is not created in the Diary grid.
    # (existing steps not shown)
TC_08 Validate Sick Note Can Be Created, Signed, Emailed, And Printed For Patient In Diary
    [Documentation]    Validates that a practitioner can create, populate, sign, email, and print a Sick Note (Medical Certificate) for a selected patient from the Diary module.
    ...    Ensures the Sick Note contains accurate patient and medical details, is signed by the doctor, and is saved in the clinical record with communication logs and QR code (if enabled).
    ...    Confirms that no data loss or validation errors occur during the process.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${PATIENT_BOOKING_INFO}
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_DATA}
    Sign Sick Note
    Send Sick Note By Email
    Print Sick Note
    Validate Sick Note Saved In Clinical Record
    Validate Communication History Logs
