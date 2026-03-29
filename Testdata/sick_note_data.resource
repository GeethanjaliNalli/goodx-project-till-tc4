*** Settings ***
Documentation    This file contains the dictionary for Sick Note (Medical Certificate) data used in the Diary - Add Sick note test case.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
    ...    input.treatment_date=2025-12-01
    ...    input.absent_from=2025-12-01
    ...    input.absent_to=2025-12-03
    ...    input.total_days_absent=3
    ...    input.follow_up_date=2025-12-15
    ...    input.light_duty_start=2025-12-04
    ...    input.comments=Patient advised to rest and avoid strenuous activity.
    ...    input.icd10_search=J06.9
    ...    upload.pdf.file=sample_medical_certificate.pdf
