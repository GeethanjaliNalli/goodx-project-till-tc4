*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_GRID_LOCATORS}
...    button.new_booking=.btn.new-booking
...    button.new_operation=.btn.new-operation
...    button.new_task=.btn.new-task
...    button.print_diary=.btn.print-diary
...    button.available_booking_times=.btn:has(.fa-question)
...    button.search_debtor_bookings=.btn:has(.fa-search)
...    button.view_procedures_icd10=.btn:has(.fa-ellipsis-h)
...    input.booking_filter=input[placeholder="Filter bookings ..."]
...    button.change_date_backward=.btn.backward
...    button.change_date_forward=.btn.forward
...    button.today=.btn.today
...    button.reload_bookings=.btn-reload-bookings
...    select.diary_dropdown=ul.diary-names
...    select.entity_dropdown=a.entity
...    ul.display_options=ul.display-options
...    tab.diary=//a[t[text()='Diary']]
...    tab.dashboard=//a[t[text()='Dashboard']]
...    tab.patient_identifier=//a[t[text()='Patient Identifier']]
...    tab.clinical_reports=//a[t[text()='Clinical Reports']]
...    tab.hospital_rounds=//a[t[text()='Hospital Rounds']]
...    tab.inbox=//a[t[text()='Inbox']]
...    tab.theatre_manager=//a[t[text()='Theatre Manager']]
...    button.logout=a.logout
...    button.settings=a.settings
...    button.about=a.about
...    img.logo=img.logo
...    button.nav_wheel=a.wheel
...    div.timeslot=div.timeslot
...    div.timeslot_time=div.timeslot .time
...    div.timeslot_time_label=div.timeslot .time
...    div.booking=div.booking
...    div.booking_selected=div.booking.selected
...    div.booking_deleted=div.booking.deleted
...    span.btn_view_notebook=span.btn-view-notebook
...    button.switch_status=button.btn-switch-status
...    span.document_status=span.document-status
...    span.invoice_status=span.invoice-status
...    span.account_status=span.account-status
...    span.validation_status=span.validation-status
...    span.qform_status=span.qform
...    span.clinical_status=span.clinical-status
...    span.verification_pending=span.verification-pending
...    span.verification_done=span.verification-done
...    div.status=div.status
...    div.type=div.type
...    div.typestatus=div.typestatus
...    div.date=div.date
...    div.date_value=div.date > div
...    div.reason=div.reason
...    span.reason_value=div.reason > span
...    div.patient=div.patient
...    div.patient_name=div.patient .name > span
...    div.patient_details=div.patient .details
...    span.patient_mobile=div.patient .details > span:nth-child(1)
...    span.patient_gender=div.patient .details > span:nth-child(2)
...    span.patient_age=div.patient .details > span:nth-child(3)
...    div.treatingdoc=div.treatingdoc
...    div.treatingdoc_name=div.treatingdoc .name
...    div.treatingdoc_details=div.treatingdoc .details
...    div.debtor_details=div.debtor-details
...    div.debtor_number=div.debtor-details .number > span
...    div.debtor_filenumber=div.debtor-filenumber > span
...    div.debtor=div.debtor
...    div.debtor_name=div.debtor .name > span
...    div.debtor_details_inner=div.debtor .details > span
...    select.location=div.location select.input-xs
...    button.advance_status=.btn-advance-status
...    button.patient_dashboard=.btn-patient-dashboard
...    button.debtor_edit=.btn-debtor-edit
...    button.patient_file=.btn-clinical-history
...    button.account_details=.btn-account-details
...    button.invoice=.invoice
...    button.clinical=.clinical
...    button.receipt=.btn-receipt
...    button.new_hospital_case=.btn-new-hospital-case
...    button.print_booking_label=.btn-primary:has(.fa-print)
...    button.sms=.btn-sms
...    button.whatsapp=.btn-whatsapp
...    button.email=.btn-email
...    button.dial=.btn-tumblr:has(.fa-phone)
...    input.date_picker=input.input-date.selected
...    dialog.sidebar=.sidebar.expanded
...    dialog.box_primary=.box.box-primary
...    label.time_since_booking=label:has-text('Time since booking start:')
...    span.booking_start_time_eta=span[data-bind*='booking_start_time_eta_text']
...    div.status_color_bar=.status-color-bar
...    span.status_color_current=.status-color-bar .current
...    span.status_color=.status-color-bar span
...    strong.status_current=strong.current[data-bind*='status().name']
...    strong.status_next=strong.next[data-bind*='$next.name']
...    table.simple_grid=table.table.table-striped
...    thead.simple_grid_head=table.table.table-striped thead
...    tbody.simple_grid_body=table.table.table-striped tbody
...    tr.simple_grid_row=table.table.table-striped tbody tr
...    th.simple_grid_header=table.table.table-striped thead th
...    td.simple_grid_cell=table.table.table-striped tbody td

${button.close_sidebar}    .sidebar .btn-close
${button.reload}    .btn-reload-bookings
${input.booking_filter}    input[placeholder="Filter bookings ..."]
${button.new_booking}    .btn.new-booking
${button.view_notebook}    span.btn-view-notebook
