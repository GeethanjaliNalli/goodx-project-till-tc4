*** Settings ***
Documentation    This file contains extended dictionaries for Diary - Add Sick note scenarios.
Resource    ../common/super.resource

*** Variables ***
&{PATIENT_INFO_VALID}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.initials=AC
    ...    input.patient.gender=Male
    ...    input.patient.dob=1990-06-15
    ...    input.patient.idtype=RSA ID
    ...    input.patient.idnumber=9006155123081
    ...    input.patient.cell=0823456789
    ...    input.patient.email=alex.carey@example.com
    ...    input.patient.address=123 Main Street, Johannesburg

&{DEBTOR_INFO_COMPLETE}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.title=MR
    ...    input.debtor.cell=0823456789
    ...    input.debtor.email=alex.carey@example.com
    ...    input.debtor.address=123 Main Street, Johannesburg
    ...    input.debtor.idtype=RSA ID
    ...    input.debtor.idnumber=9006155123081

&{BOOKING_INFO_DIARY}
    ...    input.booking.date=2024-06-10
    ...    input.booking.time=09:30
    ...    input.booking.doctor=Dr. John Smith
    ...    input.booking.location=Room 2, GoodX Clinic
    ...    input.booking.reason=Sick Note
    ...    select.booking.status=Booked

&{SICK_NOTE_INFO_STANDARD}
    ...    input.sicknote.start_date=2024-06-10
    ...    input.sicknote.end_date=2024-06-12
    ...    input.sicknote.diagnosis=Acute bronchitis
    ...    input.sicknote.comments=Patient advised to rest and avoid strenuous activity
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.type=Medical Certificate
    ...    select.sicknote.fit_for_work=No
    ...    select.sicknote.qr_code=Enabled
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=Yes

&{SICK_NOTE_INFO_LONG_ABSENCE}
    ...    input.sicknote.start_date=2024-06-01
    ...    input.sicknote.end_date=2024-06-21
    ...    input.sicknote.diagnosis=Post-operative recovery
    ...    input.sicknote.comments=Patient recovering from surgery, unfit for work for three weeks
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.type=Medical Certificate
    ...    select.sicknote.fit_for_work=No
    ...    select.sicknote.qr_code=Enabled
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=No

&{SICK_NOTE_INFO_FIT_FOR_WORK}
    ...    input.sicknote.start_date=2024-07-01
    ...    input.sicknote.end_date=2024-07-01
    ...    input.sicknote.diagnosis=Mild tension headache
    ...    input.sicknote.comments=Patient fit for work, no time off required
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.type=Medical Certificate
    ...    select.sicknote.fit_for_work=Yes
    ...    select.sicknote.qr_code=Disabled
    ...    check.sicknote.send_email=No
    ...    check.sicknote.print=Yes

&{SICK_NOTE_INFO_MISSING_OPTIONAL_FIELDS}
    ...    input.sicknote.start_date=2024-08-05
    ...    input.sicknote.end_date=2024-08-07
    ...    input.sicknote.diagnosis=Viral infection
    ...    input.sicknote.comments=
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.type=Medical Certificate
    ...    select.sicknote.fit_for_work=No
    ...    select.sicknote.qr_code=Enabled
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=Yes

&{SICK_NOTE_INFO_INVALID_DATES}
    ...    input.sicknote.start_date=2024-09-10
    ...    input.sicknote.end_date=2024-09-08
    ...    input.sicknote.diagnosis=Back pain
    ...    input.sicknote.comments=End date earlier than start date to trigger validation
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.type=Medical Certificate
    ...    select.sicknote.fit_for_work=No
    ...    select.sicknote.qr_code=Enabled
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=No

&{SICK_NOTE_INFO_MAX_LENGTH_COMMENTS}
    ...    input.sicknote.start_date=2024-10-01
    ...    input.sicknote.end_date=2024-10-03
    ...    input.sicknote.diagnosis=Influenza
    ...    input.sicknote.comments=Patient presents with high fever, sore throat, muscle aches, and fatigue. Advised complete bed rest, adequate hydration, and symptomatic treatment. Avoid public contact and strenuous activity until fully recovered.
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.type=Medical Certificate
    ...    select.sicknote.fit_for_work=No
    ...    select.sicknote.qr_code=Enabled
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=Yes

&{EXPECTED_DATA_STANDARD_SICK_NOTE}
    ...    debtor_name=MR Carey, AC, Alex
    ...    patient_name=Alex Carey
    ...    cell_no=0823456789
    ...    email=alex.carey@example.com
    ...    doctor=Dr. John Smith
    ...    diagnosis=Acute bronchitis
    ...    sicknote_period=2024-06-10 to 2024-06-12
    ...    sicknote_type=Medical Certificate
    ...    fit_for_work=No
    ...    qr_code=Enabled
    ...    send_email=Yes
    ...    print=Yes

&{EXPECTED_DATA_LONG_ABSENCE}
    ...    debtor_name=MR Carey, AC, Alex
    ...    patient_name=Alex Carey
    ...    doctor=Dr. John Smith
    ...    diagnosis=Post-operative recovery
    ...    sicknote_period=2024-06-01 to 2024-06-21
    ...    fit_for_work=No
    ...    qr_code=Enabled
    ...    send_email=Yes
    ...    print=No

&{EXPECTED_DATA_FIT_FOR_WORK}
    ...    debtor_name=MR Carey, AC, Alex
    ...    patient_name=Alex Carey
    ...    doctor=Dr. John Smith
    ...    diagnosis=Mild tension headache
    ...    sicknote_period=2024-07-01 to 2024-07-01
    ...    fit_for_work=Yes
    ...    qr_code=Disabled
    ...    send_email=No
    ...    print=Yes

&{EXPECTED_DATA_INVALID_DATES}
    ...    validation_error_message=Some fields are invalid
    ...    invalid_field=sicknote.end_date
    ...    error_type=End date earlier than start date

&{EXPECTED_DATA_COMMUNICATION_LOGS}
    ...    email_logged=Yes
    ...    print_logged=Yes
    ...    communication_type_email=Sick Note Email
    ...    communication_type_print=Sick Note Print
    ...    module=DIARY
    ...    record_type=Clinical Form
