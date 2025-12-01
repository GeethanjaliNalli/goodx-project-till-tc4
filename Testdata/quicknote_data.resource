*** Settings ***
Documentation    This file contains the test data dictionary for adding a quicknote to a booking, including text, image, and PDF inputs.
Resource    ../common/super.resource

*** Variables ***
&{QUICKNOTE_DATA}
    ...    input.text=Test@123
    ...    upload.image=resources/test_images/quicknote_sample_image.png
    ...    upload.pdf=resources/test_pdfs/quicknote_sample_document.pdf
