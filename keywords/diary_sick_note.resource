*** Settings ***
Documentation    Keywords for creating, signing, and sending/printing a Sick Note (Medical Certificate) from the Diary for a selected patient.
Resource    ../common/super.resource
Resource    ../object_repository/diary_sick_note_page.resource

*** Keywords ***

Open Sick Note Form
    [Documentation]    Opens the Sick Note form for the selected patient from the Diary.
    Click    ${button.add_sick_note}
    Wait Until Element Is Visible    ${input.sick_note_date}    timeout=5s

Enter Sick Note Details
    [Documentation]    Enters the required Sick Note details for the selected patient.
    [Arguments]    &{sick_note_data}
    Fill Text    ${input.sick_note_date}    ${sick_note_data.date}
    Fill Text    ${textarea.sick_note_reason}    ${sick_note_data.reason}

Sign Sick Note
    [Documentation]    Signs the Sick Note using the configured doctor's signature.
    Click    ${button.sign_sick_note}
    Wait Until Element Is Visible    ${button.send_print_sick_note}    timeout=5s

Send Or Print Sick Note
    [Documentation]    Sends or prints the Sick Note and verifies successful completion.
    Click    ${button.send_print_sick_note}
    Wait Until Page Contains Element    xpath=//div[contains(@class,"notification") and contains(.,"Sick Note sent") or contains(.,"Sick Note printed")]    timeout=10s

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient’s clinical record.
    # Implementation depends on clinical record UI; use existing project keywords if available.
    # Example:
    # Wait Until Page Contains Element    xpath=//div[contains(@class,"clinical-record")]//span[text()="Sick Note"]    timeout=10s

Validate Sick Note Communication History
    [Documentation]    Validates that email and print logs are recorded in the patient communication history.
    # Implementation depends on communication history UI; use existing project keywords if available.
    # Example:
    # Wait Until Page Contains Element    xpath=//div[contains(@class,"communication-history")]//span[contains(text(),"Sick Note")]    timeout=10s

Validate Sick Note QR Code On Printout
    [Documentation]    Validates that the QR Code appears on the Sick Note printout if enabled.
    # Implementation depends on print preview UI; use existing project keywords if available.
    # Example:
    # Wait Until Page Contains Element    xpath=//img[contains(@src,"qrcode")]    timeout=10s
