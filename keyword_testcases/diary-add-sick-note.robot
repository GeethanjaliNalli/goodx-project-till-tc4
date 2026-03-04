*** Settings ***
Documentation    Test suite to validate the creation, signing, emailing, and printing of a Sick Note (Medical Certificate) for a selected patient from the Diary module.
Resource    ../common/super.resource
Test Setup    Login To Application    ${LOGIN_DATA}
Test Teardown    Logout From Application

*** Test Cases ***
TC_06 Validate Sick Note Can Be Created Signed Emailed And Printed For Patient
    [Documentation]    Validates that a practitioner can create, sign, email, and print a Sick Note for a selected patient from the Diary module.
    ...    Ensures all patient, debtor, and sick note details are correctly populated and that the QR code appears if enabled.
    Select Menu In Navigation Wheel    DIARY
    Select Patient In Diary    ${PATIENT_INFO}
    Create And Verify Sick Note    ${PATIENT_INFO}    ${DEBTOR_INFO}    ${SICK_NOTE_FORM_DATA}
    Validate Sick Note Details    ${EXPECTED_DATA}
    Validate Sick Note Email Sent    ${EXPECTED_DATA}[email_sent_to]
    Validate Sick Note Printout Contains QR Code    ${EXPECTED_DATA}[qr_code_present]
