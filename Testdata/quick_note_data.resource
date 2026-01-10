*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test cases.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quicknote_text=Patient requires urgent wheelchair access at main entrance.
    ...    file.image_1=TestAssets/quicknote_image1.jpg
    ...    file.image_2=TestAssets/quicknote_image2.png
    ...    file.pdf_1=TestAssets/quicknote_attachment.pdf
