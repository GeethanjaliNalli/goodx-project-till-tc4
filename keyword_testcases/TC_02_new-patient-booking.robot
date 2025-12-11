*** Settings ***
Documentation    This suite validates the New Patient Booking functionality, including positive and negative scenarios for booking creation in the diary.
Resource    ../common/super.resource
Test Setup    Login To Application
Test Teardown    Logout From Application

*** Test Cases ***
TC_02 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validate that a user can successfully create a new patient booking when all required fields are filled and saved.
    ...    Booking should be created and visible in the diary timeslot.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]

TC_03 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validate that a booking is NOT created if required fields are missing and the form is saved.
    ...    No booking should appear in the diary for the attempted timeslot.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO_MISSING_NAME}[input.time]
    Create New Patient Booking With Missing Fields    ${BOOKING_INFO_MISSING_NAME}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO_MISSING_NAME}[input.time]

TC_04 Validate Booking Is Not Created When Booking Form Is Closed
    [Documentation]    Validate that a booking is NOT created if the booking form is closed without saving.
    ...    No booking should appear in the diary for the attempted timeslot.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Enter Booking Form Data    ${BOOKING_INFO}
    Click Close Booking
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
