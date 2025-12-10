*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test case: Adding a quicknote.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quick_note_text=Patient requires follow-up for test results.
    ...    file.image_path=TestFiles/sample_image.jpg
    ...    file.pdf_path=TestFiles/sample_document.pdf
