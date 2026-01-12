*** Settings ***
Documentation    This file contains all locators for the Diary - Add Sick Note page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.add_sick_note}    xpath=//button[normalize-space(text())="Add Sick Note"]
${input.sick_note_date}    css=input.sick-note-date
${textarea.medical_details}    css=textarea.medical-details
${button.sign_and_save}    xpath=//button[normalize-space(text())="Sign & Save"]
${button.print_or_email}    xpath=//button[contains(@class, "print-email") or normalize-space(text())="Print/Email"]
