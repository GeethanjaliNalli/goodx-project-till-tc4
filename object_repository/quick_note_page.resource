*** Settings ***
Documentation       This file contains all types of locators for the Quick Note functionality (Add Quicknote to Booking).

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICK_NOTE_LOCATORS}
...    button.select_booking=.btn.btn-sm.btn-primary.new-booking
...    button.clinical=.btn.btn-xs.btn-info.mr10.pull-right
...    dropdown.forms_library=.ui-dialog.ui-corner-all .btn.btn-xs.col-sm-3
...    option.quick_note=//li[contains(.,'Quick Note')]
...    button.add_image=.btn.btn-default.mt15.add-employer
...    button.upload_from_file=.btn.btn-xs.btn-default.pull-right.import-debtor
...    input.upload_image=//input[@type='file' and contains(@accept, 'image')]
...    button.save=.btn.btn-sm.btn-success.pull-right.btn-save
...    input.quick_note_text=.ui-dialog.ui-corner-all .form-control.input-sm.reason.validation
...    button.print=.btn.btn-sm.btn-info.pull-right.mr5
...    input.upload_pdf=//input[@type='file' and contains(@accept, 'pdf')]
...    label.uploaded_image_preview=.uploaded-image-preview
...    label.uploaded_pdf_preview=.uploaded-pdf-preview
...    dialog.quick_note=.ui-dialog.ui-corner-all.quick-note-dialog
...    label.quick_note_title=.ui-dialog-titlebar > span
...    button.close_dialog=.ui-dialog-titlebar-close
...    label.print_preview=.print-preview
