*** Settings ***
Documentation    This file contains the dictionaries for quick note test data used in the test case: Adding a quicknote (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    QUICK_NOTE_TEXTAREA=Test@123
    ...    UPLOAD_IMAGE_FILE_INPUT=TestFiles/sample-image.png
    ...    UPLOAD_PDF_FILE_INPUT=TestFiles/sample-document.pdf
