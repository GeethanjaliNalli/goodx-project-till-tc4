*** Variables ***

# Booking Selection
${BOOKING_SELECT_BUTTON}                .btn.booking-display.btn-primary
${BOOKING_CLINICAL_BUTTON}              .btn-sidebar.btn.btn-sm.clinical

# Forms Library
${FORMS_LIBRARY_DROPDOWN}               .form-control.event-type.mb20
${FORMS_LIBRARY_DROPDOWN_BUTTON}        button[data-toggle="dropdown"]
${QUICK_NOTE_OPTION}                    //option[normalize-space()='QUICK NOTE']

# Quick Note Actions
${QUICK_NOTE_SELECT_BUTTON}              button.patient-btn
${QUICK_NOTE_TEXTBOX}                   .input-sm
${QUICK_NOTE_TEXT_INPUT}                input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]
${QUICK_NOTE_SAVE_BUTTON}               //button[normalize-space()='Save']
${QUICK_NOTE_SAVE}                      button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]

# Image Upload
${ADD_IMAGE_BUTTON}                     button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
${UPLOAD_FROM_FILE_BUTTON}              //button[normalize-space(.)="mygc"]
${CHOOSE_IMAGE_FILE_BUTTON}             button.btn.btn-file

# PDF Upload
${UPLOAD_PDF_BUTTON}                    button.btn.btn-file
${SELECT_PDF_BUTTON}                    button.btn.booking-display

# Print
${PRINT_BUTTON}                         //button[normalize-space()='Print']
${PRINT_ACTION_BUTTON}                  button[data-bind="processEvent: { click: 'Print' }"]
