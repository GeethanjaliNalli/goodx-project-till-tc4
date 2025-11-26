

*** Test Cases ***

TC_09 Validate Practitioner Can Add Sick Note For Existing Patient Booking In Diary
    [Documentation]    Validates that a practitioner can add a Sick Note (Medical Certificate) for a selected patient from the Diary module.
    ...    Ensures the Sick Note is created with accurate patient and medical details, signed by the doctor, emailed and printed as per settings, and is saved in the clinical record with communication logs and QR code (if enabled).
    ...    Preconditions: Practitioner is logged in, patient booking exists, and all system configurations are set.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO}
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_INFO}
    Sign Sick Note
    Send Sick Note By Email
    Print Sick Note
    Validate Sick Note Saved In Clinical Record    ${EXPECTED_DATA}
    Validate Communication History Logs    ${EXPECTED_DATA}
