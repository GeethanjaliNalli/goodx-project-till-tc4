*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test case: Adding a quicknote.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    button.clinical=Clinical
    ...    dropdown.forms.library=Medical Certificate
    ...    input.quicknote.text=Test@123
    ...    button.add.image=sample_image.png
    ...    button.upload.from.file=sample_document.pdf
    ...    input.choose.file=sample_document.pdf
    ...    button.save=Save
    ...    button.print=Print
