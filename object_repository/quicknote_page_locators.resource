*** Settings ***
Documentation    Quicknote page locators used for Adding a quicknote.
Resource         ../common/super.resource

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICKNOTE_PAGE_LOCATORS}
...    button.select_booking           css:.btn.booking-display.btn-primary
...    button.clinical                 css:.btn-sidebar.btn.btn-sm.clinical
...    button.forms_library_dropdown   css:button[data-toggle="dropdown"]
...    option.quick_note               xpath://li/a[normalize-space(text())='QUICK NOTE']
...    textarea.quicknote_text         css:textarea.input-sm
...    button.add_image                xpath://button[normalize-space(text())='Add Image']
...    button.upload_image             css:button.btn.btn-file
...    input.upload_image_file         css:input[type='file']
...    button.add_pdf                  xpath://button[normalize-space(text())='Add PDF']
...    button.upload_pdf               css:button.btn.btn-file
...    input.upload_pdf_file           css:input[type='file']
...    button.save_quicknote           css:button.btn.btn-sm.btn-primary.w100.mb5
...    button.print_quicknote          css:button.btn.btn-sm.btn-success.btn-print

# Standalone locators
${button.close}    css:.pull-left.btn-close
