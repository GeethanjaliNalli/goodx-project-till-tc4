*** Settings ***
Documentation    This file contains the test data for adding a quicknote to a booking, including text, image, and PDF file inputs.
Resource    ../common/super.resource

*** Variables ***
&{QUICKNOTE_DATA}
    ...    input.quicknote_text=Test@123
    ...    input.quicknote_image=resources/images/sample-quicknote-image.png
    ...    input.quicknote_pdf=resources/docs/sample-quicknote-document.pdf
