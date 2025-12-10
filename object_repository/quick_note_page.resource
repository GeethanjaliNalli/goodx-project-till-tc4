*** Settings ***
Documentation    This file contains all types of locators for the Quick Note functionality (Add Quicknote to Booking).

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICK_NOTE_LOCATORS}
...    button.select_booking=.btn.btn-sm.btn-primary.new-booking
...    button.clinical=.btn.btn-xs.btn-default.pull-right.btn-repeat-booking
...    dropdown.forms_library=.ui-dialog.ui-corner-all .btn.btn-xs.col-sm-3
...    dropdown.forms_library_input=.ui-dialog.ui-corner-all input[data-bind="value: duration"]
...    button.add_image=.btn.btn-default.mt15.add-employer
...    button.upload_from_file=.btn.btn-xs.btn-info.mr10.pull-right
...    input.upload_file=input[type="file"]
...    textbox.quicknote_reason=.ui-dialog.ui-corner-all .form-control.input-sm.reason.validation
...    button.save_quicknote=.btn.btn-sm.btn-success.pull-right.btn-save
...    button.print_quicknote=.btn.btn-sm.btn-info.pull-right.mr5
...    # Additional locators for selection and attachments
...    input.select_booking=input[data-bind="value: surname, enable: uid.new()"]
...    input.select_quicknote=input[data-bind="value: surname, enable: uid.new()"]
...    input.add_image=input[data-bind="value: surname, enable: uid.new()"]
...    input.choose_file=input[data-bind="value: surname, enable: uid.new()"]
...    input.select_picture=input[data-bind="value: surname, enable: uid.new()"]
...    input.add_text=input[data-bind="value: surname, enable: uid.new()"]
...    input.upload_pdf=input[data-bind="value: surname, enable: uid.new()"]
...    input.select_pdf=input[data-bind="value: surname, enable: uid.new()"]
