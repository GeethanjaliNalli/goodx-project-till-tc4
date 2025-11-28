*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{DIARY_NAVIGATION_LOCATORS}
...    button.new_booking=button.new-booking
...    button.new_task=button.new-task
...    button.new_operation=button.new-operation
...    button.reload_bookings=button.btn-reload-bookings
...    button.previous_date=button.backward
...    button.next_date=button.forward
...    button.today=button.today
...    input.filter_bookings=input[placeholder="Filter bookings ..."]
...    select.entity_dropdown=a.entity
...    select.diary_dropdown=span[data-bind*="selectedSubscreen"]
...    select.diary_types_dropdown=span[data-bind*="Diary Types"]
...    button.display_options=span[data-bind*='Display Options']
...    button.render_policies=span[data-bind*='Render Policies']
...    button.print_diary=button.print-diary
...    button.search_debtor_bookings=button[title='Search for debtor bookings']
...    button.available_booking_times=button[title='Click here for available booking times']
...    button.procedure_search=button[title='Click here to view procedures or ICD10']
...    button.logout=a.logout
...    button.settings=a.settings
...    button.about=a.about
...    input.search_entity=input[placeholder="Search for Entity ..."]

&{DIARY_GRID_LOCATORS}
...    div.timeslot=div.timeslot
...    div.timeslot_time=div.timeslot .time
...    div.booking=div.booking
...    div.booking_selected=div.booking.selected
...    button.booking_switch_status=button.btn-switch-status
...    span.booking_status=div.typestatus > div.status
...    span.booking_type=div.typestatus > div.type
...    span.booking_reason=div.reason > span
...    span.booking_date=div.date > div
...    span.booking_time_start=div.time > div.start
...    span.booking_time_end=div.time > div:nth-of-type(2)
...    span.booking_patient_name=div.patient > div.name > span
...    span.booking_patient_details=div.patient > div.details
...    span.booking_debtor_number=div.debtor-details > div.number > span
...    span.booking_debtor_file_number=div.debtor-filenumber > span
...    select.booking_location=div.location select
...    span.booking_treating_doctor=div.treatingdoc > div.details
...    span.booking_verification_pending=span.verification-pending
...    span.booking_view_notebook=span.btn-view-notebook
...    span.booking_invoice_status=span.invoice-status
...    span.booking_account_status=span.account-status
...    span.booking_validation_status=span.validation-status
...    span.booking_document_status=span.document-status
...    span.booking_clinical_status=span.clinical-status
...    span.booking_qform=span.qform
...    div.booking_summary=div.summary
...    div.booking_warning=div.warning
...    button.booking_advance_status=button.btn-advance-status
...    button.booking_patient_dashboard=button.btn-patient-dashboard
...    button.booking_debtor_edit=button.btn-debtor-edit
...    button.booking_clinical_history=button.btn-clinical-history
...    button.booking_account_details=button.btn-account-details
...    button.booking_invoice=button.invoice
...    button.booking_clinical=button.clinical
...    button.booking_receipt=button.btn-receipt
...    button.booking_new_hospital_case=button.btn-new-hospital-case
...    button.booking_view_all_cases=button.btn-warning
...    button.booking_print_label=button:contains('Print Booking Label')
...    button.booking_sms=button.btn-sms
...    button.booking_whatsapp=button.btn-whatsapp
...    button.booking_email=button.btn-email
...    button.booking_dial=button:contains('Dial')
...    button.booking_request_payment=button:contains('Send a payment request')
...    button.booking_upload_documents=button:contains('Add Documents')
...    button.booking_add_appointment=button:contains('Add Appointment')
...    button.booking_download_invoice=button:contains('Download Invoice')
...    button.booking_download_receipt=button:contains('Download Receipt')
...    button.booking_download_statement=button:contains('Download Statement')

&{PATIENT_DETAILS_LOCATORS}
...    div.patient_summary=div.patient-summary-component
...    span.patient_fullname=div.fullname > span
...    span.patient_dob=div.date-of-birth > span:nth-of-type(2)
...    span.patient_file_no=div.file-no > span:nth-of-type(2)
...    span.patient_debtor_file_no=div.debtor-file-no > span:nth-of-type(2)
...    span.patient_id_no=div.id-no > span:nth-of-type(2)
...    span.patient_mobile_no=div.mobile-no > span:nth-of-type(2)
...    span.patient_email=div.email > span:nth-of-type(2)
...    span.patient_medical_aid=div.medical-aid > span:nth-of-type(2)
...    img.patient_picture=div.picture > img
...    div.patient_tags=div.tags

