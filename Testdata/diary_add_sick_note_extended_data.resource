*** Settings ***
Documentation    Extended Sick Note test data for TC00006_Diary_Add Sick note
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

&{DEBTOR_INFO_VALID}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.title=MR
    ...    input.debtor.cell=0823456789
    ...    input.debtor.email=alex.carey@example.com
    ...    input.debtor.address=123 Main Street, Johannesburg
    ...    input.debtor.idtype=RSA ID
    ...    input.debtor.idnumber=9006155123081

&{BOOKING_INFO_VALID}
    ...    input.booking.date=2024-06-10
    ...    input.booking.time=09:30
    ...    input.booking.doctor=Dr. John Smith
    ...    input.booking.location=Room 2, GoodX Clinic
    ...    input.booking.reason=Sick Note
    ...    select.booking.status=Booked

&{SICK_NOTE_INFO_VALID}
    ...    input.sicknote.start_date=2024-06-10
    ...    input.sicknote.end_date=2024-06-12
    ...    input.sicknote.diagnosis=Acute bronchitis
    ...    input.sicknote.icd10_code=J20.9
    ...    input.sicknote.comments=Patient advised to rest and avoid strenuous activity
    ...    input.sicknote.work_status=Unfit for work
    ...    input.sicknote.return_to_work_date=2024-06-13
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.delivery_method=Email and Print
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=Yes
    ...    check.sicknote.qr_code=Enabled

&{SICK_NOTE_INFO_MINIMUM_DAYS}
    ...    input.sicknote.start_date=2024-06-10
    ...    input.sicknote.end_date=2024-06-10
    ...    input.sicknote.diagnosis=Tension headache
    ...    input.sicknote.icd10_code=G44.2
    ...    input.sicknote.comments=One day rest recommended
    ...    input.sicknote.work_status=Unfit for work
    ...    input.sicknote.return_to_work_date=2024-06-11
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.delivery_method=Print Only
    ...    check.sicknote.send_email=No
    ...    check.sicknote.print=Yes
    ...    check.sicknote.qr_code=Enabled

&{SICK_NOTE_INFO_MAXIMUM_DAYS}
    ...    input.sicknote.start_date=2024-06-01
    ...    input.sicknote.end_date=2024-06-30
    ...    input.sicknote.diagnosis=Post-operative recovery
    ...    input.sicknote.icd10_code=Z48.8
    ...    input.sicknote.comments=Extended recovery period; follow-up required
    ...    input.sicknote.work_status=Unfit for work
    ...    input.sicknote.return_to_work_date=2024-07-01
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.delivery_method=Email Only
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=No
    ...    check.sicknote.qr_code=Enabled

&{SICK_NOTE_INFO_INVALID_DATES}
    ...    input.sicknote.start_date=2024-06-15
    ...    input.sicknote.end_date=2024-06-10
    ...    input.sicknote.diagnosis=Acute bronchitis
    ...    input.sicknote.icd10_code=J20.9
    ...    input.sicknote.comments=End date before start date to trigger validation
    ...    input.sicknote.work_status=Unfit for work
    ...    input.sicknote.return_to_work_date=2024-06-16
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.delivery_method=Email and Print
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=Yes
    ...    check.sicknote.qr_code=Enabled

&{SICK_NOTE_INFO_MISSING_DIAGNOSIS}
    ...    input.sicknote.start_date=2024-06-10
    ...    input.sicknote.end_date=2024-06-12
    ...    input.sicknote.diagnosis=
    ...    input.sicknote.icd10_code=
    ...    input.sicknote.comments=Diagnosis intentionally left blank to validate mandatory field
    ...    input.sicknote.work_status=Unfit for work
    ...    input.sicknote.return_to_work_date=2024-06-13
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.delivery_method=Email and Print
    ...    check.sicknote.send_email=Yes
    ...    check.sicknote.print=Yes
    ...    check.sicknote.qr_code=Enabled

&{SICK_NOTE_INFO_NO_QR}
    ...    input.sicknote.start_date=2024-06-10
    ...    input.sicknote.end_date=2024-06-12
    ...    input.sicknote.diagnosis=Seasonal influenza
    ...    input.sicknote.icd10_code=J11.1
    ...    input.sicknote.comments=QR code disabled for this certificate
    ...    input.sicknote.work_status=Unfit for work
    ...    input.sicknote.return_to_work_date=2024-06-13
    ...    input.sicknote.doctor_signature=Dr. John Smith
    ...    select.sicknote.delivery_method=Print Only
    ...    check.sicknote.send_email=No
    ...    check.sicknote.print=Yes
    ...    check.sicknote.qr_code=Disabled

&{EXPECTED_DATA_VALID}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0823456789
    ...    email=alex.carey@example.com
    ...    doctor=Dr. John Smith
    ...    diagnosis=Acute bronchitis
    ...    sicknote_period=2024-06-10 to 2024-06-12
    ...    work_status=Unfit for work
    ...    return_to_work_date=2024-06-13
    ...    qr_code=Enabled
    ...    delivery_method=Email and Print

&{EXPECTED_DATA_MINIMUM_DAYS}
    ...    diagnosis=Tension headache
    ...    sicknote_period=2024-06-10 to 2024-06-10
    ...    work_status=Unfit for work
    ...    return_to_work_date=2024-06-11
    ...    qr_code=Enabled
    ...    delivery_method=Print Only

&{EXPECTED_DATA_MAXIMUM_DAYS}
    ...    diagnosis=Post-operative recovery
    ...    sicknote_period=2024-06-01 to 2024-06-30
    ...    work_status=Unfit for work
    ...    return_to_work_date=2024-07-01
    ...    qr_code=Enabled
    ...    delivery_method=Email Only

&{EXPECTED_DATA_NO_QR}
    ...    diagnosis=Seasonal influenza
    ...    sicknote_period=2024-06-10 to 2024-06-12
    ...    work_status=Unfit for work
    ...    return_to_work_date=2024-06-13
    ...    qr_code=Disabled
    ...    delivery_method=Print Only

{"filePath": "Testdata/diary_add_sick_note_extended_data.resource", "componentType": "testdata"}
