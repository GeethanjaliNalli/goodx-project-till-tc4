*** Settings ***
Documentation    This booking page resource file contains keywords for New Patient Booking (TC00002_Diary_NPB).
Resource    ../common/super.resource

*** Keywords ***
Click New Booking Button
    [Documentation]    Clicks the New Booking button to open the booking form.
    [Arguments]    ${btn_locator}
    Click    ${btn_locator}
    Wait Until Element Is Visible    ${SELECT_BOOKING_TYPE}    ${LONG_WAIT}

Select Booking Type
    [Documentation]    Selects the booking type from the dropdown.
    [Arguments]    ${booking_type}
    Select Options By    ${SELECT_BOOKING_TYPE}    label    ${booking_type}

Select Booking Status
    [Documentation]    Selects the booking status from the dropdown.
    [Arguments]    ${booking_status}
    Select Options By    ${SELECT_BOOKING_STATUS}    label    ${booking_status}

Select Booking Date
    [Documentation]    Selects the booking date.
    [Arguments]    ${booking_date}
    Fill Text    ${SELECT_DATE}    ${booking_date}

Select Booking Time
    [Documentation]    Selects the booking time.
    [Arguments]    ${booking_time}
    Fill Text    ${SELECT_TIME}    ${booking_time}

Enter Booking Duration
    [Documentation]    Enters the booking duration.
    [Arguments]    ${duration}
    Fill Text    ${INPUT_DURATION}    ${duration}

Enter Booking Reason
    [Documentation]    Enters the booking reason.
    [Arguments]    ${reason}
    Fill Text    ${INPUT_REASON}    ${reason}

Enter Patient Name
    [Documentation]    Enters the patient name.
    [Arguments]    ${name}
    Fill Text    ${INPUT_NAME}    ${name}

Enter Patient Surname
    [Documentation]    Enters the patient surname.
    [Arguments]    ${surname}
    Fill Text    ${INPUT_SURNAME}    ${surname}

Enter Patient Cellphone
    [Documentation]    Enters the patient cellphone number.
    [Arguments]    ${cellphone}
    Fill Text    ${INPUT_CELLPHONE}    ${cellphone}

Select Patient ID Type
    [Documentation]    Selects the patient ID type.
    [Arguments]    ${id_type}
    Select Options By    ${SELECT_ID_TYPE}    label    ${id_type}

Enter Patient ID Number
    [Documentation]    Enters the patient ID number.
    [Arguments]    ${id_number}
    Fill Text    ${INPUT_ID_NUMBER}    ${id_number}

Select Patient Gender
    [Documentation]    Selects the patient gender.
    [Arguments]    ${gender}
    Select Options By    ${SELECT_GENDER}    label    ${gender}

Enter Patient Initials
    [Documentation]    Enters the patient initials.
    [Arguments]    ${initials}
    Fill Text    ${INPUT_INITIALS}    ${initials}

Select Patient Title
    [Documentation]    Selects the patient title.
    [Arguments]    ${title}
    Select Options By    ${SELECT_TITLE}    label    ${title}

Select Medical Aid Option
    [Documentation]    Selects the medical aid option.
    [Arguments]    ${ma_option}
    Select Options By    ${SELECT_MEDICAL_AID_OPTION}    label    ${ma_option}

Enter Medical Aid Number
    [Documentation]    Enters the medical aid number.
    [Arguments]    ${ma_number}
    Fill Text    ${INPUT_MEDICAL_AID_NUMBER}    ${ma_number}

Save Booking Form
    [Documentation]    Saves the booking form.
    [Arguments]    ${btn_save_locator}
    Click    ${btn_save_locator}
    Wait Until Element Is Invisible    ${BTN_SAVE_BOOKING}    ${LONG_WAIT}

Validate Booking Is Created
    [Documentation]    Validates that a booking is created in the diary for the given date, time, name, and surname.
    [Arguments]    ${date}    ${time}    ${name}    ${surname}
    ${booking_locator}=    Set Variable    xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//div[@class='patient']//div[@class='name']/span
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    ${actual_name}=    Get Text    ${booking_locator}
    Should Contain    ${actual_name}    ${name}
    Should Contain    ${actual_name}    ${surname}

Validate Booking Is Not Created
    [Documentation]    Validates that a booking is NOT created in the diary for the given date, time, and surname.
    [Arguments]    ${date}    ${time}    ${surname}
    ${booking_locator}=    Set Variable    xpath=//div[contains(@class,'start') and text()='${time}']/ancestor::div[contains(@data-bind,'borderRightColor')]//div[@class='patient']//div[@class='name']/span
    ${element_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${booking_locator}    3s
    Should Not Be True    ${element_status}

Enter New Patient Booking Details
    [Documentation]    Enters all booking and patient details for a new patient booking using a dictionary.
    [Arguments]    &{booking_data}
    Select Booking Type    ${booking_data[SELECT_BOOKING_TYPE]}
    Select Booking Status    ${booking_data[SELECT_BOOKING_STATUS]}
    Select Booking Date    ${booking_data[SELECT_DATE]}
    Select Booking Time    ${booking_data[SELECT_TIME]}
    Enter Booking Duration    ${booking_data[INPUT_DURATION]}
    Enter Booking Reason    ${booking_data[INPUT_REASON]}
    Enter Patient Name    ${booking_data[INPUT_NAME]}
    Enter Patient Surname    ${booking_data[INPUT_SURNAME]}
    Enter Patient Cellphone    ${booking_data[INPUT_CELLPHONE]}
    Select Patient ID Type    ${booking_data[SELECT_ID_TYPE]}
    Enter Patient ID Number    ${booking_data[INPUT_ID_NUMBER]}
    Select Patient Gender    ${booking_data[SELECT_GENDER]}
    Enter Patient Initials    ${booking_data[INPUT_INITIALS]}
    Select Patient Title    ${booking_data[SELECT_TITLE]}
    Select Medical Aid Option    ${booking_data[SELECT_MEDICAL_AID_OPTION]}
    Enter Medical Aid Number    ${booking_data[INPUT_MEDICAL_AID_NUMBER]}

Enter New Patient Booking Details With Missing Fields
    [Documentation]    Enters booking and patient details for a new patient booking with missing required fields using a dictionary.
    [Arguments]    &{booking_data}
    Select Booking Type    ${booking_data[SELECT_BOOKING_TYPE]}
    Select Booking Status    ${booking_data[SELECT_BOOKING_STATUS]}
    Select Booking Date    ${booking_data[SELECT_DATE]}
    Select Booking Time    ${booking_data[SELECT_TIME]}
    Enter Booking Duration    ${booking_data[INPUT_DURATION]}
    Enter Booking Reason    ${booking_data[INPUT_REASON]}
    Enter Patient Name    ${booking_data[INPUT_NAME]}
    Enter Patient Surname    ${booking_data[INPUT_SURNAME]}
    Enter Patient Cellphone    ${booking_data[INPUT_CELLPHONE]}
    Select Patient ID Type    ${booking_data[SELECT_ID_TYPE]}
    Enter Patient ID Number    ${booking_data[INPUT_ID_NUMBER]}
    Select Patient Gender    ${booking_data[SELECT_GENDER]}
    Enter Patient Initials    ${booking_data[INPUT_INITIALS]}
    Select Patient Title    ${booking_data[SELECT_TITLE]}
    Select Medical Aid Option    ${booking_data[SELECT_MEDICAL_AID_OPTION]}
    Enter Medical Aid Number    ${booking_data[INPUT_MEDICAL_AID_NUMBER]}
