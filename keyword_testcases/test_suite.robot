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

TC_09 Validate Sick Note Can Be Created Signed Emailed And Printed For Patient In Diary Using TC00006 Data
    [Documentation]    Validates end-to-end Sick Note creation, signing, emailing, and printing for a selected patient booking in the Diary using TC00006-specific data.
    ...    Ensures the Sick Note is populated with accurate patient, debtor, booking, and medical details and that email/print actions are logged correctly.
    ...    Confirms that the Sick Note is saved in the patient clinical record and that QR code (if enabled) is available on the printout.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_TC00006}[input.booking.reason]
    Open Sick Note Form
    Enter Sick Note Details Using TC00006 Data    ${PATIENT_INFO_TC00006}    ${DEBTOR_INFO_TC00006}    ${BOOKING_INFO_TC00006}    ${SICK_NOTE_INFO_TC00006}
    Sign Sick Note
    Send Sick Note By Email Using TC00006 Data    ${EMAIL_INFO_TC00006}
    Print Sick Note Using TC00006 Data    ${PRINT_INFO_TC00006}
    Validate Sick Note Details For TC00006    ${EXPECTED_DATA_TC00006}
    Validate Sick Note Saved In Clinical Record
    Validate Communication History Logs For TC00006    ${EXPECTED_DATA_TC00006}

TC_10 Validate Sick Note Cannot Be Saved Without Mandatory Medical Details For TC00006
    [Documentation]    Verifies that the system prevents saving a Sick Note when mandatory medical details (such as diagnosis or sick note period) are missing for TC00006.
    ...    Ensures appropriate validation messages are displayed and that no incomplete Sick Note is saved to the clinical record.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_TC00006}[input.booking.reason]
    Open Sick Note Form
    Enter Sick Note Details With Missing Mandatory Fields For TC00006    ${PATIENT_INFO_TC00006}    ${DEBTOR_INFO_TC00006}    ${BOOKING_INFO_TC00006}
    Attempt To Save Incomplete Sick Note
    Validate Mandatory Field Validation Messages Are Displayed On Sick Note
    Validate Incomplete Sick Note Not Saved In Clinical Record

TC_11 Validate Sick Note Email Cannot Be Sent With Missing Or Invalid Email Details For TC00006
    [Documentation]    Verifies that the system prevents sending a Sick Note email when required email details are missing or invalid for TC00006.
    ...    Ensures appropriate validation or error messages are displayed and that no email is sent.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_TC00006}[input.booking.reason]
    Open Sick Note Form
    Enter Sick Note Details Using TC00006 Data    ${PATIENT_INFO_TC00006}    ${DEBTOR_INFO_TC00006}    ${BOOKING_INFO_TC00006}    ${SICK_NOTE_INFO_TC00006}
    Sign Sick Note
    Open Sick Note Email Dialog
    Enter Sick Note Email Details With Missing Or Invalid Data For TC00006    ${EMAIL_INFO_TC00006}
    Attempt To Send Sick Note Email With Invalid Details
    Validate Sick Note Email Validation Messages Are Displayed
    Validate Sick Note Email Not Sent For TC00006

TC_12 Validate Sick Note Print Can Be Cancelled And Not Logged For TC00006
    [Documentation]    Verifies that the user can cancel the Sick Note print operation for TC00006 and that no print log entry is created.
    ...    Ensures that cancelling print does not affect the saved Sick Note data.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_TC00006}[input.booking.reason]
    Open Sick Note Form
    Enter Sick Note Details Using TC00006 Data    ${PATIENT_INFO_TC00006}    ${DEBTOR_INFO_TC00006}    ${BOOKING_INFO_TC00006}    ${SICK_NOTE_INFO_TC00006}
    Sign Sick Note
    Open Sick Note Print Dialog
    Configure Sick Note Print Details For TC00006    ${PRINT_INFO_TC00006}
    Cancel Sick Note Print
    Validate Sick Note Print Not Logged For TC00006
    Validate Sick Note Data Remains Unchanged For TC00006
