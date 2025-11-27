*** Settings ***
Documentation    Keywords for creating, verifying, and managing Sick Notes (Medical Certificates) in the Diary module.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_page.resource

*** Keywords ***
Select Existing Patient Booking
    [Documentation]    Selects an existing patient booking in the Diary using booking information.
    Search For Booking In Diary    ${BOOKING_INFO}
    Select Booking Row    ${BOOKING_INFO}
    Wait Until Booking Details Are Loaded    ${BOOKING_INFO}

Search For Booking In Diary
    [Documentation]    Searches for a booking in the Diary module using booking details.
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.search_booking_date}    ${BOOKING_INFO}[input.booking.date]
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.search_booking_time}    ${BOOKING_INFO}[input.booking.time]
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.search_booking}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.table.booking_results}    5s

Select Booking Row
    [Documentation]    Selects the booking row matching the booking info in the Diary results table.
    ${patient_name}=    Set Variable    ${BOOKING_INFO}[input.booking.doctor]
    Click    xpath=//table[@id='bookingResults']//tr[td[contains(text(),'${patient_name}')]]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.add_sick_note}    3s

Wait Until Booking Details Are Loaded
    [Documentation]    Waits until the booking details panel is loaded for the selected booking.
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.panel.booking_details}    5s

Enter Sick Note Details With Missing Mandatory Fields
    [Documentation]    Enters Sick Note details with missing mandatory fields to trigger validation errors.
    &{incomplete_sick_note}=    Create Dictionary    input.sicknote.start_date=    input.sicknote.end_date=    input.sicknote.diagnosis=    input.sicknote.comments=    input.sicknote.doctor_signature=    input.sicknote.qr_code=Enabled    input.sicknote.send_email=Yes    input.sicknote.print=Yes
    Enter Sick Note Details    &{incomplete_sick_note}

Attempt To Sign Sick Note
    [Documentation]    Attempts to sign the Sick Note (should fail if mandatory fields are missing).
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.sign_sick_note}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.label.validation_error}    3s

Validate Sick Note Mandatory Field Validation Error Displayed
    [Documentation]    Validates that the Sick Note mandatory field validation error is displayed.
    ${error_text}=    Get Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.label.validation_error}
    Should Contain    ${error_text}    Mandatory

Validate Sick Note Not Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is NOT saved in the patient’s clinical record.
    Go To Clinical Records
    Wait Until Page Does Not Contain Element    Sick Note    timeout=5s

Close Sick Note Form Without Saving
    [Documentation]    Closes the Sick Note form without saving any data.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.close_sick_note}
    Handle Attention Alert    dismiss
    Wait Until Element Is Invisible    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sick_note_details}    5s

Validate No Communication History Log Created
    [Documentation]    Validates that no Email or Print logs are created in the patient communication history after closing the Sick Note form without saving.
    Go To Communication History
    Wait Until Page Does Not Contain Element    Email    timeout=3s
    Wait Until Page Does Not Contain Element    Print    timeout=3s

Go To Clinical Records
    [Documentation]    Navigates to the Clinical Records section for the current patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.tab.clinical_records}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.section.clinical_records}    3s

Go To Communication History
    [Documentation]    Navigates to the Communication History section for the current patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.tab.communication_history}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.section.communication_history}    3s

Wait Until Page Does Not Contain Element
    [Documentation]    Waits until the page does not contain the specified element text.
    [Arguments]    ${text}    ${timeout}=5s
    Wait Until Keyword Succeeds    ${timeout}    1s    Run Keyword And Ignore Error    Page Should Not Contain Element    ${text}

Page Should Not Contain Element
    [Documentation]    Fails if the page contains the specified element text.
    [Arguments]    ${text}
    ${status}=    Run Keyword And Return Status    Page Should Contain    ${text}
    Should Be False    ${status}
