*** Settings ***
Documentation       This file contains Diary Page locators for booking, patient, clinical, and sick note workflows.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_GRID_LOCATORS}
...    button.new_booking=.btn.new-booking
...    button.new_task=.btn.new-task
...    button.new_operation=.btn.new-operation
...    button.reload_bookings=.btn-reload-bookings
...    input.booking_filter=[placeholder="Filter bookings ..."]
...    button.backward_date=.btn-flat.backward
...    button.forward_date=.btn-flat.forward
...    button.today_date=.btn-flat.today
...    input.selected_date=.input-date.selected
...    button.print_diary=.print-diary
...    button.search_debtor_bookings=.btn-primary.pull-right[title*="Search for debtor bookings"]
...    button.available_timeslots=.btn-primary.pull-right[title*="available booking times"]
...    button.code_lookup=.btn-primary.pull-right[title*="procedures or ICD10"]
...    button.render_policy_dropdown=.render-policies .dropdown-menu
...    button.diary_type_dropdown=.diary-types .dropdown-menu
...    table.diary=.diary-table
...    table.diary.row=.diary-table tr
...    table.diary.row.time=.diary-table tr .time
...    table.diary.row.name=.diary-table tr .name
...    button.diary.row.delete=.diary-table tr .btn-delete
...    div.timeslot=.timeslot.ui-droppable
...    div.timeslot.time=.timeslot .time
...    div.booking=.booking.ui-draggable.ui-draggable-handle
...    div.booking.selected=.booking.ui-draggable.ui-draggable-handle.selected
...    div.booking.deleted=.booking.ui-draggable.ui-draggable-handle.deleted
...    button.booking_display=.booking-display
...    button.show_hide_tasks=.display-option .btn.btn-primary
...    button.show_hide_closed_tasks=.display-option .btn.btn-primary[title*="Hide Closed Tasks"]
...    button.advance_status=.btn-advance-status
...    button.patient_dashboard=.btn-patient-dashboard
...    button.debtor_edit=.btn-debtor-edit
...    button.clinical_history=.btn-clinical-history
...    button.account_details=.btn-account-details
...    button.invoice=.btn-sidebar.invoice
...    button.clinical=.btn-sidebar.clinical
...    button.receipt=.btn-receipt
...    button.telemed=.btn-sidebar[title*="telemed"]
...    button.admit_to_hospital=.btn-new-hospital-case
...    button.print_label=.btn.btn-primary[title*="Print Booking Label"]
...    button.sms=.btn-sms
...    button.whatsapp=.btn-whatsapp
...    button.dial=.btn-tumblr[title*="Dial"]
...    button.email_sidebar=.btn-email
...    button.request_payment=.btn-sb-layout[title*="send_payment_request"]
...    button.upload_documents=.btn-sb-layout[title*="Add Documents"]
...    button.add_appointment=.btn-sb-layout[title*="Add Appointment"]
...    button.download_invoice=.btn-sb-layout[title*="Download Invoice"]
...    button.download_receipt=.btn-sb-layout[title*="Download Receipt"]
...    button.download_statement=.btn.btn-primary[title*="Download Statement"]
...    button.close=.btn-close

