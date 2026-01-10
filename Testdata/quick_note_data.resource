*** Settings ***
Documentation    This file contains the test data dictionaries for Quick Note functionality on Booking/Diary page.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quick_note_text=This is a test quick note added via automation.
    ...    file.image_path=Testdata/sample_image.jpg
    ...    file.pdf_path=Testdata/sample_document.pdf
