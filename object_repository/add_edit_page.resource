*** Settings ***
Documentation       This file contains Add/Edit Page locators for Quick Note functionality.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICKNOTE_LOCATORS}
...    input.text=//label[t[text()='Quick Note']]/following-sibling::textarea | .quicknote-textarea
...    button.add_image=.btn-add-image
...    button.add_pdf=.btn-add-pdf
...    button.print_quicknote=.btn-print-quicknote
...    dialog.quicknote_modal=.quicknote-dialog

${input.text}    //label[t[text()='Quick Note']]/following-sibling::textarea | .quicknote-textarea
${button.add_image}    .btn-add-image
${button.add_pdf}    .btn-add-pdf
${button.print_quicknote}    .btn-print-quicknote
${dialog.quicknote_modal}    .quicknote-dialog
