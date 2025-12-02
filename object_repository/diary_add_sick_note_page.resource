*** Settings ***
Documentation    This file contains the locators for Diary - Add Sick note (Sick Note/Medical Certificate) page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_ADD_SICK_NOTE_LOCATORS}
...    button.open-clinical-forms=button.btn-sidebar.btn.btn-sm.clinical
...    select.forms-library=select.input-sm.form-control.event-type
...    button.add-sick-note=button.btn.btn-sm.btn-primary:has(t:contains('Sick Note'))
...    button.save-sick-note=button.btn.btn-save
...    button.print-sick-note=button.btn-print
