*** Variables ***

# Booking selection
${BOOKING_SELECT_BUTTON}                       .btn.booking-display.btn-primary
${CLINICAL_BUTTON}                             .btn-sidebar.btn.btn-sm.clinical
${BOOKING_CLINICAL_LINK}                      .ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]

# Forms/Quick Note
${FORMS_LIBRARY_DROPDOWN}                      .form-control.event-type.mb20
${FORMS_LIBRARY_DROPDOWN_BUTTON}               button[data-toggle="dropdown"]
${QUICK_NOTE_OPTION}                           //option[normalize-space()='QUICK NOTE']
${QUICK_NOTE_LIST_ITEM}                        a[data-bind="text: description"]

# Add Image
${ADD_IMAGE_BUTTON}                            .btn.btn-primary[data-bind="click: $wfevent.onAddImageClick($data, images)"]
${ADD_IMAGE_BUTTON_ALT}                        button[data-bind="click: $wfevent.onAddImageClick($data, images)"]
${UPLOAD_IMAGE_FROM_FILE_BUTTON}               .btn.btn-primary.w100[data-bind="click: $wfevent.onUploadMultipleImageClick(images)"]
${SELECT_IMAGE_BUTTON}                         button.patient-btn
${IMAGE_FILE_INPUT}                            input[type='file']

# Add Text
${QUICK_NOTE_TEXTAREA}                         .styledTextarea.note
${QUICK_NOTE_TEXT_INPUT}                       input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]

# Upload PDF
${PDF_FILE_INPUT}                              input[type='file']
${PDF_UPLOAD_INPUT}                            input[data-bind="event: {change: function(){file_selected($element.files[0]);}}"]

# Save & Print
${SAVE_BUTTON}                                 .btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${SAVE_BUTTON_ALT}                             button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${PRINT_BUTTON}                                .btn.btn-sm.btn-success.btn-print
${PRINT_BUTTON_ALT}                            button[data-bind="processEvent: { click: 'Print' }"]
