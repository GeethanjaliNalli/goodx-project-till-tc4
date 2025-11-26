

*** Test Cases ***

TC_09 Validate Sick Note Can Be Added And Verified For Patient In Diary
    [Documentation]    Validates that a practitioner can add a Sick Note (Medical Certificate) for a selected patient from the Diary module.
    ...    Ensures the Sick Note is saved in the Patient's Clinical record, and communication logs (Email and Print) are recorded. QR Code appears on printout if enabled.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Existing Patient Booking    ${BOOKING_INFO}
    Open Sick Note Form
    Enter Sick Note Details    ${SICK_NOTE_INFO}
    Sign Sick Note
    Send Sick Note By Email
    Print Sick Note
    Validate Sick Note Saved In Clinical Record    ${EXPECTED_DATA}
    Validate Communication History Logs    ${EXPECTED_DATA}
