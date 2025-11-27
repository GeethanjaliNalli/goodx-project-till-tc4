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

TC_09 Validate Sick Note Creation With Standard Valid Data From Diary
    [Documentation]    Validates that a practitioner can create and complete a Sick Note from the Diary module using standard valid data.
    ...    Ensures the Sick Note is populated with correct patient, booking, and medical details and is successfully signed, emailed, and printed.
    ...    Confirms that the Sick Note is saved in the clinical record and communication history is updated.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_VALID}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note From Booking Context    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_VALID}    ${BOOKING_INFO_VALID}
    Enter Sick Note Details Using Dictionary    ${SICK_NOTE_INFO_VALID}
    Sign Sick Note
    Send Sick Note By Email
    Print Sick Note
    Validate Sick Note Details In Preview    ${EXPECTED_DATA_VALID}
    Validate Sick Note Saved In Clinical Record
    Validate Communication History Logs

TC_10 Validate Sick Note Creation For Minimum Allowed Days
    [Documentation]    Validates that a practitioner can create a Sick Note for the minimum allowed duration (single day).
    ...    Ensures the Sick Note correctly reflects the one-day period, work status, and return-to-work date.
    ...    Confirms that the Sick Note is printed and stored without validation errors.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_VALID}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note From Booking Context    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_VALID}    ${BOOKING_INFO_VALID}
    Enter Sick Note Details Using Dictionary    ${SICK_NOTE_INFO_MINIMUM_DAYS}
    Sign Sick Note
    Print Sick Note
    Validate Sick Note Details In Preview    ${EXPECTED_DATA_MINIMUM_DAYS}
    Validate Sick Note Saved In Clinical Record

TC_11 Validate Sick Note Creation For Maximum Allowed Days
    [Documentation]    Validates that a practitioner can create a Sick Note for the maximum allowed duration.
    ...    Ensures the Sick Note correctly reflects the extended period, diagnosis, and return-to-work date.
    ...    Confirms that the Sick Note can be emailed without print and is stored correctly.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_VALID}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note From Booking Context    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_VALID}    ${BOOKING_INFO_VALID}
    Enter Sick Note Details Using Dictionary    ${SICK_NOTE_INFO_MAXIMUM_DAYS}
    Sign Sick Note
    Send Sick Note By Email
    Validate Sick Note Details In Preview    ${EXPECTED_DATA_MAXIMUM_DAYS}
    Validate Sick Note Saved In Clinical Record
    Validate Communication History Logs

TC_12 Validate Sick Note Creation Fails When End Date Is Before Start Date
    [Documentation]    Validates that the system prevents Sick Note creation when the end date is earlier than the start date.
    ...    Ensures an appropriate validation message is displayed and the Sick Note is not saved.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_VALID}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note From Booking Context    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_VALID}    ${BOOKING_INFO_VALID}
    Enter Sick Note Details Using Dictionary    ${SICK_NOTE_INFO_INVALID_DATES}
    Attempt To Save Sick Note With Invalid Dates
    Validate Sick Note Date Validation Message Is Displayed
    Validate Sick Note Not Saved In Clinical Record

TC_13 Validate Sick Note Creation Fails When Diagnosis Is Missing
    [Documentation]    Validates that the system enforces mandatory diagnosis and ICD-10 fields when creating a Sick Note.
    ...    Ensures appropriate validation messages are displayed and the Sick Note is not saved.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_VALID}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note From Booking Context    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_VALID}    ${BOOKING_INFO_VALID}
    Enter Sick Note Details Using Dictionary    ${SICK_NOTE_INFO_MISSING_DIAGNOSIS}
    Attempt To Save Sick Note With Missing Diagnosis
    Validate Sick Note Mandatory Diagnosis Message Is Displayed
    Validate Sick Note Not Saved In Clinical Record

TC_14 Validate Sick Note Creation When QR Code Is Disabled
    [Documentation]    Validates that a practitioner can create and print a Sick Note when QR code is disabled for the certificate.
    ...    Ensures the Sick Note prints without QR code while all other details remain accurate.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO_VALID}[input.booking.reason]
    Open Sick Note Form
    Populate Sick Note From Booking Context    ${PATIENT_INFO_VALID}    ${DEBTOR_INFO_VALID}    ${BOOKING_INFO_VALID}
    Enter Sick Note Details Using Dictionary    ${SICK_NOTE_INFO_NO_QR}
    Sign Sick Note
    Print Sick Note
    Validate Sick Note Details In Preview    ${EXPECTED_DATA_NO_QR}
    Validate QR Code Not Displayed On Sick Note
    Validate Sick Note Saved In Clinical Record
