*** Settings ***
Documentation       This file contains Diary Page locators for Booking, Quick Note, and related diary operations.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{DIARY_GRID_LOCATORS}
...    button.new_booking=.btn.new-booking
...    button.new_task=.btn.new-task
...    button.new_operation=.btn.new-operation
...    input.filter_bookings=input[placeholder="Filter bookings ..."]
...    input.date_picker=input.input-date.selected
...    button.reload_bookings=.btn-reload-bookings
...    button.print_diary=.print-diary
...    button.available_timeslots=button[title="Click here for available booking times"]
...    button.search_debtor_bookings=button[title="Search for debtor bookings"]
...    button.procedure_search=button[title="Click here to view procedures or ICD10"]
...    table.diary=.table.table-striped
...    table.diary.header=thead tr
...    table.diary.row=tbody tr
...    button.show_active_bookings=.booking-display
...    button.hide_tasks=.display-options button:contains('Hide Tasks')
...    button.hide_closed_tasks=.display-options button:contains('Hide Closed Tasks')
...    tab.diary=.option.AnyDiaryScreen.selected
...    tab.theatre_manager=.option.TheaterManagerScreen
...    tab.dashboard=.option.DashboardScreen
...    tab.patient_identifier=.option.PatientIdentifierScreen
...    tab.clinical_reports=.option.ClinicalReportsScreen
...    tab.hospital_rounds=.option.HospitalRoundListScreen
...    tab.inbox=.option.InboxScreen
...    select.render_policy=ul.render-policies li.policy
...    select.diary_type=ul.diary-types li.diary-type
...    button.today=.btn.today
...    button.backward=.btn.backward
...    button.forward=.btn.forward
...    button.close=.btn-close

&{BOOKING_FORM_LOCATORS}
...    dialog.booking_details=.booking.selected
...    input.patient_name=.patient .name span
...    input.patient_mobile=.patient .details span:first-of-type
...    input.patient_gender=.patient .details span:nth-of-type(2)
...    input.patient_age=.patient .details span:nth-of-type(3)
...    label.treating_doctor=.treatingdoc .name
...    input.treating_doctor_name=.treatingdoc .details
...    input.debtor_account_identifier=.debtor-details .number span
...    input.debtor_file_number=.debtor-filenumber span
...    select.location=.location select
...    input.booking_reason=.reason span
...    input.booking_status=.typestatus .status
...    input.booking_type=.typestatus .type
...    input.booking_start_time=.time .start
...    input.booking_end_time=.time div:nth-of-type(2)
...    input.booking_date=.date div
...    input.waiting_time=.waiting-time div
...    input.debtor_name=.debtor .name span
...    input.debtor_details=.debtor .details span
...    input.medical_aid_number=.debtor .details span:last-of-type
...    button.switch_status=.btn-switch-status
...    button.view_notebook=.btn-view-notebook
...    button.clinical_event=.btn-clinical-event
...    button.advance_status=.btn-advance-status
...    button.save_and_close=.btn-save
...    button.add_quicknote=select.event-type option[value="QUICK NOTE"]
...    button.quicknote_active=button.description span:contains('QUICK NOTE')
...    button.quicknote_copy=button.description + button.btn-warning
...    button.quicknote_delete=button.description + button.btn-danger
...    button.complete_stage=.btn-finalize.btn-default
...    button.lock=.btn-warning:contains('Lock')
...    button.email_all=.btn-success:contains('Email All')
...    button.fax_all=.btn-success:contains('Fax All')
...    button.expand_all=.btn-success:contains('Expand All')
...    button.add_case=.add-case
...    button.edit_case=.edit-case
...    select.forms_library=select.event-type
...    select.clinical_dropdown=select.event-class
...    button.save_lines_to_macro=.save-list button:contains('Save Lines To New Macro')
...    button.save=.save-list button:contains('Save')
...    button.send_payment_request=.btn-sb-layout.btn.btn-sm.btn-primary:contains('Send a payment request')
...    button.upload_documents=.btn-sb-layout.btn.btn-sm.lightred.btn-primary
...    button.add_appointment=.btn-sb-layout.btn.btn-sm.btn-primary:contains('Add Appointment')
...    button.download_invoice=.btn-sb-layout.btn.btn-sm.btn-default:contains('Download Invoice')
...    button.download_receipt=.btn-sb-layout.btn.btn-sm.btn-default:contains('Download Receipt')
...    button.download_statement=.btn.btn-sm.btn-primary:contains('Download Statement')
...    button.import_mygc=button[img][alt="MyGC"]
...    button.sms=.btn-tumblr.btn-sms
...    button.whatsapp=.btn-tumblr.btn-whatsapp
...    button.email=.btn-tumblr.btn-email
...    button.dial=.btn-tumblr:contains('Dial')
...    button.harmony_launcher=button[data-bind*='HarmonyViewLauncher']
...    button.add_documents=button[data-bind*='UploadDocuments']
...    button.external_program=button[data-bind*='OpenExternalProgram']
...    button.print_booking_label=button[data-bind*='PrintLabel']
...    button.account_details=button.btn-account-details
...    button.invoice=button.invoice
...    button.clinical=button.clinical
...    button.receipt=button.btn-receipt
...    button.telemed=button[data-bind*='BookingTelemed']
...    button.new_hospital_case=button.btn-new-hospital-case