&{DEBTOR_DETAILS_LOCATORS}
...    span.debtor_name=div.debtor > div.name > span
...    span.debtor_details=div.debtor > div.details
...    span.debtor_medical_aid=div.debtor > div.details > span
...    span.debtor_file_number=div.debtor-filenumber > span
...    span.debtor_account_identifier=div.debtor-details > div.number > span
...    span.debtor_status=div.debtor-details > div.status

&{QUICKNOTE_EVENT_LOCATORS}
...    input.template_name=input.template-name
...    select.event_class=select.event-class
...    input.treatment_date=input.treatment-date
...    textarea.note=textarea.styledTextarea.note
...    input.pdf_file=input[type='file']
...    button.add_image=button[data-bind*='onAddImageClick']
...    button.add_voice_recording=button[data-bind*='onNewVoiceNoteClick']
...    button.complete=button.btn-finalize
...    button.save=button.btn-save
...    button.close=button.btn-close
...    button.print=button.btn-print
...    button.expand_all=button[data-bind*='ExpandAll']
...    button.email=button[data-bind*='EmailPdf']
...    button.fax=button[data-bind*='FaxPdf']
...    button.stop_recording=button[data-bind*='StopConsultationRecording']
...    button.lock=button[data-bind*='Lock']
...    button.dropdown_toggle=button.dropdown-toggle
...    input.template_search=.template-dropdown-menu input
...    ul.template_dropdown_menu=ul.template-dropdown-menu
...    li.template_option=ul.template-dropdown-menu li
...    span.selected_patient=span.selected-patient
...    span.treating_doctor=span[data-bind*='treating_doctor']
...    button.add_case=button.add-case
...    button.edit_case=button.edit-case
...    select.case_selector=div.case-selector select
...    img.profile_picture=img.portrait
...    div.warning_message=div.warning span
...    button.quick_access_sticker=button[data-bind*='Dama']
...    button.quick_access_patient_dashboard=button[data-bind*='PatientDashboard']
...    button.quick_access_story_mode=button[data-bind*='StoryMode']
...    button.quick_access_openeyes=button[data-bind*='OpenEyesViewLauncher']
...    button.quick_access_emguidance=button[data-bind*='EMGuidanceViewLauncher']

&{DIARY_TAB_LOCATORS}
...    tab.invoice_details=li.invoice
...    tab.clinical=li.clinical.active
...    tab.appointment=li.tab.active
...    tab.add_booking=li.add-booking a
...    tab.post_all=button.post-all
...    tab.clinical_history=li.clinical-history
...    tab.medical_history=li.medical-history
...    tab.booking_history=li.booking-history
...    tab.switch_details=li.switch-details
...    tab.periodontal_chart=li.periodontal-chart
...    tab.mouth_diagnosis=li.mouth-diagnosis

${button.save_and_close}    button.btn-save
${button.close}    .pull-left.btn-close
${button.complete}    button.btn-finalize
${button.add_image}    button[data-bind*='onAddImageClick']
${button.add_voice_recording}    button[data-bind*='onNewVoiceNoteClick']
${button.print}    button.btn-print
${button.expand_all}    button[data-bind*='ExpandAll']
${button.email}    button[data-bind*='EmailPdf']
${button.fax}    button[data-bind*='FaxPdf']
${button.lock}    button[data-bind*='Lock']
${button.stop_recording}    button[data-bind*='StopConsultationRecording']
${input.note_textarea}    textarea.styledTextarea.note
${input.template_name}    input.template-name
${input.treatment_date}    input.treatment-date
${input.pdf_file}    input[type='file']
${select.event_class}    select.event-class
${select.case_selector}    div.case-selector select
${img.profile_picture}    img.portrait
${span.selected_patient}    span.selected-patient
${span.treating_doctor}    span[data-bind*='treating_doctor']
${div.warning_message}    div.warning span
${ul.template_dropdown_menu}    ul.template-dropdown-menu
${li.template_option}    ul.template-dropdown-menu li
