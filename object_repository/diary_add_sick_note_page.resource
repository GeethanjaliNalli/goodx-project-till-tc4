*** Settings ***
Documentation       This file contains Diary - Add Sick Note Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{PATIENT_DETAILS_LOCATORS}
...    input.patient.surname=//label[t[text()='Surname']]/following-sibling::input
...    input.patient.firstname=//label[t[text()='First Name']]/following-sibling::input
...    input.patient.dob=//label[t[text()='Date of Birth']]/following-sibling::input
...    input.patient.idnumber=//label[t[text()='ID Number']]/following-sibling::input
...    select.patient.gender=//label[t[text()='Gender']]/following-sibling::select
...    input.patient.cellphone=//label[t[text()='Cellphone']]/following-sibling::input
...    input.patient.email=//label[t[text()='Email']]/following-sibling::input
...    input.patient.address=//label[t[text()='Address']]/following-sibling::input
...    input.patient.medicalaid=//label[t[text()='Medical Aid']]/following-sibling::input
...    input.patient.medicalaidnumber=//label[t[text()='Medical Aid Number']]/following-sibling::input

&{DEBTOR_DETAILS_LOCATORS}
...    input.debtor.surname=//label[t[text()='Debtor Surname']]/following-sibling::input
...    input.debtor.firstname=//label[t[text()='Debtor First Name']]/following-sibling::input
...    input.debtor.idnumber=//label[t[text()='Debtor ID Number']]/following-sibling::input
...    input.debtor.cellphone=//label[t[text()='Debtor Cellphone']]/following-sibling::input
...    input.debtor.email=//label[t[text()='Debtor Email']]/following-sibling::input
...    input.debtor.address=//label[t[text()='Debtor Address']]/following-sibling::input

&{SICK_NOTE_FORM_LOCATORS}
...    input.sicknote.date=//label[t[text()='Date Issued']]/following-sibling::input
...    input.sicknote.startdate=//label[t[text()='Start Date']]/following-sibling::input
...    input.sicknote.enddate=//label[t[text()='End Date']]/following-sibling::input
...    textarea.sicknote.reason=//label[t[text()='Reason for Absence']]/following-sibling::textarea
...    select.sicknote.duration=//label[t[text()='Duration']]/following-sibling::select
...    input.sicknote.diagnosis=//label[t[text()='Diagnosis']]/following-sibling::input
...    input.sicknote.treatingdoctor=//label[t[text()='Treating Practitioner']]/following-sibling::input
...    input.sicknote.practice=//label[t[text()='Practice Number']]/following-sibling::input
...    input.sicknote.hpcsa=//label[t[text()='HPCSA Number']]/following-sibling::input
...    input.sicknote.icd10=//label[t[text()='ICD-10 Code']]/following-sibling::input
...    checkbox.sicknote.backdated=//label[t[text()='Backdated']]/preceding-sibling::input[@type='checkbox']
...    checkbox.sicknote.fitforwork=//label[t[text()='Fit for Work']]/preceding-sibling::input[@type='checkbox']
...    input.sicknote.signature=//label[t[text()='Doctor Signature']]/following-sibling::input
...    input.sicknote.qrcode=//label[t[text()='QR Code']]/following-sibling::input

&{ACTION_BUTTON_LOCATORS}
...    button.save=[type="submit"]
...    button.cancel=.btn-cancel
...    button.sign=.btn-sign
...    button.print=.btn-print
...    button.email=.btn-email
...    button.close=.pull-left.btn-close

&{DIALOG_LOCATORS}
...    dialog.sicknote=.sicknote-dialog
...    dialog.confirmation=.confirmation-dialog
...    dialog.success=.success-dialog
...    dialog.error=.error-dialog
...    label.dialog.title=.ui-dialog-title
...    button.dialog.ok=.btn-ok
...    button.dialog.cancel=.btn-cancel

&{AUTOCOMPLETE_LOCATORS}
...    input.search.treatingdoctor=//label[t[text()='Treating Practitioner']]/following-sibling::input
...    list.suggestions.treatingdoctor=.ui-autocomplete
...    item.suggestion.treatingdoctor=.ui-menu-item
...    button.clear.treatingdoctor=.btn-clear-doctor

&{TABLE_GRID_LOCATORS}
...    table.diary=.diary-table
...    table.diary.header=.diary-table thead tr
...    table.diary.row=.diary-table tbody tr
...    table.diary.row.time=.diary-table tbody tr td.time
...    table.diary.row.name=.diary-table tbody tr td.name
...    table.diary.row.status=.diary-table tbody tr td.status
...    button.diary.row.edit=.diary-table tbody tr .btn-edit
...    button.diary.row.delete=.diary-table tbody tr .btn-delete

&{WARNING_ALERT_LOCATORS}
...    alert.validation=.alert-validation
...    alert.success=.alert-success
...    alert.error=.alert-error
...    icon.warning=.icon-warning
...    icon.info=.icon-info

${button.close.dialog}    .pull-left.btn-close
${dialog.sicknote}    .sicknote-dialog
${dialog.confirmation}    .confirmation-dialog
${dialog.success}    .success-dialog
${dialog.error}    .error-dialog
