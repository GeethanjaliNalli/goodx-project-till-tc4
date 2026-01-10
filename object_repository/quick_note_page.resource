*** Settings ***
Documentation    This file contains all types of locators for the Quick Note functionality (Add Quicknote to Booking).

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICK_NOTE_LOCATORS}
...    button.select_booking=.btn.btn-sm.btn-primary.new-booking
...    button.clinical=.btn.btn-xs.btn-default.pull-right.btn-repeat-booking
...    dropdown.forms_library=.ui-dialog.ui-corner-all .btn.btn-xs.col-sm-3
...    dropdown.forms_library_input=.ui-dialog.ui-corner-all input[data-bind="value: duration"]
...    input.quick_note= input[data-bind="value: surname, enable: uid.new()"]
...    option.quick_note= input[data-bind="value: surname, enable: uid.new()"]
...    button.add_image=.btn.btn-default.mt15.add-employer
...    button.upload_from_file=.btn.btn-xs.btn-info.mr10.pull-right
...    input.choose_file= input[data-bind="value: surname, enable: uid.new()"]
...    input.select_image= input[data-bind="value: surname, enable: uid.new()"]
...    button.upload_pdf= input[data-bind="value: surname, enable: uid.new()"]
...    input.select_pdf= input[data-bind="value: surname, enable: uid.new()"]
...    textbox.note_text=.ui-dialog.ui-corner-all .form-control.input-sm.reason.validation
...    button.save=.btn.btn-sm.btn-success.pull-right.btn-save
...    button.save_footer=button[data-bind="enable: $settings.ui.footer.button.save.enable, processEvent: { click: 'Save' }"]
...    button.print=.btn.btn-sm.btn-info.pull-right.mr5
...    button.print_footer= input[data-bind="value: surname, enable: uid.new()"]
