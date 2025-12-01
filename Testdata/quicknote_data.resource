*** Settings ***
Documentation    This file contains the test data dictionary for adding a quick note to a booking, including text, image, and PDF file uploads.
Resource    ../common/super.resource

*** Variables ***
&{QUICKNOTE_DATA}
    ...    input.quicknote_text=Patient reported mild headache and provided previous prescription.
    ...    upload.image_file=resources/test_files/quicknote_image_sample.jpg
    ...    upload.pdf_file=resources/test_files/quicknote_attachment_sample.pdf
