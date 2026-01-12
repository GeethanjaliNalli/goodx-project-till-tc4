*** Settings ***
Documentation    Keywords for creating and verifying a Sick Note (Medical Certificate) for a selected patient in the Diary.
Resource    ../common/super.resource
Resource    ../object_repository/diary_add_sick_note_page.resource

*** Keywords ***

Open Sick Note Form
    [Documentation]    Opens the Sick Note form for the selected patient from the Diary.
    Click    ${button.add_sick_note}
    Wait Until Element Is Visible    ${input.sick_note_date}    timeout=5s

Enter Sick Note Details
    [Documentation]    Enters Sick Note details including date and description.
    [Arguments]    ${date}    ${details}
    Fill Text    ${input.sick_note_date}    ${date}
    Fill Text    ${textarea.sick_note_details}    ${details}

Save Sick Note
    [Documentation]    Saves the Sick Note form.
    Click    ${button.save_sick_note}
    Wait Until Element Is Visible    ${label.sick_note_success}    timeout=10s

Validate Sick Note Saved
    [Documentation]    Validates that the Sick Note is saved and success message is displayed.
    Element Should Be Visible    ${label.sick_note_success}

