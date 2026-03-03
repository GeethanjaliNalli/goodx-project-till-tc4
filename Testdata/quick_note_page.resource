*** Settings ***
Documentation    This file contains the dictionaries for quick note test data used in the test case: Adding a quicknote.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quicknote_text=Test@123
    ...    input.quicknote_image=quicknote_sample_image.png
    ...    input.quicknote_pdf=quicknote_sample_attachment.pdf
