*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test cases.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quick_note_text=Patient requires urgent blood test and follow-up.
    ...    file.image_path=Testdata/sample_image.jpg
    ...    file.pdf_path=Testdata/sample_document.pdf
