*** Settings ***
Documentation    This diary page resource file has all the diary and quicknote related keywords.
Resource    ../common/super.resource

*** Keywords ***
Open Booking Details
    [Documentation]    Opens the booking details dialog for the specified booking time.
    [Arguments]    ${booking_time}
    ${timeslot_locator}=    Evaluate    "//div[@class='time' and text()='${booking_time}']"
    Wait Until Element Is Visible    locator=${timeslot_locator}    timeout=${LONG_WAIT}
    Click    ${timeslot_locator}
    Wait Until Element Is Visible    locator=${dialog.booking_details}    timeout=${LONG_WAIT}

Add Quicknote To Booking
    [Documentation]    Adds a quick note to the booking, including text, image, and PDF as provided in the data dictionary.
    [Arguments]    &{quicknote_data}
    Click    ${BOOKING_FORM_LOCATORS}[button.view_notebook]
    Wait Until Element Is Visible    locator=${BOOKING_FORM_LOCATORS}[select.forms_library]    timeout=${LONG_WAIT}
    Click    ${BOOKING_FORM_LOCATORS}[button.add_quicknote]
    Wait Until Element Is Visible    locator=${QUICKNOTE_LOCATORS}[dialog.quicknote_editor]    timeout=${LONG_WAIT}
    Enter Quicknote Data    &{quicknote_data}
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_save]
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[dialog.quicknote_editor]    ${LONG_WAIT}

Enter Quicknote Data
    [Documentation]    Enters quick note data fields dynamically using dictionary keys.
    [Arguments]    &{quicknote_data}
    FOR    ${field}    ${value}    IN    &{quicknote_data}
        Run Keyword If    '${field}'.startswith('input.')    Fill Quicknote Text Field    ${field}    ${value}
        Run Keyword If    '${field}'.startswith('upload.image_file')    Upload Quicknote Image    ${value}
        Run Keyword If    '${field}'.startswith('upload.pdf_file')    Upload Quicknote PDF    ${value}
    END

Fill Quicknote Text Field
    [Documentation]    Fills the quicknote textarea field.
    [Arguments]    ${field}    ${value}
    ${locator}    Get From Dictionary    ${QUICKNOTE_LOCATORS}    input.quicknote_textarea
    Fill Text    ${locator}    ${value}

Upload Quicknote Image
    [Documentation]    Uploads an image to the quicknote.
    [Arguments]    ${image_path}
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_add_image]
    Wait Until Element Is Visible    locator=input[type='file']    timeout=${LONG_WAIT}
    Press Keys    input[type='file']    ${image_path}
    Wait Until Element Is Visible    locator=${QUICKNOTE_LOCATORS}[icon.quicknote_image]    timeout=${LONG_WAIT}

Upload Quicknote PDF
    [Documentation]    Uploads a PDF to the quicknote.
    [Arguments]    ${pdf_path}
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_add_pdf]
    Wait Until Element Is Visible    locator=input[type='file']    timeout=${LONG_WAIT}
    Press Keys    input[type='file']    ${pdf_path}
    Wait Until Element Is Visible    locator=${QUICKNOTE_LOCATORS}[icon.quicknote_pdf]    timeout=${LONG_WAIT}

Validate Quicknote Is Added
    [Documentation]    Validates that the quicknote is successfully added and contains the expected text, image, and PDF.
    [Arguments]    &{quicknote_data}
    Click    ${BOOKING_FORM_LOCATORS}[button.view_notebook]
    Wait Until Element Is Visible    locator=${BOOKING_FORM_LOCATORS}[button.quicknote_active]    timeout=${LONG_WAIT}
    Click    ${BOOKING_FORM_LOCATORS}[button.quicknote_active]
    Wait Until Element Is Visible    locator=${QUICKNOTE_LOCATORS}[dialog.quicknote_editor]    timeout=${LONG_WAIT}
    ${actual_text}    Get Text    ${QUICKNOTE_LOCATORS}[input.quicknote_textarea]
    Should Contain    ${actual_text}    ${quicknote_data}[input.quicknote_text]
    Wait Until Element Is Visible    locator=${QUICKNOTE_LOCATORS}[icon.quicknote_image]    timeout=${LONG_WAIT}
    Wait Until Element Is Visible    locator=${QUICKNOTE_LOCATORS}[icon.quicknote_pdf]    timeout=${LONG_WAIT}
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_cancel]
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[dialog.quicknote_editor]    ${LONG_WAIT}
