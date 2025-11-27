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

TC_09 Validate Standard Sick Note Creation From Diary For Existing Patient Booking
    [Documentation]    Validates that a practitioner can create a standard Sick Note for an existing patient booking in the Diary.
    ...    Ensures the Sick Note is populated with correct patient, debtor, and booking details and saved successfully.
    ...    Confirms that no validation errors occur and the Sick Note is available in the patient clinical record.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_DIARY}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note Using Booking And Patient Details    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_COMPLETE}    ${BOOKING_INFO_DIARY}    ${SICK_NOTE_INFO_STANDARD}
    Validate Sick Note Data On Form    ${EXPECTED_DATA_STANDARD_SICK_NOTE}
    Save Sick Note
    Validate Sick Note Saved In Clinical Record

TC_10 Validate Sick Note Email And Print Actions And Communication Logs
    [Documentation]    Validates that a practitioner can email and print a Sick Note and that both actions are logged in the patient communication history.
    ...    Ensures email and print options behave according to Sick Note configuration and expected communication log entries are created.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_DIARY}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note Using Booking And Patient Details    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_COMPLETE}    ${BOOKING_INFO_DIARY}    ${SICK_NOTE_INFO_STANDARD}
    Save Sick Note
    Send Sick Note By Email
    Print Sick Note
    Validate Communication History Logs For Sick Note    ${EXPECTED_DATA_COMMUNICATION_LOGS}

TC_11 Validate Long Absence Sick Note Without Print
    [Documentation]    Validates creation of a Sick Note for a long absence period where only email is sent and print is not requested.
    ...    Ensures the Sick Note period, diagnosis, and email-only configuration are saved correctly.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_DIARY}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note Using Booking And Patient Details    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_COMPLETE}    ${BOOKING_INFO_DIARY}    ${SICK_NOTE_INFO_LONG_ABSENCE}
    Validate Sick Note Data On Form    ${EXPECTED_DATA_LONG_ABSENCE}
    Save Sick Note
    Validate Sick Note Saved In Clinical Record

TC_12 Validate Fit For Work Sick Note Scenario
    [Documentation]    Validates creation of a Sick Note where the patient is marked as fit for work and no email is sent.
    ...    Ensures fit-for-work flag, QR code setting, and print-only configuration are handled correctly.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_DIARY}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note Using Booking And Patient Details    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_COMPLETE}    ${BOOKING_INFO_DIARY}    ${SICK_NOTE_INFO_FIT_FOR_WORK}
    Validate Sick Note Data On Form    ${EXPECTED_DATA_FIT_FOR_WORK}
    Save Sick Note
    Print Sick Note

TC_13 Validate Sick Note Creation With Missing Optional Fields
    [Documentation]    Validates that a Sick Note can be created when optional fields such as comments are left blank.
    ...    Ensures the system does not raise validation errors for missing optional data and saves the Sick Note successfully.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_DIARY}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note Using Booking And Patient Details    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_COMPLETE}    ${BOOKING_INFO_DIARY}    ${SICK_NOTE_INFO_MISSING_OPTIONAL_FIELDS}
    Save Sick Note
    Validate Sick Note Saved In Clinical Record

TC_14 Validate Sick Note Validation Error For Invalid Date Range
    [Documentation]    Validates that the system displays a validation error when the Sick Note end date is earlier than the start date.
    ...    Ensures the Sick Note is not saved and the appropriate validation message is shown to the user.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_DIARY}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note Using Booking And Patient Details    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_COMPLETE}    ${BOOKING_INFO_DIARY}    ${SICK_NOTE_INFO_INVALID_DATES}
    Attempt To Save Sick Note With Invalid Dates
    Validate Sick Note Date Validation Error Message    ${EXPECTED_DATA_INVALID_DATES}[validation_error_message]
    Validate Sick Note Not Saved In Clinical Record

TC_15 Validate Sick Note With Maximum Length Comments
    [Documentation]    Validates that the Sick Note comments field can handle maximum length text without truncation or errors.
    ...    Ensures the full comments text is saved and displayed correctly on the Sick Note.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_DIARY}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note Using Booking And Patient Details    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_COMPLETE}    ${BOOKING_INFO_DIARY}    ${SICK_NOTE_INFO_MAX_LENGTH_COMMENTS}
    Save Sick Note
    Validate Sick Note Comments Persisted    ${SICK_NOTE_INFO_MAX_LENGTH_COMMENTS}[input.sicknote.comments]