&{QUICKNOTE_LOCATORS}
...    select.quicknote_dropdown=select.event-type option[value="QUICK NOTE"]
...    button.quicknote_active=button.description span:contains('QUICK NOTE')
...    button.quicknote_copy=button.description + button.btn-warning
...    button.quicknote_delete=button.description + button.btn-danger
...    dialog.quicknote_editor=.workflow-event-stage .box.box-primary
...    input.quicknote_textarea=textarea[name="quicknote-text"]
...    button.quicknote_add_image=button[data-bind*='AddImage']
...    button.quicknote_add_pdf=button[data-bind*='AddPdf']
...    button.quicknote_save=button[data-bind*='SaveQuickNote']
...    button.quicknote_cancel=button[data-bind*='CancelQuickNote']
...    icon.quicknote_image=icon.fa-image
...    icon.quicknote_pdf=icon.fa-file-pdf

&{WARNING_ALERT_LOCATORS}
...    alert.timezone_warning=.header .error
...    alert.booking_conflict=.alert-booking-conflict
...    alert.debtor_duplicate=.duplicate-debtor
...    alert.validation_error=.alert-danger.validation
...    alert.success=.alert-success
...    icon.warning=icon.fa-exclamation-triangle

&{DIARY_TIMESLOT_LOCATORS}
...    timeslot.09_00=div.time:contains('09:00')
...    timeslot.09_15=div.time:contains('09:15')
...    timeslot.09_30=div.time:contains('09:30')
...    timeslot.09_45=div.time:contains('09:45')
...    timeslot.10_00=div.time:contains('10:00')
...    timeslot.10_15=div.time:contains('10:15')
...    timeslot.10_30=div.time:contains('10:30')
...    timeslot.10_45=div.time:contains('10:45')
...    timeslot.11_00=div.time:contains('11:00')
...    timeslot.11_15=div.time:contains('11:15')
...    timeslot.11_30=div.time:contains('11:30')
...    timeslot.11_45=div.time:contains('11:45')
...    timeslot.12_00=div.time:contains('12:00')
...    timeslot.12_15=div.time:contains('12:15')
...    timeslot.12_30=div.time:contains('12:30')
...    timeslot.12_45=div.time:contains('12:45')
...    timeslot.13_00=div.time:contains('13:00')
...    timeslot.13_15=div.time:contains('13:15')
...    timeslot.13_30=div.time:contains('13:30')
...    timeslot.13_45=div.time:contains('13:45')
...    timeslot.14_00=div.time:contains('14:00')
...    timeslot.14_15=div.time:contains('14:15')
...    timeslot.14_30=div.time:contains('14:30')
...    timeslot.14_45=div.time:contains('14:45')
...    timeslot.15_00=div.time:contains('15:00')
...    timeslot.15_15=div.time:contains('15:15')
...    timeslot.15_30=div.time:contains('15:30')
...    timeslot.15_45=div.time:contains('15:45')
...    timeslot.16_00=div.time:contains('16:00')
...    timeslot.16_15=div.time:contains('16:15')
...    timeslot.16_30=div.time:contains('16:30')
...    timeslot.16_45=div.time:contains('16:45')

# Standalone locators (for special or unique elements)
${dialog.booking_details}    .booking.selected
${dialog.quicknote_editor}   .workflow-event-stage .box.box-primary
${alert.timezone_warning}    .header .error
${button.save_and_close}     .btn-save
${button.close}             .btn-close
