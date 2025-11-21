*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{SICK_NOTE_LOCATORS}
    ...    button.open_clinical_forms=//button[@id='openClinicalForms']
    ...    input.sick_note_reason=//textarea[@id='sickNoteReason']
    ...    button.sign_sick_note=//button[@id='signSickNote']
    ...    button.send_email=//button[@id='sendSickNoteEmail']
    ...    button.print_sick_note=//button[@id='printSickNote']
