*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_GRID_LOCATORS}
...    button.new_booking=.btn.new-booking
...    button.available_timeslots=.btn[title="Click here for available booking times"]
...    button.search_debtor_bookings=.btn[title="Search for debtor bookings"]
...    button.print_diary=.print-diary
...    button.procedure_search=.btn[title="Click here to view procedures or ICD10"]
...    input.date_picker=.input-date.selected
...    button.date_backward=.backward
...    button.date_forward=.forward
...    button.reload_bookings=.btn-reload-bookings
...    input.booking_filter=input[placeholder*="Filter bookings"]
...    button.show_active_bookings=.booking-display
...    button.hide_tasks=.btn-primary:contains('Hide Tasks')
...    button.hide_closed_tasks=.btn-primary:contains('Hide Closed Tasks')
...    tab.diary=li.AnyDiaryScreen > a
...    tab.theatre_manager=li.TheaterManagerScreen > a
...    tab.dashboard=li.DashboardScreen > a
...    tab.patient_identifier=li.PatientIdentifierScreen > a
...    tab.clinical_reports=li.ClinicalReportsScreen > a
...    tab.hospital_rounds=li.HospitalRoundListScreen > a
...    tab.inbox=li.InboxScreen > a
...    diary.list=.diary-names .diary
...    diary.selected=.diary.selected
...    diary.name=.diary > span
...    diary.menu=.diary-names .menu
...    diary.dropdown=.diary-names .dropdown-menu
...    diary.type_tab=li.diary-type > t
...    diary.multi_day_tab=li.diary-type:contains('Multi Day View')
...    diary.multi_diary_tab=li.diary-type:contains('Multi Diary View')
...    diary.audit_tab=li.diary-type:contains('Audit Diary')

&{BOOKING_FORM_LOCATORS}
...    div.booking=.booking.ui-draggable.ui-draggable-handle
...    div.booking_selected=.booking.selected
...    div.booking_deleted=.booking.deleted
...    div.time=.time > .start
...    div.date=.date > div
...    div.typestatus=.typestatus
...    div.status=.typestatus > .status
...    div.type=.typestatus > .type
...    div.waiting_time=.waiting-time
...    div.debtor_details=.debtor-details
...    span.debtor_number=.debtor-details .number > span
...    div.debtor_filenumber=.debtor-filenumber
...    icon.debtor_file=div.debtor-filenumber icon.far.fa-file-alt
...    span.debtor_file_number=div.debtor-filenumber span
...    div.location=.location
...    select.location=div.location select.input-xs
...    div.patient=.patient
...    span.patient_name=div.patient .name > span
...    div.patient_details=div.patient .details
...    span.patient_mobile=div.patient .details > span[data-bind*='mobile_no']
...    span.patient_gender=div.patient .details > span t
...    span.patient_age=div.patient .details > span span
...    div.treatingdoc=.treatingdoc
...    div.treatingdoc_name=div.treatingdoc .name
...    div.treatingdoc_details=div.treatingdoc .details
...    div.debtor=.debtor
...    span.debtor_name=div.debtor .name > span
...    div.debtor_details_inner=div.debtor .details
...    div.clinical=div.clinical
...    button.clinical_event=button.btn-clinical-event
...    div.reason=div.reason
...    span.reason=div.reason > span
...    div.summary=div.summary
...    span.qform=span.qform
...    span.clinical_status=span.clinical-status
...    span.document_status=span.document-status
...    button.switch_status=button.btn-switch-status
...    span.invoice_status=span.invoice-status
...    span.account_status=span.account-status
...    span.validation_status=span.validation-status
...    span.verification_done=span.verification-done icon
...    span.verification_pending=span.verification-pending icon
...    span.view_notebook=span.btn-view-notebook
...    icon.view_notebook=span.btn-view-notebook icon

&{PATIENT_DETAILS_LOCATORS}
...    input.patient_search=input.input-sm[placeholder*="Search for Patient"]
...    list.patient_suggestions=ul.patient-suggestions
...    item.patient_suggestion=ul.patient-suggestions li
...    button.patient_clear=button.clear-patient
...    span.patient_summary_name=.patient-summary-component .fullname span
...    span.patient_summary_dob=.patient-summary-component .date-of-birth span:nth-of-type(2)
...    span.patient_summary_file_no=.patient-summary-component .debtor-file-no span:nth-of-type(2)
...    span.patient_summary_id_no=.patient-summary-component .id-no span:nth-of-type(2)
...    span.patient_summary_mobile_no=.patient-summary-component .mobile-no span:nth-of-type(2)
...    span.patient_summary_email=.patient-summary-component .email span:nth-of-type(2)
...    span.patient_summary_medical_aid=.patient-summary-component .medical-aid span:nth-of-type(2)
...    img.patient_summary_picture=.patient-summary-component .picture img

