*** Settings ***
Documentation    This file contains the dictionaries for Quick Note test data used in the test case: Adding a quicknote.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_DATA}
    ...    input.quick_note_text=Patient needs follow-up for blood pressure check
    ...    input.quick_note_description=Follow-up required in 2 weeks for blood pressure monitoring
