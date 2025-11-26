

*** Test Cases ***

TC_09 Validate Practitioner Can Add Sick Note For Existing Patient In Diary
    [Documentation]    Validates that a practitioner can add a Sick Note (Medical Certificate) for a selected patient from the Diary module.
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
