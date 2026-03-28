*** Settings ***
Documentation    Test cases to validate creation, signing, sending/printing, and verification of Sick Note (Medical Certificate) for a selected patient in the Diary module.
Resource    ../common/super.resource
Test Setup    Login To Application
Test Teardown    Logout From Application

*** Test Cases ***
TC_01 Validate Sick Note Creation And Verification For Patient
    [Documentation]    Validates that a practitioner can create, sign, send/print, and verify a Sick Note for a patient from the Diary module.
    ...    Ensures the Sick Note is saved in the clinical record, email and print logs are recorded, and QR code appears on printout if enabled.
    Create And Verify Sick Note Workflow    ${EXPECTED_DATA}[patient_name]    &{SICK_NOTE_DATA}
