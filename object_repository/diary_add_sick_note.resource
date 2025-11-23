*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{DIARY_ADD_SICK_NOTE_LOCATORS}
    ...    button.open_diary=css:button#open-diary
    ...    input.patient_search=css:input#patient-search
    ...    button.select_patient=css:button#select-patient
    ...    button.add_sick_note=css:button#add-sick-note
    ...    input.sick_note_reason=css:input#sick-note-reason
    ...    select.sick_note_duration=css:select#sick-note-duration
    ...    input.sick_note_start_date=css:input#sick-note-start-date
    ...    input.sick_note_end_date=css:input#sick-note-end-date
    ...    checkbox.sick_note_fit_for_work=css:input#fit-for-work
    ...    button.sign=css:button#sign-sick-note
    ...    icon.signature_applied=css:span.signature-applied
    ...    button.send_or_print=css:button#send-or-print
    ...    modal.sending=css:div#sending-modal
    ...    tab.clinical_record=css:a#tab-clinical-record
    ...    row.sick_note_entry=css:tr.sick-note-entry
    ...    tab.communication_history=css:a#tab-communication-history
    ...    row.sick_note_email_log=css:tr.sick-note-email-log
    ...    row.sick_note_print_log=css:tr.sick-note-print-log
    ...    button.print_preview=css:button#print-preview
    ...    img.qr_code=css:img.qr-code