&{PATIENT_DETAILS_LOCATORS}
...    label.patient_name=//div[@class='patient']//div[@class='name']/span
...    label.patient_details=//div[@class='patient']//div[@class='details']
...    label.patient_gender=//div[@class='patient']//span[contains(@data-bind, 'gender')]
...    label.patient_age=//div[@class='patient']//span[contains(text(),'years') or contains(text(),'months')]
...    label.patient_mobile=//div[@class='patient']//span[contains(@data-bind, 'mobile_no')]
...    label.patient_id_no=//div[@class='id-no']
...    label.patient_email=//div[@class='email']
...    label.patient_medical_aid=//div[@class='medical-aid']
...    label.patient_file_no=//div[@class='file-no']
...    label.patient_debtor_file_no=//div[@class='debtor-file-no']
...    img.patient_picture=.patient-summary-component .picture img
...    button.verify_patient=.btn-success.mt5
...    button.patient_dashboard_sidebar=.btn-patient-dashboard
...    button.story_mode=.btn.btn-primary.btn-xs[title*='Story Mode']
...    button.openeyes_worklist=.btn.btn-primary.btn-xs[title*='OpenEyes Worklist']
...    button.emguidance_script_portal=.btn.btn-primary.btn-xs[title*='EMGuidance Script Portal']
...    button.sticker=.btn.btn-primary.btn-xs[title*='Sticker']
...    button.quick_note=.btn.btn-primary.btn-xs[title*='Quick Note']
...    button.add_case=.add-case
...    button.edit_case=.edit-case
...    select.case_selector=.case-selector select
...    option.case_selector=//select[contains(@class,'case-selector')]//option[normalize-space()='${optionText}']
...    accordion.patient_additional_info=.details-section.collapsed
...    label.patient_address1=//strong[t[normalize-space()='address1']]/following-sibling::span
...    label.patient_address2=//strong[t[normalize-space()='address2']]/following-sibling::span
...    label.patient_address3=//strong[t[normalize-space()='address3']]/following-sibling::span
...    label.patient_medical_aid_no=//strong[t[normalize-space()='medical_aid_no']]/following-sibling::span
...    label.patient_email_info=//strong[t[normalize-space()='email']]/following-sibling::span
...    label.patient_mobile_info=//strong[t[normalize-space()='mobile_no']]/following-sibling::span

&{DEBTOR_DETAILS_LOCATORS}
...    label.debtor_name=//div[@class='debtor']//div[@class='name']/span
...    label.debtor_details=//div[@class='debtor']//div[@class='details']
...    label.debtor_file_no=//div[@class='debtor-filenumber']//span
...    label.debtor_status=//span[contains(@class,'status') and contains(@title,'Debtor Status')]
...    label.debtor_medical_aid=//div[@class='debtor']//span[contains(text(),'HEALTH4ME') or contains(text(),'AETNA')]
...    label.debtor_account_identifier=//div[@class='debtor-details']//span[contains(@data-bind,'acct_identifier')]
...    label.debtor_account_status=//span[contains(@class,'account-status')]
...    label.debtor_invoice_status=//span[contains(@class,'invoice-status')]
...    label.debtor_validation_status=//span[contains(@class,'validation-status')]
...    label.debtor_document_status=//span[contains(@class,'document-status')]
...    button.debtor_edit_sidebar=.btn-debtor-edit
...    button.account_details_sidebar=.btn-account-details
...    button.invoice_sidebar=.invoice
...    button.receipt_sidebar=.btn-receipt
...    button.download_invoice_sidebar=.btn-sb-layout[title*='Download Invoice']
...    button.download_receipt_sidebar=.btn-sb-layout[title*='Download Receipt']
...    button.download_statement_sidebar=.btn.btn-primary[title*='Download Statement']

