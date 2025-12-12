*** Settings ***
Documentation    This file contains all types of locators for the Quick Note functionality on the booking/diary page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICK_NOTE_LOCATORS}
...    button.select_booking=.btn.booking-display.btn-primary
...    button.clinical_sidebar=.btn-sidebar.btn.btn-sm.clinical
...    select.forms_library_dropdown=.form-control.event-type.mb20
...    option.quick_note=//option[normalize-space()='QUICK NOTE']
...    button.forms_library_dropdown_toggle=button[data-toggle="dropdown"]
...    button.patient=button.patient-btn
...    button.add_image=button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
...    button.upload_from_file=button.btn.btn-file
...    button.save=.btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    input.quick_note_textbox=.input-sm
...    input.quick_note_text=input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]
...    button.print=.btn.btn-sm.btn-success.btn-print
...    button.save_dialog=button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    button.print_dialog=button[data-bind="processEvent: { click: 'Print' }"]
...    button.select_pdf=button.btn.booking-display
...    button.upload_pdf=button.btn.btn-file
...    button.upload_image=button.btn.btn-file
...    button.upload_from_mygc=//button[normalize-space(.)="mygc"]
...    dialog.select_booking=.ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
