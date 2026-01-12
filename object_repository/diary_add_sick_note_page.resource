*** Settings ***
Documentation    This file contains all locators for the Diary - Add Sick Note (Medical Certificate) page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.add_sick_note}    xpath=//button[normalize-space(text())="Add Sick Note"]
${input.sick_note_date}    xpath=//label[.//text()="Date of Issue"]//following-sibling::input
${textarea.sick_note_details}    xpath=//label[.//text()="Details"]//following-sibling::textarea
${button.save_sick_note}    xpath=//button[@type="submit" and normalize-space(text())="Save"]
${label.sick_note_success}    xpath=//span[contains(@class,"success") and contains(text(),"Sick Note saved")]
