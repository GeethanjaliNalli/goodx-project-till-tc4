*** Variables ***

# Booking Selection
${BOOKING_DISPLAY_BUTTON}                .btn.booking-display.btn-primary
${BOOKING_CLINICAL_BUTTON}                .btn-sidebar.btn.btn-sm.clinical.btn-primary
${BOOKING_CLINICAL_SUBSCREEN_LINK}        a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]

# Forms Library
${FORMS_LIBRARY_DROPDOWN}                 .form-control.event-type.mb20
${FORMS_LIBRARY_DROPDOWN_BUTTON}          button[data-toggle="dropdown"]
${QUICK_NOTE_OPTION}                      //option[normalize-space()='QUICK NOTE']
${QUICK_NOTE_LIST_ITEM}                   a[data-bind="text: description"]

# Add Image
${ADD_IMAGE_BUTTON}                       .btn.btn-primary[aria-haspopup="true"]
${ADD_IMAGE_ACTION_BUTTON}                button[data-bind="click: $wfevent.onAddImageClick($data, images)"]
${UPLOAD_IMAGE_FILE_INPUT}                input[data-bind="disable: unwrap($wfevent, 'booking_uid') || $wfevent.allStagesFinalized() || $settings.templating , datePicker: objectTraverse(meta_data, 'treatment_date', true), mask: 'localedate'"]
${CHOOSE_IMAGE_FILE_BUTTON}               button.btn.btn-file
${PATIENT_IMAGE_BUTTON}                   button.patient-btn

# Add Text
${QUICK_NOTE_TEXTAREA}                    .styledTextarea.note
${QUICK_NOTE_TEXT_INPUT}                  input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]

# Upload PDF
${UPLOAD_PDF_FILE_INPUT}                  input[type='file']
${UPLOAD_PDF_FILE_BUTTON}                 button.btn.btn-file
${PDF_LIST_ITEM}                          a[data-bind="text: description"]

# Save and Print
${SAVE_BUTTON}                            .btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${SAVE_ACTION_BUTTON}                     button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${PRINT_BUTTON}                          .btn.btn-sm.btn-success.btn-print
${PRINT_ACTION_BUTTON}                    button[data-bind="processEvent: { click: 'Print' }"]
