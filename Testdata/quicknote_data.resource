*** Settings ***
Documentation    This file contains the dictionaries for quicknote data used in the test case: Adding a quicknote (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Variables ***
&{QUICKNOTE_INFO}
    ...    input.text=Patient reported mild headache. Prescribed paracetamol.
    ...    attach.image=sample_headache_image.png
    ...    attach.pdf=prescription_headache.pdf
    ...    print.with_image=True
    ...    print.with_text=True
    ...    print.with_pdf=True

&{NEW_PATIENT_BOOKING}
    ...    input.patient_firstname=Alex
    ...    input.patient_surname=Brown
    ...    input.patient_gender=Male
    ...    input.patient_dob=1992-07-15
    ...    input.patient_cell=0812345678
    ...    select.booking_type=Consultation
    ...    select.booking_status=Booked
    ...    input.booking_time=10:30
    ...    input.booking_duration=20
    ...    input.booking_reason=Initial assessment
    ...    input.debtor_added=False

&{EXPECTED_QUICKNOTE_RESULT}
    ...    quicknote_saved=True
    ...    quicknote_printable=True
    ...    contains_image=True
    ...    contains_text=True
    ...    contains_pdf=True
