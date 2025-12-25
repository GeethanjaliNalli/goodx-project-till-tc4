*** Settings ***
Documentation    This file contains the dictionary for quick note data used in the 'Adding a quicknote' test case (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
...    select_quick_note=QUICK NOTE
...    add_text_to_textbox=Patient requires urgent follow-up.
...    add_text_to_the_text=Follow-up scheduled for 2025-12-10.
...    choose_file=${EXECDIR}/Testdata/sample-image.jpg
...    upload_a_pdf_file_by=${EXECDIR}/Testdata/sample-document.pdf
