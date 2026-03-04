*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{DIARY_GRID_LOCATORS}
...    button.new_booking=.btn.new-booking
...    button.new_task=.btn.new-task
...    button.new_operation=.btn.new-operation
...    button.reload_bookings=.btn.btn-reload-bookings
...    input.filter_bookings=input[placeholder="Filter bookings ..."]
...    button.previous_date=.btn.backward
...    button.next_date=.btn.forward
...    input.selected_date=input.input-date.selected
...    button.available_timeslots=.btn[title="Click here for available booking times"]
...    button.search_debtor_bookings=.btn[title="Search for debtor bookings"]
...    button.print_diary=.print-diary
...    button.procedure_search=.btn[title="Click here to view procedures or ICD10"]
...    button.show_active_bookings=.booking-display
...    button.hide_tasks=.btn-primary:contains('Hide Tasks')
...    button.hide_closed_tasks=.btn-primary:contains('Hide Closed Tasks')
...    table.diary_timeslots=.timeslots
...    div.timeslot=.timeslot
...    div.timeslot_time=.timeslot .time
...    div.timeslot_time_dynamic=//div[@class='time' and text()='${TIME}']
...    button.timeslot_history=//button[icon='history']
...    label.diary_name=.diary-names h2 span
...    ul.diary_list=.diary-names ul.menu
...    li.diary_entry=.diary-names li.diary

&{BOOKING_FORM_LOCATORS}
...    div.booking_container=.booking
...    div.booking_selected=.booking.selected
...    div.booking_deleted=.booking.deleted
...    div.booking_status=.typestatus .status
...    div.booking_type=.typestatus .type
...    div.booking_waiting_time=.waiting-time
...    div.booking_reason=.reason span
...    div.booking_summary=.summary
...    button.switch_status=.btn-switch-status
...    span.invoice_status=.invoice-status
...    span.account_status=.account-status
...    span.validation_status=.validation-status
...    span.verification_done=.verification-done
...    span.verification_pending=.verification-pending
...    span.view_notebook=.btn-view-notebook
...    icon.notebook_icon=.btn-view-notebook icon
...    button.advance_status=.btn-advance-status
...    button.patient_dashboard=.btn-patient-dashboard
...    button.debtor_edit=.btn-debtor-edit
...    button.clinical_history=.btn-clinical-history
...    button.account_details=.btn-account-details
...    button.invoice=.invoice
...    button.clinical=.clinical
...    button.receipt=.btn-receipt
...    button.telemed=.btn:contains('Telemed')
...    button.new_hospital_case=.btn-new-hospital-case
...    button.print_booking_label=.btn:contains('Print Booking Label')
...    button.myGC_import=.btn[title='Import from MyGC']
...    button.sms=.btn-sms
...    button.whatsapp=.btn-whatsapp
...    button.dial=.btn:contains('Dial')
...    button.email=.btn-email
...    button.send_payment_request=.btn:contains('Send a payment request')
...    button.open_external_program=.btn[title='Open External Program']
...    button.add_documents=.btn:contains('Add Documents')
...    button.add_appointment=.btn:contains('Add Appointment')
...    button.download_invoice=.btn:contains('Download Invoice')
...    button.download_receipt=.btn:contains('Download Receipt')
...    button.download_statement=.btn:contains('Download Statement')

&{PATIENT_DETAILS_LOCATORS}
...    input.patient_name=//div[@class='patient']//div[@class='name']/span
...    input.patient_mobile=//div[@class='patient']//div[@class='details']/span[1]
...    input.patient_gender=//div[@class='patient']//span[@data-bind*='gender']
...    input.patient_age=//div[@class='patient']//span[contains(text(), 'Age')]/following-sibling::span | //div[@class='patient']//span[@data-bind*='asAge']
...    div.patient_details=.patient .details
...    icon.patient_gender_icon=.patient .details icon
...    select.patient_case=select.form-control.input-xs
...    button.add_case=.add-case
...    button.edit_case=.edit-case
...    select.forms_library=select.event-type
...    button.active_forms_fax_all=button:contains('Fax All')
...    button.active_forms_email_all=button:contains('Email All')
...    button.create_recording=button:contains('Create Recording')
...    button.stop_recording=button:contains('Stop Recording')

&{DEBTOR_DETAILS_LOCATORS}
...    span.debtor_account_identifier=//div[@class='debtor-details']//span[@data-bind='text: debtor().acct_identifier()']
...    span.debtor_file_number=//div[@class='debtor-filenumber']//span[@data-bind*='file_no']
...    div.debtor_name=//div[@class='debtor']//div[@class='name']/span
...    div.debtor_details=//div[@class='debtor']//div[@class='details']
...    span.debtor_medical_aid=//div[@class='debtor']//div[@class='details']/span[2]
...    icon.debtor_status=//span[@class='status']/icon[text()='bolt']

&{PRACTITIONER_DETAILS_LOCATORS}
...    div.treating_doctor_name=//div[@class='treatingdoc']//div[@class='details']
...    div.treating_doctor_label=//div[@class='treatingdoc']//div[@class='name']
...    select.clinical_admin=select.input-sm.event-class

&{WARNING_ALERT_LOCATORS}
...    div.warning_timezone=.header .error
...    div.warning_message=.warning
...    span.warning_message=span[data-bind*='warning']

&{QUICKNOTE_LOCATORS}
...    span.quicknote_qform=//span[@class='qform none' and contains(text(),'Quick Note')]
...    button.quicknote_view_notebook=//span[@class='btn-view-notebook']/icon[contains(@class,'fa-sticky-note')]
...    button.quicknote_add=//button[contains(.,'Quick Note')]
...    button.quicknote_save=//button[contains(.,'Save')]
...    button.quicknote_cancel=//button[contains(.,'Cancel')]
...    input.quicknote_text=//textarea[contains(@placeholder,'Quick Note')]
...    button.quicknote_upload_image=//button[contains(.,'Upload Image')]
...    button.quicknote_upload_pdf=//button[contains(.,'Upload PDF')]
...    button.quicknote_print=//button[contains(.,'Print')]

&{DIARY_TAB_LOCATORS}
...    tab.diary=//a[t[text()='Diary']]
...    tab.theatre_manager=//a[t[text()='Theatre Manager']]
...    tab.dashboard=//a[t[text()='Dashboard']]
...    tab.patient_identifier=//a[t[text()='Patient Identifier']]
...    tab.clinical_reports=//a[t[text()='Clinical Reports']]
...    tab.hospital_rounds=//a[t[text()='Hospital Rounds']]
...    tab.inbox=//a[t[text()='Inbox']]

${button.close}    .pull-left.btn-close
${button.save_and_close}    .btn-save
${button.dropdown_save_list}    .btn-save-list
${button.create_recording}    .btn.btn-primary:contains('Create Recording')
${button.stop_recording}    .btn.btn-warning:contains('Stop Recording')
${list.suggestion}    ul.template-dropdown-menu.templates li a
${dialog.booking_form}    .ui-dialog-content
${label.booking_status}    .typestatus .status
${label.booking_type}    .typestatus .type
${label.patient_name}    .patient .name span
${label.patient_mobile}    .patient .details span[data-bind*='mobile_no']
${label.debtor_account}    .debtor-details .number span
${label.debtor_file_number}    .debtor-filenumber span[data-bind*='file_no']
${label.treating_doctor}    .treatingdoc .details
${label.reason}    .reason span
${label.summary}    .summary
${icon.notebook}    .btn-view-notebook icon
