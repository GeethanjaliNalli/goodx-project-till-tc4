*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test cases.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quick_note_text=Test@123
    ...    input.upload_image=${EXECDIR}/Testdata/sample_image.png
    ...    input.upload_pdf=${EXECDIR}/Testdata/sample_file.pdf
