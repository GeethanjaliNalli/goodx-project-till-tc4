*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{DIARY_GRID_LOCATORS}
...    button.new_booking=.btn.new-booking
...    button.available_booking_times=.btn[title="Click here for available booking times"]
...    button.search_debtor_bookings=.btn[title="Search for debtor bookings"]
...    button.print_diary=.print-diary
...    button.view_procedures=.btn[title="Click here to view procedures or ICD10"]
...    input.filter_bookings=input[placeholder*="Filter bookings"]
...    button.backward_date=.btn.backward
...    input.selected_date=input.input-date.selected
...    button.today_date=.btn.today
...    button.forward_date=.btn.forward
...    button.reload_bookings=.btn-reload-bookings
...    select.diary_type=ul.diary-types li.diary-type.selected
...    select.display_option=ul.display-options li.display-option
...    button.show_active_bookings=button.booking-display
...    button.hide_tasks=button.btn-primary[processEvent*='ShowHideTasks']
...    button.hide_closed_tasks=button.btn-primary[processEvent*='ShowHideClosedTasks']
...    table.diary=table.table-striped
...    table.diary.header=table.table-striped thead tr
...    table.diary.row=table.table-striped tbody tr
...    div.timeslot=div.timeslot
...    div.timeslot.time=div.timeslot div.time
...    div.booking_item=div.booking.ui-draggable
...    div.booking_item_deleted=div.booking.ui-draggable.deleted
...    div.booking_item_selected=div.booking.ui-draggable.selected
...    span.booking_status=div.typestatus div.status
...    span.booking_type=div.typestatus div.type
...    span.waiting_time=div.waiting-time div
...    button.switch_status=button.btn-switch-status
...    span.invoice_status=span.invoice-status
...    span.account_status=span.account-status
...    span.validation_status=span.validation-status
...    span.qform_status=span.qform
...    span.clinical_status=span.clinical-status
...    span.document_status=span.document-status
...    span.verification_done=span.verification-done icon
...    span.verification_pending=span.verification-pending icon
...    span.view_notebook=span.btn-view-notebook
...    div.summary=div.summary
...    button.timeslot_history=button[title='view_timeslot_history']

&{BOOKING_FORM_LOCATORS}
...    select.location=div.location select.input-xs
...    input.booking_reason=div.reason span
...    button.clinical_event=button.btn-clinical-event
...    button.account_details=button.btn-account-details
...    button.invoice=button.invoice
...    button.clinical=button.clinical
...    button.receipt=button.btn-receipt
...    button.telemed=button[processEvent*='BookingTelemed']
...    button.new_hospital_case=button.btn-new-hospital-case
...    button.view_hospital_case=button.btn-view-hospital-case
...    button.print_booking_label=button[processEvent*='PrintLabel']
...    button.import_mygc=button[processEvent*='ImportGC']
...    button.sms=button.btn-sms
...    button.whatsapp=button.btn-whatsapp
...    button.dial=button[processEvent*='Dial']
...    button.email=button.btn-email
...    button.request_payment=button[processEvent*='RequestPayment']
...    button.upload_documents=button[processEvent*='UploadDocuments']
...    button.add_appointment=button[processEvent*='AddAppointment']
...    button.download_invoice=button[processEvent*='DownloadInvoice']
...    button.download_receipt=button[processEvent*='DownloadReceipt']
...    button.download_statement=button[processEvent*='Statement']

&{PATIENT_DETAILS_LOCATORS}
...    div.patient_name=div.patient div.name span
...    div.patient_details=div.patient div.details
...    span.patient_mobile=div.patient div.details span:nth-of-type(1)
...    span.patient_gender=div.patient div.details span:contains('Male'), div.patient div.details span:contains('Female')
...    span.patient_age=div.patient div.details span:contains('Age') + span
...    icon.patient_gender=div.patient div.details icon
...    div.patient_debtor_name=div.debtor div.name span
...    div.patient_debtor_details=div.debtor div.details span
...    span.patient_debtor_medical_aid=div.debtor div.details span:nth-of-type(2)

