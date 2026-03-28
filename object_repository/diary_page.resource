*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_NAVIGATION_LOCATORS}
...    tab.diary=//a[.//t[text()='Diary']]
...    tab.dashboard=//a[.//t[text()='Dashboard']]
...    tab.patient_identifier=//a[.//t[text()='Patient Identifier']]
...    tab.clinical_reports=//a[.//t[text()='Clinical Reports']]
...    tab.hospital_rounds=//a[.//t[text()='Hospital Rounds']]
...    tab.inbox=//a[.//t[text()='Inbox']]
...    button.logout=.fa-sign-out-alt
...    button.settings=.fa-cog
...    button.about=.fa-info-circle
...    dropdown.entity=.entity
...    input.entity_search=//input[@placeholder='Search for Entity ...']
...    list.entity_suggestions=.entity-dropdown-menu
...    item.entity_suggestion=.entity-dropdown-menu li a

&{DIARY_HEADER_LOCATORS}
...    dropdown.diary=//a[@data-toggle='dropdown']/h2/span[contains(text(),'Diary')]
...    dropdown.display_options=//a[@data-toggle='dropdown']/h2/span[text()='Display Options']
...    button.show_active_bookings=.btn.booking-display.btn-primary
...    button.hide_tasks=//button[text()='Hide Tasks']
...    button.hide_closed_tasks=//button[text()='Hide Closed Tasks']
...    input.filter_bookings=//input[@placeholder='Filter bookings ...']
...    button.change_date_backward=.btn.btn-default.btn-flat.backward
...    button.change_date_forward=.btn.btn-default.btn-flat.forward.mr10
...    input.selected_date=.input-date.selected
...    button.reload_bookings=.btn-reload-bookings
...    button.new_booking=.btn.btn-sm.btn-primary.new-booking
...    button.available_timeslots=.btn.btn-sm.btn-primary[title*='available booking times']
...    button.search_debtor_bookings=.btn.btn-sm.btn-primary[title*='debtor bookings']
...    button.print_diary=.print-diary
...    button.procedure_search=.btn.btn-sm.btn-primary[title*='procedures or ICD10']
...    dropdown.render_policies=.render-policies
...    dropdown.diary_types=.diary-types

&{DIARY_GRID_LOCATORS}
...    grid.timeslot=//div[contains(@class,'timeslot')]
...    grid.timeslot_time=//div[contains(@class,'timeslot')]//div[@class='time']
...    grid.booking=//div[contains(@class,'booking')]
...    grid.booking_selected=//div[contains(@class,'booking') and contains(@class,'selected')]
...    grid.booking_deleted=//div[contains(@class,'booking') and contains(@class,'deleted')]
...    grid.booking_status=//div[contains(@class,'booking')]//div[@class='status']
...    grid.booking_type=//div[contains(@class,'booking')]//div[@class='type']
...    grid.booking_patient_name=//div[contains(@class,'booking')]//div[@class='patient']//div[@class='name']/span
...    grid.booking_patient_details=//div[contains(@class,'booking')]//div[@class='patient']//div[@class='details']
...    grid.booking_practitioner=//div[contains(@class,'booking')]//div[@class='treatingdoc']//div[@class='details']
...    grid.booking_reason=//div[contains(@class,'booking')]//div[@class='reason']/span
...    grid.booking_summary=//div[contains(@class,'booking')]//div[@class='summary']
...    grid.booking_document_status=//div[contains(@class,'booking')]//span[contains(@class,'document-status')]
...    grid.booking_invoice_status=//div[contains(@class,'booking')]//span[contains(@class,'invoice-status')]
...    grid.booking_account_status=//div[contains(@class,'booking')]//span[contains(@class,'account-status')]
...    grid.booking_validation_status=//div[contains(@class,'booking')]//span[contains(@class,'validation-status')]
...    grid.booking_view_notebook=//div[contains(@class,'booking')]//span[contains(@class,'btn-view-notebook')]
...    grid.booking_verification_pending=//div[contains(@class,'booking')]//span[contains(@class,'verification-pending')]
...    grid.booking_verification_done=//div[contains(@class,'booking')]//span[contains(@class,'verification-done')]
...    grid.booking_debtor_number=//div[contains(@class,'booking')]//div[@class='debtor-details']//span
...    grid.booking_debtor_file_number=//div[contains(@class,'booking')]//div[@class='debtor-filenumber']//span
...    grid.booking_location_dropdown=//div[contains(@class,'booking')]//select[contains(@class,'input-xs')]
...    grid.booking_start_time=//div[contains(@class,'booking')]//div[@class='time']//div[@class='start']
...    grid.booking_end_time=//div[contains(@class,'booking')]//div[@class='time']//div[2]
...    grid.booking_date=//div[contains(@class,'booking')]//div[@class='date']//div
...    grid.booking_medical_aid_details=//div[contains(@class,'booking')]//div[@class='debtor']/div[@class='details']/span[2]

