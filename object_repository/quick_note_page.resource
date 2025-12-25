*** Settings ***
Documentation    This file contains all types of locators for the Quick Note functionality (Add Quick Note to Booking).

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.select.booking}                  .btn.booking-display.btn-primary
${button.clinical}                        .btn-sidebar.btn.btn-sm.clinical
${dropdown.forms.library}                 .form-control.event-type.mb20
${option.quick.note}                      //option[normalize-space()='QUICK NOTE']
${button.add.image}                       .btn.btn-file.btn-clinical-event
${button.upload.from.file}                //button[normalize-space(.)='mygc']
${button.choose.file}                     button.btn.btn-file
${input.quicknote.text}                   input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]
${button.upload.pdf}                      button.btn.btn-file
${button.select.pdf}                      button.btn.booking-display
${button.save.quicknote}                  .btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${button.print.quicknote}                 .btn.btn-sm.btn-success.btn-print
${button.forms.library.dropdown}          button[data-toggle="dropdown"]
${button.patient}                         button.patient-btn
${button.add.image.alt}                   button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
${button.save.alt}                        button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${button.print.alt}                       button[data-bind="processEvent: { click: 'Print' }"]
${dialog.select.booking}                  .ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
