*** Settings ***
Documentation    This file contains the test data for adding a quick note to a booking.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    note_text=Test@123
    ...    image_path=Testdata/resources/sample_image.png
    ...    pdf_path=Testdata/resources/sample_document.pdf
