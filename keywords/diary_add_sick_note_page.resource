*** Settings ***
Documentation    This resource file contains all keywords for Diary - Add Sick note functionality, including creation, validation, and communication log checks for Sick Notes in the clinical record.
Resource    ../common/super.resource

*** Keywords ***
Select Existing Patient Booking
    [Documentation]    Selects an existing patient booking in the Diary by booking time and debtor name.
    [Arguments]    ${booking_time}    ${debtor_name}
    ${booking_locator}=    Evaluate    "//div[contains(@class,'start') and text()='${booking_time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//div[@class='patient']//div[@class='name']/span[contains(text(),'${debtor_name}')]"
    Wait Until Element Is Visible    locator=${booking_locator}    timeout=${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until    1s

Open Clinical Forms Tab
    [Documentation]    Opens the Clinical Forms tab and selects the Sick Note form from the forms library.
    Wait Until Element Is Visible    locator=${DIARY_ADD_SICK_NOTE_LOCATORS}[select.forms.library]    timeout=${LONG_WAIT}
    Select Options By    ${DIARY_ADD_SICK_NOTE_LOCATORS}[select.forms.library]    label    SICK NOTE
    Wait Until Element Is Visible    locator=${DIARY_ADD_SICK_NOTE_LOCATORS}[button.add.sicknote]    timeout=${LONG_WAIT}
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.add.sicknote]
    Wait Until    1s

Create New Sick Note
    [Documentation]    Initiates the Sick Note form for the selected patient and enters all required data.
    [Arguments]    &{form_data}
    Wait Until Element Is Visible    locator=${DIARY_ADD_SICK_NOTE_LOCATORS}[button.save]    timeout=${LONG_WAIT}
    Enter Sick Note Form Data    &{form_data}

Enter Sick Note Form Data
    [Documentation]    Enters Sick Note form fields dynamically using dictionary keys.
    [Arguments]    ${select_by}=label    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${DIARY_ADD_SICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    ${select_by}    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Save Sick Note
    [Documentation]    Saves the Sick Note form and waits for it to be saved.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.save]    timeout=${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient’s clinical record.
    [Arguments]    ${debtor_name}
    ${clinical_record_locator}=    Evaluate    "//div[contains(@class,'clinical-record')]//span[contains(text(),'${debtor_name}') and contains(text(),'SICK NOTE')]"
    Wait Until Element Is Visible    locator=${clinical_record_locator}    timeout=${LONG_WAIT}
    ${actual_text}=    Get Text    ${clinical_record_locator}
    Should Contain    ${actual_text}    SICK NOTE

Validate Sick Note Communication Logs
    [Documentation]    Validates that Email and Print logs for the Sick Note are recorded in the patient’s communication history.
    [Arguments]    ${debtor_name}
    ${email_log_locator}=    Evaluate    "//div[contains(@class,'communication-history')]//span[contains(text(),'${debtor_name}') and contains(text(),'SICK NOTE') and contains(text(),'Email')]"
    ${print_log_locator}=    Evaluate    "//div[contains(@class,'communication-history')]//span[contains(text(),'${debtor_name}') and contains(text(),'SICK NOTE') and contains(text(),'Print')]"
    Wait Until Element Is Visible    locator=${email_log_locator}    timeout=${LONG_WAIT}
    Wait Until Element Is Visible    locator=${print_log_locator}    timeout=${LONG_WAIT}
    ${email_text}=    Get Text    ${email_log_locator}
    Should Contain    ${email_text}    Email
    ${print_text}=    Get Text    ${print_log_locator}
    Should Contain    ${print_text}    Print

Validate Sick Note QR Code On Printout
    [Documentation]    Validates that the QR Code appears on the Sick Note printout if enabled.
    [Arguments]    ${qr_enabled}
    Run Keyword If    '${qr_enabled}' == 'True'    Print Sick Note And Validate QR Code

Print Sick Note And Validate QR Code
    [Documentation]    Prints the Sick Note and validates the QR Code is present on the printout.
    Click    ${DIARY_ADD_SICK_NOTE_LOCATORS}[button.print]
    Wait Until Element Is Visible    locator=//img[contains(@src,'qrcode')]    timeout=${LONG_WAIT}
    ${qr_code}=    Get Text    //img[contains(@src,'qrcode')]
    Should Contain    ${qr_code}    qrcode
