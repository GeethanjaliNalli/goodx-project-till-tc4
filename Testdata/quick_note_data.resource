*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test case: Adding a quicknote.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    textbox.quicknote_reason=Test@123
    ...    input.upload_file=Testdata/sample-image.png
    ...    input.upload_pdf=Testdata/sample-document.pdf
