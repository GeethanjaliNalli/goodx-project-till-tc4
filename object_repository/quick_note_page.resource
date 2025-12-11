*** Settings ***
Documentation    This file contains all types of locators for the Quick Note functionality in Booking/Diary.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICK_NOTE_LOCATORS}
...    button.select_booking=.btn.booking-display.btn-primary
...    button.clinical_sidebar=.btn-sidebar.btn.btn-sm.clinical
...    dropdown.forms_library=.form-control.event-type.mb20
...    option.quick_note=//option[normalize-space()='QUICK NOTE']
...    button.upload_image=.btn.btn-file.btn-clinical-event
...    button.upload_pdf=.btn.btn-file.btn-clinical-event
...    input.quick_note_text=.input-sm
...    button.save=.btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
...    button.print=.btn.btn-sm.btn-success.btn-print
...    dialog.select_booking= .ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
...    dropdown.forms_library_button=button[data-toggle="dropdown"]
...    button.quick_note_select=button.patient-btn
...    button.add_image=button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
...    button.choose_file=button.btn.btn-file
...    button.select_picture=button.patient-btn
...    input.quick_note_textbox=input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]
...    button.upload_pdf_file=button.btn.btn-file
...    button.select_pdf=button.btn.booking-display
...    button.print_action=button[data-bind="processEvent: { click: 'Print' }"]
