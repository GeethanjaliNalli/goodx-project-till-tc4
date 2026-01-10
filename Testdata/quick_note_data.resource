*** Settings ***
Documentation    This file contains test data dictionaries for Adding a Quick Note to a booking.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quick_note_text=Test@123
    ...    file.image_path=resources/test_images/sample_image.png
    ...    file.pdf_path=resources/test_docs/sample_document.pdf
