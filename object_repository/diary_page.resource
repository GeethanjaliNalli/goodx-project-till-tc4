*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_NAVIGATION_LOCATORS}
...    tab.diary=//li[@class='option AnyDiaryScreen selected']
...    tab.dashboard=//li[@class='option DashboardScreen']
...    tab.patient_identifier=//li[@class='option PatientIdentifierScreen']
...    tab.inbox=//li[@class='option InboxScreen']
...    tab.clinical_reports=//li[@class='option ClinicalReportsScreen']
...    tab.hospital_rounds=//li[@class='option HospitalRoundListScreen']
...    tab.theatre_manager=//li[@class='option TheaterManagerScreen']
...    button.nav_wheel=.navbar-header .wheel
...    button.settings=a.settings
...    button.about=a.about
...    button.logout=a.logout
...    logo.goodx=img.logo[alt="GoodX Web Logo"]

&{DIARY_HEADER_LOCATORS}
...    label.diary_dropdown=ul.diary-names > li > a[data-toggle="dropdown"]
...    dropdown.diary_list=ul.diary-names ul.dropdown-menu
...    label.display_options=ul.display-options li a[data-toggle="dropdown"]
...    button.show_active_bookings=button.booking-display.btn-primary
...    button.hide_tasks=button.btn-primary:contains('Hide Tasks')
...    button.hide_closed_tasks=button.btn-primary:contains('Hide Closed Tasks')
...    input.filter_bookings=input[placeholder="Filter bookings ..."]
...    input.date_picker=input.input-date.selected
...    button.backward_date=.input-group-btn .backward
...    button.forward_date=.input-group-btn .forward
...    button.today_date=.input-group-btn .today
...    button.reload_bookings=.btn-reload-bookings
...    button.new_booking=button.new-booking
...    button.available_timeslots=button[title*="available booking times"]
...    button.search_debtor_bookings=button[title*="debtor bookings"]
...    button.print_diary=button.print-diary
...    button.procedure_search=button[title*="procedures or ICD10"]
...    dropdown.render_policies=a[data-toggle='dropdown']:contains('Render Policies')
...    dropdown.diary_types=a[data-toggle='dropdown']:contains('Diary Types')

&{DIARY_GRID_LOCATORS}
...    grid.timeslots=div.timeslots
...    timeslot.cell=div.timeslot
...    timeslot.time=div.timeslot .time
...    timeslot.selected=div.timeslot.selected .time
...    booking.row=div.booking.ui-draggable
...    booking.row.selected=div.booking.ui-draggable.selected
...    booking.row.deleted=div.booking.ui-draggable.deleted
...    booking.row.status=div.booking .status
...    booking.row.type=div.booking .type
...    booking.row.patient_name=div.booking .patient .name span
...    booking.row.patient_details=div.booking .patient .details span
...    booking.row.treating_doctor=div.booking .treatingdoc .details
...    booking.row.debtor_name=div.booking .debtor .name span
...    booking.row.debtor_details=div.booking .debtor .details span
...    booking.row.debtor_file_number=div.booking .debtor-filenumber span
...    booking.row.location=div.booking .location select
...    booking.row.reason=div.booking .reason span
...    booking.row.summary=div.booking .summary
...    booking.row.qform=div.booking .summary .qform
...    booking.row.clinical_status=div.booking .summary .clinical-status
...    booking.row.document_status=div.booking .summary .document-status
...    booking.row.switch_status=div.booking .summary button.btn-switch-status
...    booking.row.invoice_status=div.booking .summary .invoice-status
...    booking.row.account_status=div.booking .summary .account-status
...    booking.row.validation_status=div.booking .summary .validation-status
...    booking.row.verification_done=div.booking .summary .verification-done
...    booking.row.verification_pending=div.booking .summary .verification-pending
...    booking.row.view_notebook=div.booking .summary .btn-view-notebook
...    booking.row.start_time=div.booking .time .start
...    booking.row.end_time=div.booking .time div:nth-child(2)
...    booking.row.date=div.booking .date div
...    booking.row.waiting_time=div.booking .waiting-time

&{PATIENT_DETAILS_LOCATORS}
...    patient.name=div.patient .name span
...    patient.details=div.patient .details span
...    patient.gender=div.patient .details span:nth-child(2)
...    patient.age=div.patient .details span:nth-child(3) span
...    patient.mobile=div.patient .details span:first-child

