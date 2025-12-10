*** Settings ***
Documentation    This file contains test data dictionaries for Adding a Quick Note to a booking.
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_INFO}
    ...    textarea.quick_note_text=Patient requires urgent wheelchair access at entrance.
    ...    button.save_quick_note=Save
    ...    button.print_quick_note=Print
