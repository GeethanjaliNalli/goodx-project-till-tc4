*** Settings ***
Documentation    This file contains all locators for the Diary Sick Note (Medical Certificate) page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.add_sick_note}    xpath=//button[normalize-space(text())="Add Sick Note"]
${input.sick_note_date}    css=input.sick-note-date
${textarea.sick_note_reason}    css=textarea.sick-note-reason
${button.sign_sick_note}    xpath=//button[normalize-space(text())="Sign"]
${button.send_print_sick_note}    xpath=//button[normalize-space(text())="Send/Print"]
