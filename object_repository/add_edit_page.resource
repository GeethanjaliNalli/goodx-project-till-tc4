*** Settings ***
Documentation       This file contains Add/Edit Page locators for Quick Note functionality.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{QUICKNOTE_LOCATORS}
...    button.open-forms-library=button[title="Forms Library"]
...    select.forms-library=select.event-type
...    item.quicknote=//span[contains(text(), 'QUICK NOTE')]
...    button.add-image=button[title="Add Image"]
...    input.quicknote.text=textarea.quicknote-text
...    button.upload-image=button[title="Upload Image"]
...    button.upload-pdf=button[title="Upload PDF"]
...    button.save-quicknote=button[title="Save Quick Note"]
...    button.print-quicknote=button[title="Print"]
...    dialog.quicknote=div.quicknote-dialog
...    label.quicknote-title=//label[t[text()='Quick Note']]

${button.close-quicknote-dialog}    .btn-close.quicknote-dialog
