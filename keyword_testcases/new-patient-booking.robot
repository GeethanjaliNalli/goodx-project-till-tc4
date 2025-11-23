*** Settings ***
Documentation    This suite contains test cases to validate new patient booking functionality in the diary module.
Resource    ../common/super.resource
Test Setup    Login To Application
Test Teardown    Logout From Application

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validate that a user can create a new patient booking by filling all required fields and saving.
    ...    Booking should be created and visible in the diary timeslot.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${PATIENT_INFO}    ${BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]    ${EXPECTED_DATA}[debtor_name]    ${EXPECTED_DATA}[cell_no]

TC_02 Validate Booking Is Not Created When Form Is Closed Without Saving
    [Documentation]    Ensure that closing the booking form without saving does not create a booking.
    ...    No booking should be present for the selected timeslot if the form is closed.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Enter Form Data    ${PATIENT_INFO}
    Enter Form Data    ${BOOKING_INFO}
    Click Close Booking
    Validate Booking Timeslot Is Not Created    ${EXPECTED_DATA}[timeslot]
