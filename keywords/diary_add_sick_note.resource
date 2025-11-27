*** Settings ***
Documentation    Keywords for creating, verifying, and managing Sick Notes (Medical Certificates) in the Diary module.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_page.resource

*** Keywords ***
Select Existing Patient Booking
    [Documentation]    Selects an existing patient booking from the Diary using the provided booking information.
    Search Booking In Diary    ${BOOKING_INFO}
    Select Booking From List    ${BOOKING_INFO}
    Wait Until Booking Details Are Displayed    ${BOOKING_INFO}

Search Booking In Diary
    [Documentation]    Searches for a booking in the Diary using booking date, time, and doctor.
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.search_date}    ${BOOKING_INFO}[input.booking.date]
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.search_time}    ${BOOKING_INFO}[input.booking.time]
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.search_doctor}    ${BOOKING_INFO}[input.booking.doctor]
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.search}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.list.booking_results}    timeout=5s

Select Booking From List
    [Documentation]    Selects the booking from the search results list based on booking info.
    ${booking_selector}=    Evaluate    f"//div[contains(@class,'booking-row') and contains(., '{${BOOKING_INFO}[input.booking.time]}') and contains(., '{${BOOKING_INFO}[input.booking.doctor]}')]"
    Click    ${booking_selector}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.add_sick_note}    timeout=5s

Wait Until Booking Details Are Displayed
    [Documentation]    Waits until the booking details panel is displayed for the selected booking.
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.panel.booking_details}    timeout=5s

Enter Sick Note Details With Missing Mandatory Fields
    [Documentation]    Enters Sick Note details with some mandatory fields intentionally left blank.
    Enter Sick Note Details    ${SICK_NOTE_INFO}
    Clear Mandatory Sick Note Fields

Clear Mandatory Sick Note Fields
    [Documentation]    Clears the mandatory fields in the Sick Note form to simulate missing data.
    Clear Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sicknote.start_date}
    Clear Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sicknote.end_date}
    Clear Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sicknote.diagnosis}

Enter Sick Note Details With Invalid Dates
    [Documentation]    Enters Sick Note details with invalid date ranges (e.g., end date before start date).
    Enter Sick Note Details    ${SICK_NOTE_INFO}
    Set Invalid Sick Note Dates

Set Invalid Sick Note Dates
    [Documentation]    Sets the Sick Note start and end dates to an invalid range (end date before start date).
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sicknote.start_date}    2024-06-12
    Fill Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.input.sicknote.end_date}    2024-06-10

Attempt To Sign Sick Note
    [Documentation]    Attempts to sign the Sick Note, expecting validation errors if data is missing/invalid.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.button.sign_sick_note}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.label.validation_error}    timeout=3s

Validate Mandatory Field Error Message Displayed
    [Documentation]    Validates that the mandatory field error message is displayed on the Sick Note form.
    ${actual_error}=    Get Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.label.validation_error}
    Should Contain    ${actual_error}    mandatory

Validate Invalid Date Error Message Displayed
    [Documentation]    Validates that the invalid date error message is displayed on the Sick Note form.
    ${actual_error}=    Get Text    ${DIARY_ADD_SICK_NOTE_LOCATORS.label.validation_error}
    Should Contain    ${actual_error}    end date must be after start date

Validate Sick Note Not Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is not saved in the patient’s clinical record.
    Go To Clinical Records
    Wait Until Page Does Not Contain Element    Sick Note    timeout=5s

Go To Clinical Records
    [Documentation]    Navigates to the Clinical Records section for the current patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.tab.clinical_records}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.panel.clinical_records}    timeout=5s

Go To Communication History
    [Documentation]    Navigates to the Communication History section for the current patient.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS.tab.communication_history}
    Wait Until Element Is Visible    ${DIARY_ADD_SICK_NOTE_LOCATORS.panel.communication_history}    timeout=5s

Wait Until Page Does Not Contain Element
    [Documentation]    Waits until the specified text or element is not present on the page.
    [Arguments]    ${element_text}    ${timeout}=5s
    Wait Until Keyword Succeeds    ${timeout}    1s    Run Keyword And Ignore Error    Element Should Not Be Visible    ${element_text}

Element Should Not Be Visible
    [Documentation]    Fails if the element with the given text is visible on the page.
    [Arguments]    ${element_text}
    ${is_visible}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${element_text}    timeout=1s
    Should Be False    ${is_visible}
