*** Settings ***
Documentation    Test data for Adding a quicknote (TC00005_Diary_Add Quicknote)
Resource    ../common/super.resource

*** Variables ***
&{QUICK_NOTE_INPUT}
    ...    note_type=General
    ...    note_text=Patient requested wheelchair access for next appointment.
    ...    priority=Medium
    ...    created_by=automation
    ...    associated_booking_id=BOOKING12345
    ...    timestamp=2025-12-12 10:30:00

&{EXPECTED_QUICK_NOTE}
    ...    note_type=General
    ...    note_text=Patient requested wheelchair access for next appointment.
    ...    priority=Medium
    ...    displayed=True
    ...    created_by=automation
    ...    associated_booking_id=BOOKING12345
