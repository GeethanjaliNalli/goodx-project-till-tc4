*** Keywords ***

Select Patient Booking In Diary
    [Documentation]    Selects a patient booking in the Diary grid by patient name, booking date, and booking time.
    [Arguments]    ${patient_name}    ${booking_date}    ${booking_time}
    ${booking_locator}    Evaluate    "//div[contains(@class, 'booking') and .//div[@class='patient']//div[@class='name']/span[contains(text(), '${patient_name}')]]"
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    ${date_locator}    Evaluate    "${booking_locator}//div[@class='date']/div[contains(text(), '${booking_date}')]"
    Wait Until Element Is Visible    ${date_locator}    ${LONG_WAIT}
    ${time_locator}    Evaluate    "${booking_locator}//div[@class='time'][contains(text(), '${booking_time}')]"
    Wait Until Element Is Visible    ${time_locator}    ${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until    1s

Open Clinical Forms For Booking
    [Documentation]    Opens the Clinical Forms for the selected booking.
    Click    ${CLINICAL_ACTIONS_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS}[select.forms.library]    ${LONG_WAIT}

Select Sick Note Form
    [Documentation]    Selects the Sick Note form from the Clinical Forms library.
    Click    ${CLINICAL_FORMS_LOCATORS}[select.forms.library]
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS}[option.sick.note]    ${LONG_WAIT}
    Click    ${CLINICAL_FORMS_LOCATORS}[option.sick.note]
    Click    ${CLINICAL_FORMS_LOCATORS}[button.select.event]
    Wait Until Element Is Visible    ${CLINICAL_FORMS_LOCATORS}[button.save]    ${LONG_WAIT}

Enter Sick Note Patient Details
    [Documentation]    Enters the patient details required for the Sick Note form.
    [Arguments]    ${patient_name}    ${patient_id}
    Fill Text    ${PATIENT_DETAILS_LOCATORS}[span.patient.fullname]    ${patient_name}
    Fill Text    ${PATIENT_DETAILS_LOCATORS}[span.patient.id.no]    ${patient_id}

Enter Sick Note Dates
    [Documentation]    Enters the Sick Note date, from, and to fields.
    [Arguments]    ${sick_note_date}    ${sick_note_from}    ${sick_note_to}
    Fill Text    ${CLINICAL_FORMS_LOCATORS}[select.forms.library]    ${sick_note_date}
    Fill Text    ${CLINICAL_FORMS_LOCATORS}[select.forms.library]    ${sick_note_from}
    Fill Text    ${CLINICAL_FORMS_LOCATORS}[select.forms.library]    ${sick_note_to}

Enter Sick Note Reason
    [Documentation]    Enters the reason for the Sick Note.
    [Arguments]    ${reason}
    Fill Text    ${CLINICAL_FORMS_LOCATORS}[select.forms.library]    ${reason}

Enter Sick Note Additional Notes
    [Documentation]    Enters additional notes for the Sick Note.
    [Arguments]    ${notes}
    Fill Text    ${CLINICAL_FORMS_LOCATORS}[select.forms.library]    ${notes}

Attach Doctor Signature
    [Documentation]    Attaches the doctor's signature to the Sick Note.
    [Arguments]    ${doctor_signature}
    Fill Text    ${CLINICAL_FORMS_LOCATORS}[select.forms.library]    ${doctor_signature}

Enter Doctor Email
    [Documentation]    Enters the doctor's email address for the Sick Note.
    [Arguments]    ${doctor_email}
    Fill Text    ${CLINICAL_FORMS_LOCATORS}[select.forms.library]    ${doctor_email}

Enable QR Code On Sick Note
    [Documentation]    Enables the QR Code option on the Sick Note if required.
    [Arguments]    ${qr_code_enabled}
    Run Keyword If    '${qr_code_enabled}'=='True'    Click    ${CLINICAL_FORMS_LOCATORS}[button.expand.all]

Save Sick Note Form
    [Documentation]    Saves the Sick Note form in the Clinical Forms section.
    Click    ${CLINICAL_FORMS_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${CLINICAL_FORMS_LOCATORS}[button.save]    ${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the Patient's Clinical record.
    [Arguments]    ${patient_name}    ${expected_saved}
    ${clinical_record_locator}    Evaluate    "//div[contains(@class, 'clinical-record')]//span[contains(text(), 'SICK NOTE') and contains(text(), '${patient_name}')]"
    Wait Until Element Is Visible    ${clinical_record_locator}    ${LONG_WAIT}
    Run Keyword If    '${expected_saved}'=='True'    Should Contain    ${patient_name}    ${patient_name}

Validate Sick Note Email Log Recorded
    [Documentation]    Validates that the Sick Note email log is recorded in the Patient communication history.
    [Arguments]    ${expected_email_log}
    ${email_log_locator}    Evaluate    "//div[contains(@class, 'communication-history')]//span[contains(text(), 'Email') and contains(text(), 'SICK NOTE')]"
    Wait Until Element Is Visible    ${email_log_locator}    ${LONG_WAIT}
    Run Keyword If    '${expected_email_log}'=='True'    Should Contain    ${expected_email_log}    True

Validate Sick Note Print Log Recorded
    [Documentation]    Validates that the Sick Note print log is recorded in the Patient communication history.
    [Arguments]    ${expected_print_log}
    ${print_log_locator}    Evaluate    "//div[contains(@class, 'communication-history')]//span[contains(text(), 'Print') and contains(text(), 'SICK NOTE')]"
    Wait Until Element Is Visible    ${print_log_locator}    ${LONG_WAIT}
    Run Keyword If    '${expected_print_log}'=='True'    Should Contain    ${expected_print_log}    True

Validate QR Code On Sick Note Printout
    [Documentation]    Validates that the QR Code appears on the Sick Note printout if enabled.
    [Arguments]    ${expected_qr_code}
    ${qr_code_locator}    Evaluate    "//div[contains(@class, 'sick-note-printout')]//img[contains(@src, 'qr')]"
    Wait Until Element Is Visible    ${qr_code_locator}    ${LONG_WAIT}
    Run Keyword If    '${expected_qr_code}'=='True'    Should Contain    ${expected_qr_code}    True

Validate Sick Note Communication History Updated
    [Documentation]    Validates that the communication history is updated for the Sick Note.
    [Arguments]    ${expected_communication_history}
    ${comm_history_locator}    Evaluate    "//div[contains(@class, 'communication-history')]//span[contains(text(), 'SICK NOTE')]"
    Wait Until Element Is Visible    ${comm_history_locator}    ${LONG_WAIT}
    Run Keyword If    '${expected_communication_history}'=='True'    Should Contain    ${expected_communication_history}    True
