*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_NAVIGATION_LOCATORS}
...    tab.diary=//a[t[text()='Diary']]
...    tab.dashboard=//a[t[text()='Dashboard']]
...    tab.inbox=//a[t[text()='Inbox']]
...    tab.clinical_reports=//a[t[text()='Clinical Reports']]
...    tab.hospital_rounds=//a[t[text()='Hospital Rounds']]
...    tab.patient_identifier=//a[t[text()='Patient Identifier']]
...    button.logout=.logout
...    button.settings=.settings
...    button.about=.about
...    dropdown.entity=.entity
...    input.entity_search=input.input-sm

&{BOOKING_GRID_LOCATORS}
...    button.new_booking=.btn-group .new-booking
...    button.new_task=.btn-group .new-task
...    button.new_operation=.btn-group .new-operation
...    button.reload_bookings=.btn-reload-bookings
...    input.filter_bookings=input[placeholder='Filter bookings ...']
...    input.current_date=input.input-date.selected
...    button.previous_date=.btn.backward
...    button.next_date=.btn.forward
...    button.today_date=.btn.today
...    button.print_diary=.print-diary
...    button.available_times=.btn.btn-primary[title*='available booking times']
...    button.search_debtor_bookings=.btn.btn-primary[title*='debtor bookings']
...    select.display_options=ul.display-options
...    select.diary_types=ul.diary-types
...    select.render_policies=ul.render-policies
...    table.diary=.table.table-striped
...    row.booking=div.booking
...    cell.booking_time=div.time .start
...    cell.booking_type=div.typestatus .type
...    cell.booking_status=div.typestatus .status
...    cell.patient_name=div.patient .name span
...    cell.patient_details=div.patient .details
...    cell.treating_doctor=div.treatingdoc .details
...    cell.debtor_number=div.debtor-details .number span
...    cell.debtor_file_number=div.debtor-filenumber span
...    cell.location=div.location select
...    cell.reason=div.reason span
...    cell.summary=div.summary
...    cell.qform_status=span.qform
...    cell.clinical_status=span.clinical-status
...    cell.document_status=span.document-status
...    cell.switch_status=button.btn-switch-status
...    cell.invoice_status=span.invoice-status
...    cell.account_status=span.account-status
...    cell.validation_status=span.validation-status
...    cell.verification_done=span.verification-done
...    cell.verification_pending=span.verification-pending
...    cell.view_notebook=span.btn-view-notebook

&{PATIENT_DETAILS_LOCATORS}
...    input.patient_name=div.patient .name span
...    input.patient_mobile=div.patient .details span:nth-of-type(1)
...    input.patient_gender=div.patient .details t+span
...    input.patient_age=div.patient .details span:nth-of-type(3)
...    label.patient_name=//div[@class='patient']//div[@class='name']
...    label.patient_details=//div[@class='patient']//div[@class='details']
...    icon.patient_gender=div.patient .details icon

&{DEBTOR_DETAILS_LOCATORS}
...    input.debtor_number=div.debtor-details .number span
...    input.debtor_file_number=div.debtor-filenumber span
...    input.debtor_name=div.debtor .name span
...    input.debtor_details=div.debtor .details
...    input.debtor_medical_aid=div.debtor .details span:not([style*='display: none'])
...    input.debtor_medical_aid_number=div.debtor .details span:not([style*='display: none'])
...    icon.debtor_status=div.debtor-details .status icon

&{PRACTITIONER_DETAILS_LOCATORS}
...    input.treating_doctor_name=div.treatingdoc .details
...    label.treating_doctor=div.treatingdoc .name