&{PATIENT_DETAILS_LOCATORS}
...    label.patient_name=//div[@class='patient']//div[@class='name']/span
...    label.patient_details=//div[@class='patient']//div[@class='details']
...    label.patient_gender=//div[@class='patient']//span[t[text()='Male'] or t[text()='Female']]
...    label.patient_age=//div[@class='patient']//span[contains(text(),'years') or contains(text(),'months')]
...    label.patient_mobile=//div[@class='patient']//span[contains(text(),'9987654321') or contains(text(),'374872184312') or contains(text(),'9087654321') or contains(text(),'65876979709809')]
...    label.patient_file_number=//div[@class='debtor-filenumber']//span
...    label.patient_medical_aid=//div[@class='debtor']//div[@class='details']/span[2]
...    label.patient_debtor_number=//div[@class='debtor-details']//span

&{PRACTITIONER_DETAILS_LOCATORS}
...    label.practitioner_name=//div[@class='treatingdoc']//div[@class='details']
...    label.practitioner_title=//div[@class='treatingdoc']//div[@class='name']

&{SIDEBAR_BUTTONS_LOCATORS}
...    button.verify_patient=//button[contains(.,'Verify Patient')]
...    button.patient_dashboard=.btn-patient-dashboard
...    button.debtor_edit=.btn-debtor-edit
...    button.patient_file=.btn-clinical-history
...    button.account_details=.btn-account-details
...    button.invoice=.invoice
...    button.clinical=.clinical
...    button.receipt=.btn-receipt
...    button.print_booking_label=//button[contains(.,'Print Booking Label')]
...    button.sms=.btn-sms
...    button.whatsapp=.btn-whatsapp
...    button.dial=//button[contains(.,'Dial')]
...    button.email=.btn-email
...    button.send_payment_request=//button[contains(.,'Send a payment request')]
...    button.add_documents=//button[contains(.,'Add Documents')]
...    button.add_appointment=//button[contains(.,'Add Appointment')]
...    button.download_invoice=//button[contains(.,'Download Invoice')]
...    button.download_receipt=//button[contains(.,'Download Receipt')]
...    button.download_statement=//button[contains(.,'Download Statement')]
...    button.mygc=//button[contains(.,'MyGC')]
...    button.new_hospital_case=.btn-new-hospital-case

&{CLINICAL_FORMS_LOCATORS}
...    select.form_type=//select[contains(@class,'event-type')]
...    option.sick_note=//select[contains(@class,'event-type')]/option[text()='SICK NOTE']
...    button.add_form=//button[contains(.,'Add Appointment')]
...    button.copy_form=//button[contains(.,'Copy')]
...    button.delete_form=//button[contains(@class,'btn-danger') and icon[contains(@class,'fa-trash-alt')]]
...    button.finalize_form=//button[contains(@class,'btn-finalize')]
...    button.lock_form=//button[contains(@class,'btn-warning') and contains(@data-bind,'Lock')]
...    button.email_pdf=//button[contains(@data-bind,'EmailPdf')]
...    button.fax_pdf=//button[contains(@data-bind,'FaxPdf')]
...    button.print_pdf=//button[contains(@data-bind,'Print')]
...    button.expand_all=//button[contains(@data-bind,'ExpandAll')]
...    button.save_and_close=//button[contains(@class,'btn-save') and contains(.,'Save and Close')]
...    button.save=//ul[contains(@class,'save-list')]//button[contains(.,'Save')]
...    button.close=.btn-close
...    label.selected_patient=//span[@class='selected-patient']
...    label.active_form=//div[contains(@class,'active-event')]//span[contains(@class,'description') and text()='SICK NOTE']
...    label.finalized_status=//div[contains(@class,'active-event')]//div[contains(@class,'fully-finalized') or contains(@class,'partially-finalised') or contains(@class,'unfinalized')]
...    button.email_all=//button[contains(.,'Email All')]
...    button.fax_all=//button[contains(.,'Fax All')]
...    button.duplicate_event=//button[contains(@data-bind,'DuplicateEvent')]
...    button.delete_event=//button[contains(@data-bind,'DeleteWorkflowEvent')]
...    button.select_event=//button[contains(@data-bind,'SelectEvent')]
...    button.select_case=//select[contains(@class,'input-xs') and @data-bind*='selected_case']
...    button.add_case=.add-case
...    button.edit_case=.edit-case

&{WARNING_ALERT_LOCATORS}
...    alert.timezone_warning=//div[@class='error' and contains(.,'timezone')]
...    alert.validation_status=//span[contains(@class,'validation-status')]
...    alert.document_status=//span[contains(@class,'document-status')]
...    alert.account_status=//span[contains(@class,'account-status')]
...    alert.invoice_status=//span[contains(@class,'invoice-status')]
...    alert.summary=//div[@class='summary']

${button.close}    .pull-left.btn-close
${button.save_and_close}    .btn-save
${button.add_appointment}    .btn-primary
${button.new_booking}    .new-booking
${button.patient_dashboard}    .btn-patient-dashboard
${button.debtor_edit}    .btn-debtor-edit
${button.patient_file}    .btn-clinical-history
${button.account_details}    .btn-account-details
${button.invoice}    .invoice
${button.clinical}    .clinical
${button.receipt}    .btn-receipt
${button.sms}    .btn-sms
${button.whatsapp}    .btn-whatsapp
${button.email}    .btn-email
${button.save}    .btn-save
${button.print_booking_label}    .btn.btn-primary[title*='Print Booking Label']
