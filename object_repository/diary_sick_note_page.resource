*** Variables ***

# Diary Sick Note Page Locators

${BTN_PATIENT_DASHBOARD}            button[data-bind="processEvent: { click: 'PatientDashboard' }"]
${BTN_CLINICAL_SIDEBAR}              .btn-sidebar.btn.btn-sm.clinical.btn-primary
${BTN_CLINICAL_DIALOG}               .ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
${DROPDOWN_FORMS_LIBRARY}            .form-control.event-type.mb20
${OPTION_SICK_NOTE}                  //option[normalize-space()='SICK NOTE']
${SELECT_WORKFLOW_EVENT_TYPE}        select[data-bind="options: $screen.clinical_workflow_event_types, optionsText: 'description', optionsCaption: t('select_a_form_to_add'), value: $screen.selected_workflow_event_type"]
${BTN_EXPAND_PATIENT_DETAILS}        button[data-bind="processEvent: { click: 'ExpandAll' }"]
${INPUT_DATE_PICKER}                 input[data-bind="datePicker: { date: current_date, format: 'ddd Do MMM YYYY' }"]
${BTN_SAVE_LIGHT_DUTY}               button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${BTN_EXPAND_PREV_SICK_NOTES}        select[data-bind="options: $screen.clinical_workflow_event_types, optionsText: 'description', optionsCaption: t('select_a_form_to_add'), value: $screen.selected_workflow_event_type"]
${BTN_EXPAND_MED_CERT_PRINT}         button[data-bind="processEvent: { click: 'Print' }"]
${BTN_EXPAND_FAMILY_RESPONSIBILITY}  button.btn.btn-sm.fr
${BTN_DOCTOR_SIGNATURE}              button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
${BTN_EMAIL}                        .btn.btn-sm.btn-tumblr.btn-email.p5
${BTN_EMAIL_SEND}                   button[data-bind="enable: $button.email.enable, processEvent: { click: 'Email' }"]
${BTN_PRINT_DOWNLOAD}               .btn.btn-sm.btn-primary.w100
${BTN_PRINT_CHOOSE_DOWNLOAD}        button[data-bind="processEvent: { click: 'Print' }"]
${BTN_PREVIEW_MED_CERT}             button[data-bind="processEvent: { click: 'PatientDashboard' }"]
${BTN_MOUTH_DIAGNOSIS}              .ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().mouth_diagnosis)"]
