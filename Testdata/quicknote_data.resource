*** Settings ***
Documentation    This file contains the dictionaries for quick note data used in the 'Adding a quicknote' test case (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Variables ***
&{QUICKNOTE_INFO}
    ...    input.text=Patient requires urgent follow-up. See attached image and PDF for details.
    ...    attach.image=sample-image.png
    ...    attach.pdf=sample-document.pdf
    ...    printout.expected=Quick Note with image, text, and PDF rendered correctly

&{NEW_PATIENT_BOOKING}
    ...    input.patient_firstname=TestQuicknote
    ...    input.patient_lastname=User
    ...    input.booking_date=2025-12-02
    ...    input.booking_time=10:30
    ...    input.booking_duration=20
    ...    input.booking_reason=Quicknote addition