&{BOOKING_FORM_LOCATORS}
...    input.icd10_search=[name="icd10_search"]
...    input.treatment_date=[name="treatment_date"]
...    input.absent_dates=[name="absent_dates"]
...    input.work_from_home=[name="work_from_home"]
...    input.follow_up=[name="follow_up"]
...    input.light_duty_start_date=[name="light_duty_start_date"]
...    input.light_duty_end_date=[name="light_duty_end_date"]
...    textarea.additional_comments=[name="additional_comments"]
...    select.location=.location select
...    option.location=//select[@class='form-control input-xs']//option[normalize-space()='${optionText}']
...    select.forms_library=.forms-library-dropdown select
...    option.forms_library=//select[contains(@class,'forms-library')]//option[normalize-space()='${optionText}']
...    button.load_user_signature=.btn[normalize-space()='Load User Signature']
...    input.pin=[type="password"][name="pin"]
...    button.doctor_signature=.btn[normalize-space()='Doctor Signature']
...    button.email=.btn[normalize-space()='Email']
...    button.print=.btn[normalize-space()='Print']
...    button.download=.btn[normalize-space()='Download']
...    button.preview_medical_certificate=.btn[normalize-space()='Preview Medical Certificate']
...    button.preview=.btn[normalize-space()='Preview']
...    button.save=.btn-save
...    button.save_and_close=.btn-save-list
...    button.close_footer=.btn-close
...    input.search_icd10=[placeholder="Search ICD10"]
...    list.icd10_suggestions=.ui-menu-item-wrapper
...    item.icd10_suggestion=//div[contains(@class,'ui-menu-item-wrapper') and contains(text(), '${value}')]
...    button.clear_icd10=.btn-clear-icd10
...    input.search_doctor=[placeholder="Search Doctor"]
...    list.doctor_suggestions=.ui-menu-item-wrapper
...    item.doctor_suggestion=//div[contains(@class,'ui-menu-item-wrapper') and contains(text(), '${value}')]
...    button.clear_doctor=.btn-clear-doctor
...    input.search_patient=[placeholder="Search Patient"]
...    list.patient_suggestions=.ui-menu-item-wrapper
...    item.patient_suggestion=//div[contains(@class,'ui-menu-item-wrapper') and contains(text(), '${value}')]
...    button.clear_patient=.btn-clear-patient
...    radio.extra_information=//input[@type='radio' and @value='${extraInfoOption}']
...    checkbox.unfit_for=//input[@type='checkbox' and @value='${unfitForOption}']
...    panel.patient_details=//div[contains(@class, 'panel') and .//span[normalize-space()='Patient Details']]
...    panel.previous_sick_notes=//div[contains(@class, 'panel') and .//span[normalize-space()='Previous Sick Notes from Past Week']]
...    panel.medical_certificate=//div[contains(@class, 'panel') and .//span[normalize-space()='Medical Certificate']]
...    panel.light_duty=//div[contains(@class, 'panel') and .//span[normalize-space()='Light Duty']]
...    panel.family_responsibility_certificate=//div[contains(@class, 'panel') and .//span[normalize-space()='Family Responsibility Certificate']]
...    section.dates=//section[@id='dates']
...    section.light_duty=//section[normalize-space()='Light Duty']
...    section.extra_information=//div[@class='extra-information']
...    section.unfit_for=//div[@class='unfit-for']
...    section.additional_comments=//div[@class='additional-comments']
...    section.family_responsibility=//div[@class='family-responsibility']
...    tab.sick_note=//div[@class='summary']//span[contains(text(), 'SICK NOTE')]
...    button.sick_note=//button[normalize-space()='SICK NOTE']
...    button.clinical_event=.btn-clinical-event
...    button.clinical=//button[contains(@class, 'btn-clinical') or contains(@class, 'btn-clinical-event') or contains(@class, 'btn-sidebar') and contains(@class, 'clinical')]
...    button.forms_library_dropdown=.forms-library-dropdown button
...    dynamic.dropdown.option=//div[@role='listbox']//div[normalize-space()='${optionText}']
...    dynamic.autocomplete.option=//div[contains(@class,'ui-menu-item-wrapper') and contains(text(), '${value}')]

&{WARNING_ALERT_LOCATORS}
...    dialog.toast_screen=.ToastScreen
...    div.toasts=.toasts
...    span.toast_message=.toasts .more
...    dialog.modal_header=.ui-dialog-title
...    dialog.modal_content=.ui-dialog-content
...    button.close_modal=.btn-close
...    icon.warning=icon.fa-exclamation-triangle
...    icon.success=icon.fa-check-circle
...    icon.error=icon.fa-times-circle
...    alert.validation_error=.validation-status.error
...    alert.account_status=.account-status
...    alert.invoice_status=.invoice-status
...    alert.document_status=.document-status

${button.close}    .pull-left.btn-close