&{DIARY_TIMESLOT_LOCATORS}
...    timeslot.09_00=//div[@class='time' and text()='09:00']
...    timeslot.09_15=//div[@class='time' and text()='09:15']
...    timeslot.09_30=//div[@class='time' and text()='09:30']
...    timeslot.09_45=//div[@class='time' and text()='09:45']
...    timeslot.10_00=//div[@class='time' and text()='10:00']
...    timeslot.10_15=//div[@class='time' and text()='10:15']
...    timeslot.10_30=//div[@class='time' and text()='10:30']
...    timeslot.10_45=//div[@class='time' and text()='10:45']
...    timeslot.11_00=//div[@class='time' and text()='11:00']
...    timeslot.11_15=//div[@class='time' and text()='11:15']
...    timeslot.11_30=//div[@class='time' and text()='11:30']
...    timeslot.11_45=//div[@class='time' and text()='11:45']
...    timeslot.12_00=//div[@class='time' and text()='12:00']
...    timeslot.12_15=//div[@class='time' and text()='12:15']
...    timeslot.12_30=//div[@class='time' and text()='12:30']
...    timeslot.12_45=//div[@class='time' and text()='12:45']
...    timeslot.13_00=//div[@class='time' and text()='13:00']
...    timeslot.13_15=//div[@class='time' and text()='13:15']
...    timeslot.13_30=//div[@class='time' and text()='13:30']
...    timeslot.13_45=//div[@class='time' and text()='13:45']
...    timeslot.14_00=//div[@class='time' and text()='14:00']
...    timeslot.14_15=//div[@class='time' and text()='14:15']
...    timeslot.14_30=//div[@class='time' and text()='14:30']
...    timeslot.14_45=//div[@class='time' and text()='14:45']
...    timeslot.15_00=//div[@class='time' and text()='15:00']
...    timeslot.15_15=//div[@class='time' and text()='15:15']
...    timeslot.15_30=//div[@class='time' and text()='15:30']
...    timeslot.15_45=//div[@class='time' and text()='15:45']
...    timeslot.16_00=//div[@class='time' and text()='16:00']
...    timeslot.16_15=//div[@class='time' and text()='16:15']
...    timeslot.16_30=//div[@class='time' and text()='16:30']
...    timeslot.16_45=//div[@class='time' and text()='16:45']

&{BOOKING_ACTION_LOCATORS}
...    button.switch_status=button.btn-switch-status
...    button.view_notebook=span.btn-view-notebook
...    button.advance_status=button.btn-advance-status
...    button.save=button.btn-save
...    button.save_and_close=button.btn-save span:contains('Save and Close')
...    button.print=button.btn-print
...    button.email=button[title*='Email']
...    button.fax=button[title*='Fax']
...    button.download=button[title*='Download']
...    button.expand_all=button[title*='Expand All']
...    button.collapse_all=button[title*='Collapse All']
...    button.add_documents=button[title*='add_documents']
...    button.add_appointment=button[title*='add_appointment']
...    button.patient_dashboard=button.btn-patient-dashboard
...    button.debtor_edit=button.btn-debtor-edit
...    button.clinical_history=button.btn-clinical-history
...    button.account_details=button.btn-account-details
...    button.invoice=button.invoice
...    button.clinical=button.clinical
...    button.receipt=button.btn-receipt
...    button.telemed=button[title*='Telemed']
...    button.new_hospital_case=button.btn-new-hospital-case
...    button.print_booking_label=button[title*='Print Booking Label']
...    button.send_custom_form=button[title*='Send Custom Form']
...    button.send_consent_form=button[title*='Send Consent Form']
...    button.confirm_at_kiosk=button[title*='Confirm Details at Kiosk']
...    button.reset_kiosk=button[title*='Reset Kiosk']
...    button.sms=button.btn-sms
...    button.whatsapp=button.btn-whatsapp
...    button.dial=button.btn-tumblr
...    button.email_action=button.btn-email
...    button.send_payment_request=button[title*='send_payment_request']

&{CLINICAL_FORMS_LOCATORS}
...    select.forms_library=select.event-type
...    option.sick_note=//option[normalize-space()='SICK NOTE']
...    button.add_form=button[title*='Add Form']
...    accordion.active_forms=//h3[.//t[text()='Active Forms']]
...    button.copy_form=button[title*='Copy']
...    button.delete_form=button[title*='DeleteWorkflowEvent']
...    button.complete_stage=button.btn-finalize
...    button.email_pdf=button[title*='Email']
...    button.fax_pdf=button[title*='Fax']
...    button.print_pdf=button.btn-print
...    button.download_pdf=button[title*='Download']
...    button.expand_all_forms=button[title*='Expand All']
...    button.collapse_all_forms=button[title*='Collapse All']

&{WARNING_ALERT_LOCATORS}
...    label.timezone_warning=//div[contains(@class, 'error') and contains(., 'timezone')]
...    icon.verification_done=span.verification-done > icon
...    icon.verification_pending=span.verification-pending > icon

# Standalone locators
${button.close}    .pull-left.btn-close
${dialog.toast}    .ToastScreen
${dialog.sidebar}    .sidebar.expanded
${dialog.booking_details}    .box.box-primary
${dialog.financial_summary}    .financial-summary-component
${dialog.patient_summary}    .patient-summary-component
${dialog.forms_library}    .event-type
${dialog.active_forms}    .active-event
${dialog.clinical_form}    .workflow-event
${dialog.confirmation}    .ui-dialog-title
