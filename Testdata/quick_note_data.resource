*** Settings ***
Documentation    This file contains the dictionaries for quick note test data used in the test case: Adding a quicknote.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    quick_note_text=Test@123
    ...    image_file=resources/test_images/sample_image.png
    ...    pdf_file=resources/test_pdfs/sample_document.pdf