&{DEBTOR_DETAILS_LOCATORS}
...    span.debtor_account_identifier=.debtor-details .number span
...    icon.debtor_status=.debtor-details .status icon
...    div.debtor_filenumber=div.debtor-filenumber
...    icon.debtor_file=div.debtor-filenumber icon.far.fa-file-alt
...    span.debtor_file_number=div.debtor-filenumber span
...    span.debtor_name=div.debtor .name span
...    span.debtor_medical_aid=div.debtor .details span[data-bind*='medical_aid_no']
...    span.debtor_medical_aid_option=div.debtor .details span[data-bind*='medical_aid_option']
...    span.debtor_medical_aid_claim=div.debtor .details span[data-bind*='iod_claim_no']
...    span.debtor_medical_aid_hidden=div.debtor .details span[data-bind*='hidden']

&{CLINICAL_FORMS_LOCATORS}
...    select.forms_library=select.event-type.mb20
...    option.sick_note=select.event-type.mb20 option:contains('SICK NOTE')
...    button.add_form=button:contains('Add')
...    div.active_forms=div.col-sm-12.btn-group.active-event
...    button.active_form_description=button.description
...    button.active_form_copy=button.btn-warning:contains('Copy')
...    button.active_form_delete=button.btn-danger
...    button.complete_form=button.btn-finalize
...    button.email_form=button[title*='Email']
...    button.fax_form=button[title*='Fax']
...    button.print_form=button.btn-print
...    button.download_form=button:contains('Download')
...    button.expand_all=button:contains('Expand All')
...    button.collapse_all=button:contains('Collapse All')
...    button.save_and_close=button.btn-save span:contains('Save and Close')
...    button.save=button.btn-save-list:contains('Save')

&{WARNING_ALERT_LOCATORS}
...    div.warning_timezone=div.error span[data-bind*='Intl.DateTimeFormat']
...    div.warning_message=div.error
...    div.notices=div.notices.screen-section
...    div.toast=div.toasts
...    div.toast_more=div.toasts .more

${button.close}    .pull-left.btn-close
${button.patient_dashboard}    button.btn-patient-dashboard
${button.debtor_edit}    button.btn-debtor-edit
${button.patient_file}    button.btn-clinical-history
${button.account_details}    button.btn-account-details
${button.invoice}    button.invoice
${button.clinical}    button.clinical
${button.receipt}    button.btn-receipt
${button.telemed}    button:contains('Telemed')
${button.new_hospital_case}    button.btn-new-hospital-case
${button.print_booking_label}    button:contains('Print Booking Label')
${button.sms}    button.btn-sms
${button.whatsapp}    button.btn-whatsapp
${button.dial}    button:contains('Dial')
${button.email}    button.btn-email
${button.send_payment_request}    button[title='Send a payment request']
${button.add_documents}    button:contains('Add Documents')
${button.add_appointment}    button:contains('Add Appointment')
${button.download_invoice}    button:contains('Download Invoice')
${button.email_invoice}    button:contains('Email Invoice')
${button.download_receipt}    button:contains('Download Receipt')
${button.email_receipt}    button:contains('Email Receipt')
${button.download_statement}    button:contains('Download Statement')
${button.advanced_statement}    button:contains('Advanced Statement')
${button.email_audit_statement}    button:contains('Email Audit Statement')
${button.download_audit_statement}    button:contains('Download Audit Statement')
${button.email_statement}    button:contains('Email Statement')
${button.harmony_launcher}    button[data-bind*='HarmonyViewLauncher']
${button.harmony_study_archive_view}    button[data-bind*='study_archive_view']
${button.harmony_image_viewer}    button[data-bind*='image_viewer_timeline']
${button.harmony_new_examination}    button[data-bind*='new_examination']
${button.harmony_new_report}    button[data-bind*='new_report']
${button.verify_patient}    button[data-bind*='VerifyBookingPatient']
${button.create_recording}    button:contains('Create Recording')
${button.stop_recording}    button:contains('Stop Recording')
${button.save_and_close}    button.btn-save span:contains('Save and Close')
${button.save}    button.btn-save-list:contains('Save')
