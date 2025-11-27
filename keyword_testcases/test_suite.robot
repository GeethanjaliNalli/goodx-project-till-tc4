

TC_09 Validate Sick Note Can Be Created, Signed, Emailed, And Printed For Patient In Diary (Detailed)
    [Documentation]    Validates that a practitioner can create, populate, sign, email, and print a Sick Note (Medical Certificate) for a selected patient from the Diary module using detailed test data.
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

TC_10 Validate Sick Note Creation Fails With Missing Mandatory Fields
    [Documentation]    Verifies that the system prevents Sick Note creation when mandatory fields are missing and displays appropriate validation errors. Ensures no Sick Note is saved for incomplete data.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO}
    Open Sick Note Form
    Enter Sick Note Details With Missing Mandatory Fields
    Attempt To Sign Sick Note
    Validate Sick Note Mandatory Field Validation Error Displayed
    Validate Sick Note Not Saved In Clinical Record

TC_11 Validate Sick Note Is Not Created When Form Is Closed Without Saving
    [Documentation]    Verifies that closing the Sick Note form without saving does not create a Sick Note and no data is persisted in the clinical record or communication logs.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO}
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_INFO}
    Close Sick Note Form Without Saving
    Validate Sick Note Not Saved In Clinical Record
    Validate No Communication History Log Created
