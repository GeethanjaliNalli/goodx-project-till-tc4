*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_HEADER_LOCATORS}
...    label.diary.title=//div[contains(@class, 'title') and text()='GoodX Web']
...    button.settings=a.settings
...    button.about=a.about
...    button.logout=a.logout
...    input.search.entity=input.input-sm
...    link.diary.tab=//a[t[text()='Diary']]
...    link.dashboard.tab=//a[t[text()='Dashboard']]
...    link.inbox.tab=//a[t[text()='Inbox']]
...    link.clinical.reports.tab=//a[t[text()='Clinical Reports']]
...    link.hospital.rounds.tab=//a[t[text()='Hospital Rounds']]
...    button.new.booking=button.new-booking
...    button.print.diary=button.print-diary
...    button.available.booking.times=button[title='Click here for available booking times']
...    input.filter.bookings=input[placeholder='Filter bookings ...']
...    button.show.active.bookings=button.booking-display
...    button.hide.tasks=//button[text()='Hide Tasks']
...    button.hide.closed.tasks=//button[text()='Hide Closed Tasks']
...    button.reload.bookings=button.btn-reload-bookings
...    input.selected.date=input.input-date.selected
...    button.backward.date=button.backward
...    button.forward.date=button.forward
...    button.today.date=button.today

&{DIARY_GRID_LOCATORS}
...    div.timeslot=div.timeslot.ui-droppable
...    div.time.cell=div.time
...    div.booking=div.booking.ui-draggable
...    div.booking.selected=div.booking.selected
...    div.booking.deleted=div.booking.deleted
...    div.booking.status=div.typestatus > div.status
...    div.booking.type=div.typestatus > div.type
...    div.booking.date=div.date > div
...    div.booking.waiting.time=div.waiting-time > div
...    div.booking.patient.name=div.patient > div.name > span
...    div.booking.patient.details=div.patient > div.details
...    div.booking.patient.mobile=div.patient > div.details > span:nth-child(1)
...    div.booking.patient.gender=div.patient > div.details > span:nth-child(2)
...    div.booking.patient.age=div.patient > div.details > span:nth-child(3) > span
...    div.booking.treating.doctor=div.treatingdoc > div.details
...    div.booking.debtor.number=div.debtor-details .number > span
...    div.booking.debtor.file.number=div.debtor-filenumber span
...    div.booking.debtor.name=div.debtor > div.name > span
...    div.booking.debtor.details=div.debtor > div.details
...    select.booking.location=div.location select
...    div.booking.reason=div.reason > span
...    div.booking.summary=div.summary
...    span.booking.qform=span.qform
...    span.booking.clinical.status=span.clinical-status
...    span.booking.document.status=span.document-status
...    button.booking.switch.status=button.btn-switch-status
...    span.booking.invoice.status=span.invoice-status
...    span.booking.account.status=span.account-status
...    span.booking.validation.status=span.validation-status
...    span.booking.verification.done=span.verification-done
...    span.booking.verification.pending=span.verification-pending
...    span.booking.view.notebook=span.btn-view-notebook

&{PATIENT_DETAILS_LOCATORS}
...    div.patient.summary=div.patient-summary-component
...    span.patient.fullname=div.fullname > span
...    span.patient.dob=div.date-of-birth > span:nth-child(2)
...    span.patient.file.no=div.file-no > span:nth-child(2)
...    span.patient.debtor.file.no=div.debtor-file-no > span:nth-child(2)
...    span.patient.id.no=div.id-no > span:nth-child(2)
...    span.patient.mobile.no=div.mobile-no > span:nth-child(2)
...    span.patient.email=div.email > span:nth-child(2)
...    span.patient.medical.aid=div.medical-aid > span:nth-child(2)
...    img.patient.picture=div.picture img

&{DEBTOR_DETAILS_LOCATORS}
...    div.debtor.details=div.debtor-details
...    span.debtor.number=div.debtor-details .number > span
...    span.debtor.status=div.debtor-details .status icon
...    span.debtor.file.no=div.debtor-filenumber span
...    span.debtor.medical.aid=div.debtor > div.details > span:nth-child(2)
...    span.debtor.name=div.debtor > div.name > span
...    span.debtor.details=div.debtor > div.details

&{CLINICAL_ACTIONS_LOCATORS}
...    button.patient.dashboard=button.btn-patient-dashboard
...    button.debtor.edit=button.btn-debtor-edit
...    button.patient.file=button.btn-clinical-history
...    button.account.details=button.btn-account-details
...    button.invoice=button.invoice
...    button.clinical=button.clinical
...    button.receipt=button.btn-receipt
...    button.telemed=button.btn-sidebar:has(t:contains('Telemed'))
...    button.new.hospital.case=button.btn-new-hospital-case
...    button.print.booking.label=button.btn-primary:has(t:contains('Print Booking Label'))
...    button.import.mygc=button[title='Import from MyGC']
...    button.sms=button.btn-sms
...    button.whatsapp=button.btn-whatsapp
...    button.dial=button.btn-tumblr:has(t:contains('Dial'))
...    button.email=button.btn-email
...    button.send.payment.request=button.btn-primary:has(t:contains('Send a payment request'))
...    button.add.documents=button.btn-primary:has(t:contains('Add Documents'))
...    button.add.appointment=button.btn-primary:has(t:contains('Add Appointment'))
...    button.download.invoice=button.btn-sb-layout:has(t:contains('Download Invoice'))
...    button.download.receipt=button.btn-sb-layout:has(t:contains('Download Receipt'))
...    button.download.statement=button.btn-primary:has(t:contains('Download Statement'))
...    button.advanced.statement=button.btn-primary:has(t:contains('Advanced Statement'))
...    button.email.audit.statement=button.btn-primary:has(t:contains('Email Audit Statement'))

&{CLINICAL_FORMS_LOCATORS}
...    select.forms.library=select.event-type
...    option.sick.note=//option[text()='SICK NOTE']
...    button.add.sick.note=//option[text()='SICK NOTE']
...    button.select.event=button.description
...    button.copy.event=button.btn-warning:has(t:contains('Copy'))
...    button.delete.event=button.btn-danger:has(icon)
...    button.complete=button.btn-finalize
...    button.lock=button.btn-warning:has(icon.fa-unlock)
...    button.email.pdf=button.btn-success:has(icon.fa-envelope)
...    button.print=button.btn-print
...    button.expand.all=button.btn-success:has(icon.fa-folder-open)
...    button.close=button.btn-close
...    button.save=button.btn-save
...    button.save.and.close=button.btn-save:has(t:contains('Save and Close'))
...    button.create.recording=button.btn-primary:has(text()='Create Recording')
...    button.stop.recording=button.btn-warning:has(text()='Stop Recording')

&{WARNING_ALERT_LOCATORS}
...    div.warning=div.warning
...    span.warning.message=div.warning span
...    div.error=div.error
...    span.error.message=div.error span

# Standalone locators
${button.close}    .pull-left.btn-close
${button.save}     .btn-save
${button.expand.all}    .btn-success:has(icon.fa-folder-open)
${input.filter.bookings}    input[placeholder='Filter bookings ...']
${button.new.booking}    button.new-booking
${button.print.diary}   button.print-diary
${input.selected.date}  input.input-date.selected
${button.backward.date} button.backward
${button.forward.date}  button.forward
${button.today.date}    button.today
