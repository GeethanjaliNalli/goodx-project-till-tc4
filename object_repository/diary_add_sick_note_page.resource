*** Settings ***
Documentation   This file contains all locators for the Diary Add Sick Note page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.add_sick_note}    xpath=//button[normalize-space(text())="Add Sick Note"]
${input.patient_name}    xpath=//label[normalize-space(text())="Patient Name"]/following-sibling::input
${textarea.medical_details}    xpath=//label[normalize-space(text())="Medical Details"]/following-sibling::textarea
${button.sign_and_save}    xpath=//button[normalize-space(text())="Sign & Save"]
${button.email_print}    xpath=//button[contains(@class,"email-print") and normalize-space(text())="Email/Print"]
