*** Settings ***
Documentation     This file contains all types of locators for the Diary Sick Note (Medical Certificate) page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_SICK_NOTE_LOCATORS}
...    button.clinical_sidebar=.btn-sidebar.btn.btn-sm.clinical
...    dropdown.forms_library=.form-control.event-type.mb20
...    option.sick_note=//option[normalize-space()='SICK NOTE']
...    button.expand_patient_details=button[data-bind="processEvent: { click: 'ExpandAll' }"]
...    dropdown.clinical_event_type=select[data-bind="options: $screen.clinical_workflow_event_types, optionsText: 'description', optionsCaption: t('select_a_form_to_add'), value: $screen.selected_workflow_event_type"]
...    input.sick_note_date=input[data-bind="datePicker: { date: current_date, format: 'ddd Do MMM YYYY' }"]
...    button.doctor_signature=.btn.btn-file.btn-clinical-event
...    button.doctor_signature_alt=button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
...    button.email=.btn-sm.btn-tumblr.btn-email.p5
...    button.email_alt=button[data-bind="enable: $button.email.enable, processEvent: { click: 'Email' }"]
...    button.print_download=.btn.btn-sm.btn-primary.w100
...    button.print=button[data-bind="processEvent: { click: 'Print' }"]
...    button.family_responsibility=button.btn.btn-sm.fr
...    button.save=button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    sidebar.mouth_diagnosis=.ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().mouth_diagnosis)"]
...    sidebar.clinical=.ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
...    button.patient_dashboard=button[data-bind="processEvent: { click: 'PatientDashboard' }"]
