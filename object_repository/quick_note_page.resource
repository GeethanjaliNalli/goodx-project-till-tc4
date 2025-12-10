*** Settings ***
Documentation    This file contains all types of locators for the Quick Note functionality.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICK_NOTE_LOCATORS}
...    button.select_booking=.btn.booking-display.btn-primary
...    button.clinical_sidebar=.btn-sidebar.btn.btn-sm.clinical
...    select.forms_library=.form-control.event-type.mb20
...    option.quick_note=//option[normalize-space()='QUICK NOTE']
...    button.add_image=.btn.btn-file.btn-clinical-event
...    button.upload_file=button.btn.btn-file
...    button.upload_pdf=button.btn.btn-file
...    input.textbox=.input-sm
...    input.quick_note_text=input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]
...    button.save=.btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    button.save_alt=button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    button.print=.btn.btn-sm.btn-success.btn-print
...    button.print_alt=button[data-bind="processEvent: { click: 'Print' }"]
...    button.forms_library_dropdown=button[data-toggle="dropdown"]
...    button.select_quick_note=button.patient-btn
...    button.add_image_alt=button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
...    button.upload_from_file=//button[normalize-space(.)="mygc"]
...    button.select_picture=button.patient-btn
...    button.select_pdf=button.btn.booking-display
