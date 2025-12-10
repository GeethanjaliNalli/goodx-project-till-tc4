*** Settings ***
Documentation    This file contains all types of locators for the Quick Note functionality (Add Quick Note to Booking).

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICK_NOTE_LOCATORS}
...    button.select_booking=.btn.booking-display.btn-primary
...    button.open_clinical=.btn-sidebar.btn.btn-sm.clinical
...    select.forms_library=.form-control.event-type.mb20
...    option.quick_note=//option[normalize-space()='QUICK NOTE']
...    button.add_image=.btn.btn-file.btn-clinical-event
...    button.save_quick_note=.btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    input.quick_note_text=.input-sm
...    button.print_quick_note=.btn.btn-sm.btn-success.btn-print
...    dialog.select_booking= .ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
...    button.forms_library_dropdown=button[data-toggle="dropdown"]
...    button.patient=button.patient-btn
...    button.add_image_dialog=button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
...    button.upload_from_file=//button[normalize-space(.)="mygc"]
...    button.choose_file=button.btn.btn-file
...    button.select_picture=button.patient-btn
...    button.save=button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    input.quick_note_textbox=input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]
...    button.upload_pdf=button.btn.btn-file
...    button.select_pdf=button.btn.booking-display
...    button.print=button[data-bind="processEvent: { click: 'Print' }"]
