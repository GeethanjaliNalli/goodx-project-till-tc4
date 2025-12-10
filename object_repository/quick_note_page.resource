*** Settings ***
Documentation     This file contains all locators for the Quick Note functionality (adding, uploading, saving, printing) on a booking.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICK_NOTE_LOCATORS}
...    button.select_booking=.btn.booking-display.btn-primary
...    button.clinical_sidebar=.btn-sidebar.btn.btn-sm.clinical
...    select.forms_library=.form-control.event-type.mb20
...    option.quick_note=//option[normalize-space()='QUICK NOTE']
...    button.add_image=.btn.btn-file.btn-clinical-event
...    button.upload_from_file=button.btn.btn-file
...    button.upload_pdf=button.btn.btn-file
...    input.add_text=.input-sm
...    input.quick_note_text=input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]
...    button.save=.btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    button.save_dialog=button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    button.print=.btn.btn-sm.btn-success.btn-print
...    button.print_dialog=button[data-bind="processEvent: { click: 'Print' }"]
...    button.forms_library_dropdown=button[data-toggle="dropdown"]
...    button.select_patient=button.patient-btn
...    button.select_booking_dialog=.ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
...    button.add_image_dialog=button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
...    button.upload_from_file_dialog=//button[normalize-space(.)="mygc"]
...    button.select_pdf=button.btn.booking-display

