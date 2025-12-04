*** Settings ***
Documentation    Diary Script locators used for prescription creation, completion, signing, emailing, and printing.
Resource         ../common/super.resource

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_SCRIPT_LOCATORS}
...    button.patient_booking        css:.btn.booking-display.btn-primary
...    button.clinical               css:.btn-sidebar.btn.btn-sm.clinical
...    button.script                 css:a[data-bind="text: description"]
...    select.script_type            css:select[name="scriptType"]
...    input.diagnosis               css:input[data-bind*="icd10"]
...    button.add_medication         css:button[data-bind*="onAddItemClick"]
...    input.medicine_search         css:input[data-bind*="medicine_search"]
...    option.medicine_item          css:a[data-bind="text: description"]
...    textarea.directions           css:textarea.form-control.input-sm.medical-note
...    input.total_quantity          css:input[name="totalQuantity"]
...    input.repeat_count            css:input[name="repeatCount"]
...    checkbox.not_substitutable    css:input[type="checkbox"].not-substitutable
...    button.add_signature          css:button.btn.btn-xs.btn-success.fr.ml2.btn-favourite
...    button.complete_script        css:button.btn.btn-sm.w100.btn-finalize.btn-success
...    button.email_script           css:button.btn.btn-sm.btn-tumblr.btn-email.p5
...    button.print_script           css:button.btn.btn-sm.btn-success.btn-print
...    button.save_and_close         css:button.btn.btn-success.btn-sm.btn-save
...    icon.script_action            css:a[data-bind="text: description"]
...    qr_code                       css:img.qr-code
...    button.email                  css:button[data-bind*="Email"]

# Standalone locators
${button.close}    css:.pull-left.btn-close
