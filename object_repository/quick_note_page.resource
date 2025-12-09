# robocop: disable=section-variable-not-uppercase
# This file contains all types of locators for the Quick Note functionality (Add Quicknote to Booking)

*** Variables ***
${button.select_booking}                .btn.booking-display.btn-primary
${button.clinical}                     .btn-sidebar.btn.btn-sm.clinical
${select.forms_library}                 .form-control.event-type.mb20
${option.quick_note}                    //option[normalize-space()='QUICK NOTE']
${button.add_image}                     .btn.btn-file.btn-clinical-event
${button.save_quick_note}               .btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${button.print_quick_note}              .btn.btn-sm.btn-success.btn-print
${link.select_booking_clinical}         .ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
${dropdown.forms_library}               button[data-toggle="dropdown"]
${button.patient_action}                button.patient-btn
${button.add_image_debtor}              button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
${button.upload_from_file}              //button[normalize-space(.)="mygc"]
${button.choose_file}                   button.btn.btn-file
${button.select_picture_image}          button.patient-btn
${input.quick_note_text}                input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]
${button.upload_pdf}                    button.btn.btn-file
${button.select_pdf_booking}            button.btn.booking-display
