*** Settings ***
Documentation       This file contains the locators for Diary - Add Sick note page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_ADD_SICK_NOTE_LOCATORS}
...    select.forms.library=select.form-control.event-type
...    listitem.sicknote=//option[normalize-space(text())='SICK NOTE']
...    button.add.sicknote=//button[span[contains(text(),'SICK NOTE')]]
...    button.save=button.btn-save
...    button.print=button.btn-print
