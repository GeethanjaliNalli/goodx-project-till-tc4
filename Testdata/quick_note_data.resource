*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test case: Adding a quicknote.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quicknote_text=Test@123
    ...    input.quicknote_description=Quick note for booking
    ...    file.image_path=resources/test_images/sample-image.png
    ...    file.pdf_path=resources/test_documents/sample-document.pdf