&{DEBTOR_DETAILS_LOCATORS}
...    div.debtor_number=div.debtor-details div.number span
...    div.debtor_file_number=div.debtor-filenumber span
...    div.debtor_status=div.debtor-details .status icon
...    div.debtor_name=div.debtor div.name span
...    div.debtor_details=div.debtor div.details span
...    span.debtor_medical_aid=div.debtor div.details span:nth-of-type(2)

&{PRACTITIONER_DETAILS_LOCATORS}
...    div.treatingdoc_name=div.treatingdoc div.name
...    div.treatingdoc_details=div.treatingdoc div.details
...    span.treatingdoc_icon=div.treatingdoc icon

&{FORM_LIBRARY_LOCATORS}
...    select.forms_library=select.form-control.event-type
...    option.sick_note=select.form-control.event-type option:contains('SICK NOTE')
...    button.add_form=button[processEvent*='AddForm']
...    button.copy_form=button.btn-warning
...    button.delete_form=button.btn-danger
...    button.complete_form=button.btn-finalize
...    button.lock_form=button.btn-warning[processEvent*='Lock']
...    button.print_form=button.btn-print
...    button.expand_all=button.btn-success[processEvent*='ExpandAll']

&{WARNING_ALERT_LOCATORS}
...    div.warning_timezone=div.header .error
...    div.warning_message=div.notices.screen-section
...    span.warning_icon=div.warning icon

&{DIALOG_LOCATORS}
...    dialog.main_dialog=.ui-dialog-content
...    span.dialog_title=.ui-dialog-title
...    button.dialog_close=.btn-close

&{AUTOCOMPLETE_LOCATORS}
...    input.search_debtor=input.input-sm[name*='debtor']
...    ul.suggestions=ul.ui-autocomplete
...    li.suggestion_item=ul.ui-autocomplete li.ui-menu-item
...    button.clear_search=button[title*='Clear']

# Standalone locators
${button.save}    button.btn-save
${button.save_and_close}    button.btn-save[processEvent*='Save']
${button.close}    .pull-left.btn-close
${button.expand_all}    button.btn-success[processEvent*='ExpandAll']
${button.complete_form}    button.btn-finalize
${button.lock_form}    button.btn-warning[processEvent*='Lock']
${button.print_form}    button.btn-print
${button.add_form}    button[processEvent*='AddForm']
${button.copy_form}    button.btn-warning
${button.delete_form}    button.btn-danger
${button.request_payment}    button[processEvent*='RequestPayment']
${button.upload_documents}    button[processEvent*='UploadDocuments']
${button.add_appointment}    button[processEvent*='AddAppointment']
${button.download_invoice}    button[processEvent*='DownloadInvoice']
${button.download_receipt}    button[processEvent*='DownloadReceipt']
${button.download_statement}    button[processEvent*='Statement']
${button.email}    button.btn-email
${button.sms}    button.btn-sms
${button.whatsapp}    button.btn-whatsapp
${button.dial}    button[processEvent*='Dial']
${button.import_mygc}    button[processEvent*='ImportGC']
${button.print_booking_label}    button[processEvent*='PrintLabel']
${button.new_hospital_case}    button.btn-new-hospital-case
${button.view_hospital_case}    button.btn-view-hospital-case
${button.account_details}    button.btn-account-details
${button.invoice}    button.invoice
${button.clinical}    button.clinical
${button.receipt}    button.btn-receipt
${button.telemed}    button[processEvent*='BookingTelemed']
${button.patient_dashboard}    button.btn-patient-dashboard
${button.debtor_edit}    button.btn-debtor-edit
${button.patient_file}    button.btn-clinical-history
${button.clinical_dropdown}    select.input-sm.event-class
${button.harmony_launcher}    button[data-bind*='HarmonyViewLauncher']
${button.openeyes_worklist}    button[processEvent*='OpenEyesViewLauncher']
${button.emguidance_script_portal}    button[processEvent*='EMGuidanceViewLauncher']
${button.story_mode}    button[processEvent*='StoryMode']
