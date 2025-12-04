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

TC00002_Diary_NPB - New patient booking
    [Documentation]    Diary_ New patient booking. A booking should be made if required information was filled in and saved. If the user closes the screen or not all required fields are filled in, NO booking should be made.

    # Step 1-2: Ensure user is on Diary screen (precondition handled by test setup)
    # Step 3: Click on 'New Booking' button
    Click New Booking Button    ${BTN_NEW_BOOKING}

    # Step 4-7: Select booking type, status, date, and time
    Select Booking Type    ${SELECT_BOOKING_TYPE}
    Select Booking Status    ${SELECT_BOOKING_STATUS}
    Select Booking Date    ${SELECT_DATE}
    Select Booking Time    ${SELECT_TIME}

    # Step 8: Enter duration
    Enter Booking Duration    ${INPUT_DURATION}

    # Step 9: Enter reason for booking
    Enter Booking Reason    ${INPUT_REASON}

    # Step 10-16: Enter patient details (name, surname, cellphone, ID type, ID number, gender, initials, title)
    Enter Patient Name    ${INPUT_NAME}
    Enter Patient Surname    ${INPUT_SURNAME}
    Enter Patient Cellphone    ${INPUT_CELLPHONE}
    Select Patient ID Type    ${SELECT_ID_TYPE}
    Enter Patient ID Number    ${INPUT_ID_NUMBER}
    Select Patient Gender    ${SELECT_GENDER}
    Enter Patient Initials    ${INPUT_INITIALS}
    Select Patient Title    ${SELECT_TITLE}

    # Step 17-19: Enter medical aid option and number
    Select Medical Aid Option    ${SELECT_MEDICAL_AID_OPTION}
    Enter Medical Aid Number    ${INPUT_MEDICAL_AID_NUMBER}

    # Step 20: Save booking
    Save Booking Form    ${BTN_SAVE_BOOKING}

    # Step 21: Validate booking is created
    Validate Booking Is Created    ${SELECT_DATE}    ${SELECT_TIME}    ${INPUT_NAME}    ${INPUT_SURNAME}

    # Negative scenario: Try to create booking with missing required fields (e.g., missing name)
    [Tags]    Negative
    # Step 22: Click on 'New Booking' button
    Click New Booking Button    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[BTN_NEW_BOOKING]

    # Step 23-27: Fill booking form with missing name
    Select Booking Type    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_BOOKING_TYPE]
    Select Booking Status    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_BOOKING_STATUS]
    Select Booking Date    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_DATE]
    Select Booking Time    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_TIME]
    Enter Booking Duration    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[INPUT_DURATION]
    Enter Booking Reason    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[INPUT_REASON]
    Enter Patient Name    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[INPUT_NAME]
    Enter Patient Surname    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[INPUT_SURNAME]
    Enter Patient Cellphone    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[INPUT_CELLPHONE]
    Select Patient ID Type    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_ID_TYPE]
    Enter Patient ID Number    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[INPUT_ID_NUMBER]
    Select Patient Gender    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_GENDER]
    Enter Patient Initials    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[INPUT_INITIALS]
    Select Patient Title    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_TITLE]
    Select Medical Aid Option    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_MEDICAL_AID_OPTION]
    Enter Medical Aid Number    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[INPUT_MEDICAL_AID_NUMBER]

    # Step 28: Attempt to save booking with missing required fields
    Save Booking Form    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[BTN_SAVE_BOOKING]

    # Step 29: Validate booking is NOT created
    Validate Booking Is Not Created    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_DATE]    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[SELECT_TIME]    ${NEW_PATIENT_BOOKING_MISSING_FIELDS}[INPUT_SURNAME]
