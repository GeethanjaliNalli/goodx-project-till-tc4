*** Settings ***
Documentation    Diary page locators used for Add Sick Note action.
Resource         ../common/super.resource

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_ADD_SICK_NOTE_LOCATORS}
...    button.clinical_sidebar           css:a.btn-sidebar.btn.btn-sm.clinical
...    button.expand_patient_details     css:button[data-bind*="ExpandAll"]
...    button.open_clinical_section      css:a[data-bind*="subscreens().clinical"]
...    select.forms_library              css:select[data-bind*="clinical_workflow_event_types"]
...    option.sick_note                  xpath://option[normalize-space()='SICK NOTE']
...    input.sick_note_date              css:input[data-bind*="datePicker"]
...    button.expand_previous_sick_notes css:select[data-bind*="clinical_workflow_event_types"]
...    button.expand_medical_certificate css:button[data-bind*="Print"]
...    button.expand_light_duty          css:button[data-bind*="Save"]
...    button.expand_family_responsibility_certificate css:button.btn.btn-sm.fr
...    input.unfit_for_work_checkbox     css:input[type='checkbox'][name*='unfit']
...    textarea.extra_information        css:textarea[name*='extra_information']
...    button.doctor_signature           css:button[data-bind*="DebtorAddEdit"]
...    input.doctor_pin                  css:input[type='password'][name*='pin']
...    button.email                      css:button.btn-email[data-bind*="Email"]
...    button.print_download             css:button.btn-primary[data-bind*="Print"]
...    button.preview_medical_certificate css:button[data-bind*="PatientDashboard"]
...    button.close                      css:button.pull-left.btn-close

# Standalone locators (if any, for modal/dialog close etc)
${button.close}    css:button.pull-left.btn-close
