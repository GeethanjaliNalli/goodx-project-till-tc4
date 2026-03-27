*** Variables ***

# Booking Selection
${BOOKING_DISPLAY_BUTTON}                .btn.booking-display.btn-primary
${CLINICAL_BUTTON}                       .btn-sidebar.btn.btn-sm.clinical

# Forms Library
${FORMS_LIBRARY_DROPDOWN}                .form-control.event-type.mb20
${FORMS_LIBRARY_DROPDOWN_BUTTON}         button[data-toggle="dropdown"]
${QUICK_NOTE_OPTION}                     //option[normalize-space()='QUICK NOTE']
${QUICK_NOTE_LIST_ITEM}                  a[data-bind="text: description"]

# Quick Note - Add Image
${ADD_IMAGE_BUTTON}                      button[data-bind="click: $wfevent.onAddImageClick($data, images)"]
${UPLOAD_IMAGE_INPUT}                    input[type='file']
${CHOOSE_IMAGE_FILE_INPUT}               input[data-bind="event: {change: function(){file_selected($element.files[0]);}}"]
${PATIENT_IMAGE_BUTTON}                  button.patient-btn

# Quick Note - Add Text
${NOTE_TEXTAREA}                         .styledTextarea.note
${NOTE_TEXT_INPUT}                       input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]

# Quick Note - Add PDF
${UPLOAD_PDF_INPUT}                      input[type='file']
${UPLOAD_PDF_FILE_INPUT}                 input[data-bind="event: {change: function(){file_selected($element.files[0]);}}"]
${SELECT_PDF_AND_OPEN_INPUT}             input[data-bind="event: {change: function(){file_selected($element.files[0]);}}"]

# Save & Print
${SAVE_BUTTON}                           button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${PRINT_BUTTON}                          .btn.btn-sm.btn-success.btn-print

# Dialog/Navigation
${SELECT_BOOKING_CLINICAL_LINK}          .ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
