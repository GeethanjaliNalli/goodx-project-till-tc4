*** Settings ***
Documentation       This file contains the locators for the Sick Note (Medical Certificate) page used in Diary - Add Sick note.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{SICK_NOTE_PAGE_LOCATORS}
...    input.treatment_date=//label[t[contains(text(),'Date of Treatment')]]/following-sibling::div//input[@type='text']
...    input.absent_from=//label[t[contains(text(),'Absent From')]]/following-sibling::div//input[@type='text']
...    input.absent_to=//label[t[contains(text(),'Absent To')]]/following-sibling::div//input[@type='text']
...    input.total_days_absent=//label[t[contains(text(),'Total Days Absent')]]/following-sibling::div//input[@type='number' or @type='text']
...    input.follow_up_date=//label[t[contains(text(),'Follow Up Date')]]/following-sibling::div//input[@type='text']
...    input.light_duty_start=//label[t[contains(text(),'Light Duty Start')]]/following-sibling::div//input[@type='text']
...    textarea.comments=//label[t[contains(text(),'Comments')]]/following-sibling::div//textarea
...    input.icd10_search=//label[t[contains(text(),'ICD10') or contains(text(),'ICD-10')]]/following-sibling::div//input[@type='text']
...    upload.pdf.file=//label[t[contains(text(),'Upload') or contains(text(),'Attach')]]/following-sibling::div//input[@type='file' and contains(@accept, 'pdf')]
...    button.save=//button[contains(@class, 'btn-save') or .//t[text()='Save']]
...    button.print=//button[contains(@class, 'btn-print') or .//t[text()='Print']]
...    button.sign=//button[contains(@class, 'btn-sign') or .//t[contains(text(),'Sign')]]
...    button.email=//button[contains(@class, 'btn-email') or .//t[contains(text(),'Email')]]

# Standalone locators (if needed)
${select.icd10_dropdown}    //div[contains(@class, 'icd10-dropdown')]//ul/li[contains(., '${input.icd10_search}')]
