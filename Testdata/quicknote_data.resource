*** Settings ***
Documentation    This file contains the dictionaries for quicknote data used in the test case: Adding a quicknote to a booking, including images, text, and PDF details.
Resource    ../common/super.resource

*** Variables ***
&{QUICKNOTE_INFO}
    ...    input.note_type=Quick Note
    ...    input.text=Patient reported mild headache. Attached image and PDF as reference.
    ...    attach.image_path=resources/images/headache-symptom.jpg
    ...    attach.pdf_path=resources/docs/patient-reference.pdf
    ...    input.created_by=Dr. TestUser
    ...    input.created_on=2025-12-01
    ...    input.visibility=Private
    ...    input.tags=Headache, Reference

&{EXPECTED_QUICKNOTE_DATA}
    ...    note_type=Quick Note
    ...    text=Patient reported mild headache. Attached image and PDF as reference.
    ...    image_file=headache-symptom.jpg
    ...    pdf_file=patient-reference.pdf
    ...    created_by=Dr. TestUser
    ...    created_on=2025-12-01
    ...    visibility=Private
    ...    tags=Headache, Reference
