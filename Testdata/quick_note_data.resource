*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test case: Adding a quicknote.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quicknote.text=Patient requires follow-up in 2 weeks.
    ...    file.image.path=Testdata/sample_image.png
    ...    file.pdf.path=Testdata/sample_document.pdf
