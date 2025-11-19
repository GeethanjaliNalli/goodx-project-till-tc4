*** Settings ***
Documentation       This file contains all types of locators for the Add/Edit Booking page.


*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{BOOKING_FORM_LOCATORS}
...    select.type=.row:nth-of-type(1) .input-sm.type
...    select.status=.input-sm.status
...    input.date=.input-sm.date
...    input.time=//t[text()="Time"]/following-sibling::input
...    input.duration=[name='duration']
...    input.reason=.input-sm.reason
...    input.names=//label[t[text()='Name(s)']]/following-sibling::input
...    input.debtor.surname=[name='debtor_surname']
...    input.cellphone=//label[t[text()='Cellphone']]/following-sibling::input
...    select.idtype=div>.input-sm.idtype
...    input.idnumber=div>.input-sm.idnumber
...    input.medicalaid=.input-sm.ma_schemename
...    input.maoption=.input-sm.ma_optionname
...    input.manumber=.input-sm.ma_number
...    select.gender=div >.input-sm.gender
...    input.initials=div >.input-sm.initials
...    select.title=div >.input-sm.title
...    input.name=//label[t[normalize-space(text())='Name']]/input
...    input.patient.surname=//label[t[text()='Surname']]/input
...    input.patient.cellno=label > .input-sm.cellnr
...    select.patient.idtype=label>.input-sm.idtype
...    input.patient.id=//label[t[text()='ID No.']]/input
...    input.dob=.input-sm.dateofbirth
...    input.patient.initials=div >.input-sm.initials
...    select.patient.dependent.no=.input-sm.dependant-nr
...    select.patient.dependent.type=//label[t[text()='Dependant Type']]/select
...    select.patient.gender=label >.input-sm.gender
...    select.patient.title=label >.input-sm.title
...    button.save=[type="submit"]
...    button.close=.pull-left.btn-close

${label.addeditbooking}    [class="ui-dialog-title"]
${button.duplicate.debtor}     .duplicate-debtor
${button.save}    [type="submit"]
${button.close}    .pull-left.btn-close
${button.delete}    .btn-delete.btn-danger
${input.search}    //input[@placeholder='Search Debtor by *File no., +MA Scheme, #MA no., Account, Name, Surname, ID or Mobile.']
${button.warning.ok}    //button[text()='Ok']
${label.warning}    //span[text()='Warning']
${label.warning.message}    //div[contains(text(),'Some fields are invalid.')]