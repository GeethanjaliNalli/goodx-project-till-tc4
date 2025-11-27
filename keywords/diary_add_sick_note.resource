*** Settings ***
Documentation    Keywords for creating, verifying, and managing Sick Notes (Medical Certificates) in the Diary module.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_page.resource

*** Keywords ***
Select Existing Patient Booking
    [Documentation]    Selects an existing patient booking from the Diary using booking information.
    Search For Booking In Diary    ${BOOKING_INFO}
    Select Booking Row    ${BOOKING_INFO}
    Wait Until Booking Details Are Loaded    ${BOOKING_INFO}

Search For Booking In Diary
    [Documentation]    Searches for the booking in the Diary grid using the provided booking information.
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.search_booking}    ${BOOKING_INFO}[input.booking.date]
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.search}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.row.booking}    timeout=5s

Select Booking Row
    [Documentation]    Selects the booking row matching the booking information.
    Click    xpath=//tr[td[contains(text(), '${BOOKING_INFO}[input.booking.time]')] and td[contains(text(), '${BOOKING_INFO}[input.booking.doctor]')]]
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.add_sick_note}    timeout=3s

Wait Until Booking Details Are Loaded
    [Documentation]    Waits until the booking details panel is loaded for the selected booking.
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.panel.booking_details}    timeout=5s

Enter Sick Note Details With Missing Mandatory Fields
    [Documentation]    Enters Sick Note details with missing mandatory fields to trigger validation errors.
    Enter Sick Note Details    ${SICK_NOTE_INFO}
    Clear Mandatory Sick Note Fields

Clear Mandatory Sick Note Fields
    [Documentation]    Clears mandatory fields (e.g., diagnosis, start_date, end_date) in the Sick Note form.
    Clear Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sicknote.diagnosis}
    Clear Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sicknote.start_date}
    Clear Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sicknote.end_date}

Attempt To Sign Sick Note
    [Documentation]    Attempts to sign the Sick Note, expecting validation errors if mandatory fields are missing.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.sign_sick_note}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.label.validation_error}    timeout=3s

Validate Sick Note Mandatory Field Error Displayed
    [Documentation]    Validates that the mandatory field error is displayed on the Sick Note form.
    ${actual_error}=    Get Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.label.validation_error}
    Should Contain    ${actual_error}    This field is required

Close Sick Note Form Without Saving
    [Documentation]    Closes the Sick Note form without saving any data.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.close_sick_note}
    Handle Attention Alert    dismiss
    Wait Until Element Is Invisible    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sick_note_details}    timeout=5s

Validate Sick Note Not Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is not saved in the patient’s clinical record.
    Go To Clinical Records
    Wait Until Page Does Not Contain Element    Sick Note    timeout=5s

Go To Clinical Records
    [Documentation]    Navigates to the Clinical Records section for the current patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.tab.clinical_records}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.section.clinical_records}    timeout=5s

Go To Communication History
    [Documentation]    Navigates to the Communication History section for the current patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.tab.communication_history}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.section.communication_history}    timeout=5s

Wait Until Page Does Not Contain Element
    [Documentation]    Waits until the specified element is no longer present on the page.
    [Arguments]    ${text}    ${timeout}=5s
    Wait Until Keyword Succeeds    ${timeout}    1s    Run Keyword And Ignore Error    Page Should Not Contain Element    ${text}

Page Should Not Contain Element
    [Documentation]    Fails if the specified text is found on the page.
    [Arguments]    ${text}
    ${found}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${text}    timeout=1s
    Should Be False    ${found}
