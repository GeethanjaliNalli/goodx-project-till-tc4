*** Settings ***
Documentation    Test data for Adding a quicknote to a booking (TC00005_Diary_Add Quicknote).

*** Variables ***
&{QUICK_NOTE_VALID}
...    note_text=Patient requested follow-up on medication.
...    booking_id=BK12345
...    patient_name=John Doe
...    created_by=automation
...    timestamp=2025-12-11 14:00:00

&{QUICK_NOTE_EMPTY}
...    note_text=
...    booking_id=BK12345
...    patient_name=John Doe
...    created_by=automation
...    timestamp=2025-12-11 14:00:00

&{QUICK_NOTE_LONG_TEXT}
...    note_text=${'A'*1025}
...    booking_id=BK12345
...    patient_name=John Doe
...    created_by=automation
...    timestamp=2025-12-11 14:00:00

&{QUICK_NOTE_SPECIAL_CHARS}
...    note_text=Note with special chars !@#$%^&*()_+-=[]{}|;':,.<>/?
...    booking_id=BK12345
...    patient_name=John Doe
...    created_by=automation
...    timestamp=2025-12-11 14:00:00