&{DEBTOR_DETAILS_LOCATORS}
...    debtor.name=div.debtor .name span
...    debtor.details=div.debtor .details span
...    debtor.file_number=div.debtor-filenumber span
...    debtor.number=div.debtor-details .number span
...    debtor.medical_aid=div.debtor .details span[data-bind*='medical_aid_no']

&{BOOKING_FORM_LOCATORS}
...    input.reason=div.reason span
...    input.location=div.location select
...    input.debtor_number=div.debtor-details .number span
...    input.debtor_file_number=div.debtor-filenumber span
...    input.date=div.date div
...    input.start_time=div.time .start
...    input.end_time=div.time div:nth-child(2)
...    input.status=div.typestatus .status
...    input.type=div.typestatus .type
...    button.switch_status=button.btn-switch-status
...    button.view_notebook=span.btn-view-notebook
...    button.advance_status=button.btn-advance-status
...    button.patient_dashboard=button.btn-patient-dashboard
...    button.debtor_edit=button.btn-debtor-edit
...    button.clinical_history=button.btn-clinical-history
...    button.account_details=button.btn-account-details
...    button.invoice=button.invoice
...    button.receipt=button.btn-receipt
...    button.clinical=button.clinical
...    button.telemed=button:contains('Telemed')
...    button.print_label=button:contains('Print Booking Label')
...    button.sms=button.btn-sms
...    button.whatsapp=button.btn-whatsapp
...    button.email=button.btn-email
...    button.add_documents=button:contains('Add Documents')
...    button.add_appointment=button[title^='Linked Appointments']
...    button.download_invoice=button:contains('Download Invoice')
...    button.download_receipt=button:contains('Download Receipt')
...    button.download_statement=button:contains('Download Statement')
...    button.send_payment_request=button[title='Send a payment request']
...    button.verify_patient=button.btn-success

&{CLINICAL_FORM_LOCATORS}
...    select.event_type=select.event-type
...    button.email_all=button:contains('Email All')
...    button.fax_all=button:contains('Fax All')
...    button.expand_all=button:contains('Expand All')
...    button.lock=button.btn-warning
...    button.print=button.btn-print
...    button.save=button.btn-save
...    button.save_and_close=button.btn-save span:contains('Save and Close')
...    button.close=button.btn-close
...    button.complete=button.btn-finalize strong:contains('Complete')
...    button.email_pdf=button:has(t:contains('Email'))
...    button.fax_pdf=button:has(t:contains('Fax'))
...    button.download=button:contains('Download')
...    button.duplicate_event=button.btn-warning:contains('Copy')
...    button.delete_event=button.btn-danger:contains('Delete')
...    button.select_event=button.description
...    button.sick_note_event=//span[text()='SICK NOTE']/ancestor::button
...    button.script_event=//span[text()='SCRIPT']/ancestor::button
...    button.quick_note_event=//span[contains(text(),'QUICK NOTE')]/ancestor::button
...    button.report_event=//span[contains(text(),'REPORT')]/ancestor::button
...    button.custom_doctor_patient_event=//span[contains(text(),'CUSTOM - Doctor and Patient')]/ancestor::button
...    button.q3_test_event=//span[contains(text(),'Q3 test')]/ancestor::button
...    button.managed_care_consent_event=//span[contains(text(),'Managed Care Consent')]/ancestor::button
...    button.active_event=div.active-event button.description
...    button.delete_workflow_event=button.btn-danger:contains('Delete')
...    button.duplicate_workflow_event=button.btn-warning:contains('Copy')
...    button.select_workflow_event=button.description
...    button.active_forms=div.col-sm-12.mb5 h3 strong:contains('Active Forms')
...    button.forms_library=div.col-sm-12.mt10 h3 strong:contains('Forms Library')
...    select.forms_library=select.event-type
...    button.sick_note=//span[text()='SICK NOTE']/ancestor::button
...    button.save_and_close=button.btn-save span:contains('Save and Close')
...    button.close=button.btn-close

&{WARNING_ALERT_LOCATORS}
...    alert.timezone_mismatch=div.header .error
...    alert.status_bar=div.status-color-bar
...    alert.priority_bar=div.priority-color-bar
...    alert.warning=div.warning

# Standalone locators
${button.close}    .pull-left.btn-close
${button.save}     button.btn-save
${button.print}    button.btn-print
${button.email}    button.btn-email
${button.fax}      button:has(t:contains('Fax'))
${button.lock}     button.btn-warning
${button.expand_all}    button:has(t:contains('Expand All'))
${button.complete}      button.btn-finalize strong:contains('Complete')
