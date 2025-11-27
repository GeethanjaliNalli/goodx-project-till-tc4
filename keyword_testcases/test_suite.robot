
*** Test Cases ***

TC_09 Validate Sick Note Can Be Created, Signed, Emailed, And Printed For Selected Patient In Diary
    [Documentation]    Validates that a practitioner can create, populate, sign, email, and print a Sick Note (Medical Certificate) for a selected patient from the Diary module.
    ...    Ensures the Sick Note contains accurate patient and medical details, is signed by the doctor, and is saved in the clinical record with communication logs and QR code (if enabled).
    ...    Confirms that no data loss or validation errors occur during the process.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO}
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_INFO}
    Sign Sick Note
    Send Sick Note By Email
    Print Sick Note
    Validate Sick Note Saved In Clinical Record    ${EXPECTED_DATA}
    Validate Communication History Logs    ${EXPECTED_DATA}

TC_10 Validate Sick Note Cannot Be Created Without Mandatory Fields
    [Documentation]    Verifies that the system prevents creation of a Sick Note when mandatory fields are missing and displays appropriate validation errors. Ensures no Sick Note is created or saved in the clinical record.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO}
    Open Sick Note Form
    Enter Sick Note Details With Missing Mandatory Fields    ${SICK_NOTE_INFO}
    Attempt To Sign Sick Note
    Validate Mandatory Field Error Message Displayed
    Validate Sick Note Not Saved In Clinical Record    ${EXPECTED_DATA}

TC_11 Validate Sick Note Cannot Be Created With Invalid Dates
    [Documentation]    Verifies that the system prevents creation of a Sick Note when invalid date ranges are entered (e.g., end date before start date) and displays appropriate validation errors. Ensures no Sick Note is created or saved in the clinical record.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO}
    Open Sick Note Form
    Enter Sick Note Details With Invalid Dates    ${SICK_NOTE_INFO}
    Attempt To Sign Sick Note
    Validate Invalid Date Error Message Displayed
    Validate Sick Note Not Saved In Clinical Record    ${EXPECTED_DATA}
