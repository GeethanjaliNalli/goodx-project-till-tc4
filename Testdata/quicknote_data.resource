*** Settings ***
Documentation    This file contains the dictionary for quick note data used in the 'Adding a quicknote' test case.
Resource    ../common/super.resource

*** Variables ***
&{QUICKNOTE_DATA}
    ...    input.text=Test@123
    ...    upload.image=quicknote_sample_image.png
    ...    upload.pdf=quicknote_sample_attachment.pdf
