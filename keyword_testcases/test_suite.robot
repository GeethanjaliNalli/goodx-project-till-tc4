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

TC00005_Diary_Add Quicknote - Adding a quicknote
    [Documentation]    Adding a quick note to a booking. Preconditions: User needs to have a booking on a diary made with a new patient (not added to the debtor list yet). Expected: Quick Note should be auto completed and a print out should render with the image added, the text added (Test@123) and the PDF added.
    # Step 1-2: Open Diary and open clinical sidebar for the booking
    Open Diary And Open Clinical Sidebar    ${DIARY_MODULE}    ${BOOKING_INFO}[input.time]
    # Step 3-4: Select Quick Note form from forms library
    Select Quick Note Form    ${select.formsLibrary}
    # Step 5-9: Add image to quick note
    Add Image To Quick Note    ${quicknote.imageUploadButton}    ${QUICK_NOTE_DATA.input.upload_image}
    # Step 10: Add text to quick note
    Add Text To Quick Note    ${quicknote.textArea}    ${QUICK_NOTE_DATA.input.quick_note_text}
    # Step 11-12: Upload PDF to quick note
    Upload PDF To Quick Note    ${quicknote.pdfUploadButton}    ${QUICK_NOTE_DATA.input.upload_pdf}
    # Step 13: Print quick note
    Print Quick Note    ${quicknote.printButton}
