*** Variables ***

# Navigation
${BTN_NEW_BOOKING}                       .btn.btn-sm.btn-primary.new-booking

# Booking Details
${SELECT_BOOKING_TYPE}                    .form-control.input-sm.type.validation
${SELECT_BOOKING_STATUS}                  .form-control.input-sm.status.validation
${SELECT_DATE}                            .form-control.input-sm.date.validation
${SELECT_TIME}                            .form-control.input-sm.time.validation
${INPUT_DURATION}                         input[name='duration']
${INPUT_REASON}                           .form-control.input-sm.reason.validation

# Patient Details
${INPUT_NAME}                             .form-control.input-sm.name.ui-autocomplete-input.treating-doc
${INPUT_SURNAME}                          input[name='debtor_surname']
${INPUT_CELLPHONE}                        .form-control.input-sm.cellnr.validation
${SELECT_ID_TYPE}                         .form-control.input-sm.idtype.validation
${INPUT_ID_NUMBER}                        .form-control.input-sm.idnumber.validation
${SELECT_GENDER}                          .form-control.input-sm.gender.validation
${INPUT_INITIALS}                         .form-control.input-sm.initials.validation
${SELECT_TITLE}                           .form-control.input-sm.title.validation

# Medical Aid Details
${SELECT_MEDICAL_AID_OPTION}              .form-control.input-sm.ma_optionname.validation
${INPUT_MEDICAL_AID_NUMBER}               .form-control.input-sm.ma_number.validation

# Actions
${BTN_DUPLICATE_DEBTOR}                   .btn.btn-xs.btn-default.pull-right.duplicate-debtor
${BTN_SAVE_BOOKING}                       .btn.btn-sm.btn-success.pull-right.btn-save
${BTN_SAVE_BOOKING_ALT}                   button[data-bind="visible: $action === 'booking', processEvent: { click: 'NewBooking' }"]

# Diary Screen Validation
${DIARY_SCREEN_DURATION_FIELD}            input[data-bind="value: duration"]
${DIARY_SCREEN_SURNAME_FIELD}             input[data-bind="value: surname, enable: uid.new()"]
