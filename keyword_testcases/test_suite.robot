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

TC00007_Diary_Script - Validate that the Practitioner can create, complete, sign, email, and print a patient prescription (Script) using the Basic Script Features.
    [Documentation]    Validate that the Practitioner can create, complete, sign, email, and print a patient prescription (Script) using the Basic Script Features.
    # Step 1-2: Open Diary and select an existing patient booking
    Open Diary And Select Existing Booking
    # Step 3-4: Open Clinical sidebar and select Script tab
    Open Clinical Sidebar And Select Script Tab
    # Step 5-6: Click 'New Script' and select script type (Acute/Repeat) using test data
    Click New Script And Select Script Type    ${SCRIPT_DATA.select.script.type}
    # Step 7: Enter diagnosis using test data
    Enter Script Diagnosis    ${SCRIPT_DATA.input.diagnosis}
    # Step 8-9: Add medication to script using test data
    Add Medication To Script    ${SCRIPT_DATA.input.medicine}
    # Step 10: Enter directions for medication using test data
    Add Medication Directions    ${SCRIPT_DATA.input.directions}
    # Step 11: Enter total quantity using test data
    Enter Medication Quantity    ${SCRIPT_DATA.input.total.quantity}
    # Step 12: Enter repeat count using test data
    Enter Medication Repeat Count    ${SCRIPT_DATA.input.repeat.count}
    # Step 13: Set 'Not Substitutable' checkbox using test data
    Set Not Substitutable Checkbox    ${SCRIPT_DATA.checkbox.not.substitutable}
    # Step 14: Save and complete the script
    Save And Complete Script
    # Step 15: Sign the script (if signature is configured)
    Sign Script If Required
    # Step 16: Email and print the script
    Email Script To Patient
    Print Script Document
    # Step 17: Validate script is marked as completed and all details (medication, directions, signature, QR code) are correct
    Validate Script Completion And Output Details
