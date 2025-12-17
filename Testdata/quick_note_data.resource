*** Settings ***
Documentation    Test data for Adding a quicknote (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    patient_first_name=TestPatient
    ...    patient_last_name=Quicknote
    ...    booking_date=2025-12-17
    ...    booking_time=10:00
    ...    booking_duration=15
    ...    booking_reason=Quick Note Test
    ...    quick_note_text=Test@123
    ...    quick_note_image_path=${EXECDIR}/Testdata/sample_image.png
    ...    quick_note_pdf_path=${EXECDIR}/Testdata/sample_document.pdf
    ...    expected_autocomplete=True
    ...    expected_printout_contains_image=True
    ...    expected_printout_contains_text=Test@123
    ...    expected_printout_contains_pdf=True
