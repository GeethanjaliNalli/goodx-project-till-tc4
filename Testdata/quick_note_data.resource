*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test case: Adding a quicknote.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    textbox.note_text=Test@123
    ...    input.select_image=sample_image.png
    ...    input.select_pdf=sample_attachment.pdf
