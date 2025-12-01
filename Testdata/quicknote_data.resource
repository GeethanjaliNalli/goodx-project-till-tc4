*** Settings ***
Documentation    This file contains the test data dictionary for adding a quick note to a booking, including text, image, and PDF file inputs.
Resource    ../common/super.resource

*** Variables ***
&{QUICKNOTE_DATA}
    ...    input.text=Test@123
    ...    upload.image=sample-image.jpg
    ...    upload.pdf=sample-document.pdf
