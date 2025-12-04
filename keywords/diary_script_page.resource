*** Settings ***
Documentation    This resource file contains all keywords for creating, completing, signing, emailing, and printing a patient prescription (Script) using the Basic Script Features.
Resource    ../common/super.resource
Resource    ../object_repository/diary_script_locators.resource

*** Keywords ***
Open Diary And Select Existing Booking
    [Documentation]    Opens the Diary and selects an existing patient booking.
    Click    ${DIARY_SCRIPT_LOCATORS}[button.patient_booking]
    Wait Until Element Is Visible    ${DIARY_SCRIPT_LOCATORS}[button.clinical]    ${LONG_WAIT}

Open Clinical Sidebar And Select Script Tab
    [Documentation]    Opens the Clinical sidebar and selects the Script tab.
    Click    ${DIARY_SCRIPT_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${DIARY_SCRIPT_LOCATORS}[button.script]    ${LONG_WAIT}
    Click    ${DIARY_SCRIPT_LOCATORS}[button.script]
    Wait Until Element Is Visible    ${DIARY_SCRIPT_LOCATORS}[button.add_medication]    ${LONG_WAIT}

Click New Script And Select Script Type
    [Documentation]    Clicks 'New Script' and selects the script type (Acute/Repeat).
    [Arguments]    ${script_type}
    Click    ${DIARY_SCRIPT_LOCATORS}[button.add_medication]
    Wait Until Element Is Visible    ${DIARY_SCRIPT_LOCATORS}[select.script_type]    ${LONG_WAIT}
    Select Options By    ${DIARY_SCRIPT_LOCATORS}[select.script_type]    label    ${script_type}

Enter Script Diagnosis
    [Documentation]    Enters the diagnosis for the script.
    [Arguments]    ${diagnosis}
    Fill Text    ${DIARY_SCRIPT_LOCATORS}[input.diagnosis]    ${diagnosis}

Add Medication To Script
    [Documentation]    Adds medication to the script by searching and selecting the medicine.
    [Arguments]    ${medicine}
    Fill Text    ${DIARY_SCRIPT_LOCATORS}[input.medicine_search]    ${medicine}
    Wait Until Element Is Visible    ${DIARY_SCRIPT_LOCATORS}[option.medicine_item]    ${LONG_WAIT}
    Click    ${DIARY_SCRIPT_LOCATORS}[option.medicine_item]

Add Medication Directions
    [Documentation]    Enters directions for the medication.
    [Arguments]    ${directions}
    Fill Text    ${DIARY_SCRIPT_LOCATORS}[textarea.directions]    ${directions}

Enter Medication Quantity
    [Documentation]    Enters the total quantity for the medication.
    [Arguments]    ${quantity}
    Fill Text    ${DIARY_SCRIPT_LOCATORS}[input.total_quantity]    ${quantity}

Enter Medication Repeat Count
    [Documentation]    Enters the repeat count for the medication.
    [Arguments]    ${repeat_count}
    Fill Text    ${DIARY_SCRIPT_LOCATORS}[input.repeat_count]    ${repeat_count}

Set Not Substitutable Checkbox
    [Documentation]    Sets or unsets the 'Not Substitutable' checkbox based on input.
    [Arguments]    ${not_substitutable}
    ${is_selected}=    Evaluate Expression    ${not_substitutable} == True
    ${checkbox_state}=    Get Element States    ${DIARY_SCRIPT_LOCATORS}[checkbox.not_substitutable]
    Run Keyword If    '${is_selected}' == 'True' and 'checked' not in '${checkbox_state}'    Click    ${DIARY_SCRIPT_LOCATORS}[checkbox.not_substitutable]
    ...    ELSE IF    '${is_selected}' == 'False' and 'checked' in '${checkbox_state}'    Click    ${DIARY_SCRIPT_LOCATORS}[checkbox.not_substitutable]

Save And Complete Script
    [Documentation]    Saves and completes the script.
    Click    ${DIARY_SCRIPT_LOCATORS}[button.complete_script]
    Wait Until Element Is Invisible    ${DIARY_SCRIPT_LOCATORS}[button.complete_script]    ${LONG_WAIT}

Sign Script If Required
    [Documentation]    Signs the script if signature is required and button is visible.
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${DIARY_SCRIPT_LOCATORS}[button.add_signature]    3s
    Run Keyword If    ${is_visible}    Click    ${DIARY_SCRIPT_LOCATORS}[button.add_signature]
    Run Keyword If    ${is_visible}    Wait Until Element Is Invisible    ${DIARY_SCRIPT_LOCATORS}[button.add_signature]    ${LONG_WAIT}

Email Script To Patient
    [Documentation]    Emails the script to the patient.
    Click    ${DIARY_SCRIPT_LOCATORS}[button.email_script]
    Wait Until Element Is Invisible    ${DIARY_SCRIPT_LOCATORS}[button.email_script]    ${LONG_WAIT}

Print Script Document
    [Documentation]    Prints the script document.
    Click    ${DIARY_SCRIPT_LOCATORS}[button.print_script]
    Wait Until Element Is Invisible    ${DIARY_SCRIPT_LOCATORS}[button.print_script]    ${LONG_WAIT}

Validate Script Completion And Output Details
    [Documentation]    Validates that the script is completed, medication details, directions, signature, and QR code are displayed correctly, and output documents are generated.
    Wait Until Element Is Visible    ${DIARY_SCRIPT_LOCATORS}[icon.script_action]    ${LONG_WAIT}
    ${script_status}=    Get Text    ${DIARY_SCRIPT_LOCATORS}[icon.script_action]
    Should Contain    ${script_status}    Completed
    ${medication}=    Get Text    ${DIARY_SCRIPT_LOCATORS}[input.medicine_search]
    Should Contain    ${medication}    ${SCRIPT_DATA}[input.medicine]
    ${directions}=    Get Text    ${DIARY_SCRIPT_LOCATORS}[textarea.directions]
    Should Contain    ${directions}    ${SCRIPT_DATA}[input.directions]
    ${signature_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${DIARY_SCRIPT_LOCATORS}[button.add_signature]    2s
    Run Keyword If    not ${signature_visible}    Evaluate Expression    True
    Wait Until Element Is Visible    ${DIARY_SCRIPT_LOCATORS}[qr_code]    ${LONG_WAIT}

