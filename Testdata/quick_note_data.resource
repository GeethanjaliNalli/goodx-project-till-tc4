*** Settings ***
Documentation    This file contains the dictionary for quick note data used in the test case: Adding a quicknote (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
...    select_quick_note=QUICK NOTE
...    add_text_to_textbox=Patient is recovering well. No further action required.
