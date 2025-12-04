*** Settings ***
Documentation    Test data for New Patient Booking (TC00002_Diary_NPB)
Resource    ../common/super.resource

*** Variables ***
&{NEW_PATIENT_BOOKING}
    ...    ${BTN_NEW_BOOKING}=true
    ...    ${SELECT_BOOKING_TYPE}=Consultation
    ...    ${SELECT_BOOKING_STATUS}=Booked
    ...    ${SELECT_DATE}=2025-12-05
    ...    ${SELECT_TIME}=10:00
    ...    ${INPUT_DURATION}=30
    ...    ${INPUT_REASON}=First time consultation
    ...    ${INPUT_NAME}=TestPatient
    ...    ${INPUT_SURNAME}=Smith
    ...    ${INPUT_CELLPHONE}=0812345678
    ...    ${SELECT_ID_TYPE}=RSA ID
    ...    ${INPUT_ID_NUMBER}=9001011234088
    ...    ${SELECT_GENDER}=Female
    ...    ${INPUT_INITIALS}=TS
    ...    ${SELECT_TITLE}=MS
    ...    ${SELECT_MEDICAL_AID_OPTION}=Silver
    ...    ${INPUT_MEDICAL_AID_NUMBER}=MA987654
    ...    ${BTN_SAVE_BOOKING}=true

&{NEW_PATIENT_BOOKING_MISSING_FIELDS}
    ...    ${BTN_NEW_BOOKING}=true
    ...    ${SELECT_BOOKING_TYPE}=Consultation
    ...    ${SELECT_BOOKING_STATUS}=Booked
    ...    ${SELECT_DATE}=2025-12-05
    ...    ${SELECT_TIME}=10:00
    ...    ${INPUT_DURATION}=30
    ...    ${INPUT_REASON}=First time consultation
    ...    ${INPUT_NAME}=
    ...    ${INPUT_SURNAME}=Smith
    ...    ${INPUT_CELLPHONE}=0812345678
    ...    ${SELECT_ID_TYPE}=RSA ID
    ...    ${INPUT_ID_NUMBER}=9001011234088
    ...    ${SELECT_GENDER}=Female
    ...    ${INPUT_INITIALS}=TS
    ...    ${SELECT_TITLE}=MS
    ...    ${SELECT_MEDICAL_AID_OPTION}=Silver
    ...    ${INPUT_MEDICAL_AID_NUMBER}=MA987654
    ...    ${BTN_SAVE_BOOKING}=true
