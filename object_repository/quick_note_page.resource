*** Settings ***
Documentation    This file contains all types of locators for the Quick Note functionality on the booking/diary page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICK_NOTE_LOCATORS}
...    button.clinical=.btn.btn-xs.btn-default.pull-right.import-debtor
...    dropdown.forms.library=.ui-dialog.ui-corner-all .form-control.input-sm.type.validation
...    input.quicknote.text=.ui-dialog.ui-corner-all .form-control.input-sm.reason.validation
...    button.add.image=.btn.btn-xs.btn-info.mr10.pull-right
...    button.upload.from.file=.btn.btn-xs.btn-default.pull-right.btn-repeat-booking
...    input.choose.file=.form-control.input-sm.ma_number.validation
...    button.save=.btn.btn-sm.btn-success.pull-right.btn-save
...    button.print=.btn.btn-sm.btn-danger.pull-left.btn-close
