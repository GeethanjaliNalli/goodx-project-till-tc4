*** Settings ***
Documentation    This resource file contains all keywords related to Quicknote addition and validation for bookings in the Diary module.
Resource    ../common/super.resource

*** Keywords ***
Open Booking Details
    [Documentation]    Opens the booking details for the specified booking time.
    [Arguments]    ${booking_time}
    ${dynamic_timeslot}    Set Variable    //div[@class='time' and text()='${booking_time}']
    Wait Until Element Is Visible    ${dynamic_timeslot}    ${LONG_WAIT}
    Click    ${dynamic_timeslot}
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[div.booking_container]    ${LONG_WAIT}

Add Quicknote To Booking
    [Documentation]    Adds a quick note with text, image, and PDF attachment to the currently open booking.
    [Arguments]    &{quicknote_info}
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_add]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[input.quicknote_text]    ${LONG_WAIT}
    Fill Text    ${QUICKNOTE_LOCATORS}[input.quicknote_text]    ${quicknote_info}[input.text]
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_upload_image]
    Upload File To Quicknote Image    ${quicknote_info}[attach.image]
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_upload_pdf]
    Upload File To Quicknote PDF    ${quicknote_info}[attach.pdf]
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_save]
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[input.quicknote_text]    ${LONG_WAIT}

Upload File To Quicknote Image
    [Documentation]    Uploads an image file to the quicknote image upload input.
    [Arguments]    ${image_file}
    Choose File    //input[@type='file' and contains(@accept,'image')]    ${image_file}
    Wait Until    1s

Upload File To Quicknote PDF
    [Documentation]    Uploads a PDF file to the quicknote PDF upload input.
    [Arguments]    ${pdf_file}
    Choose File    //input[@type='file' and contains(@accept,'pdf')]    ${pdf_file}
    Wait Until    1s

Validate Quicknote Is Added
    [Documentation]    Validates that the quicknote is added to the booking with correct text, image, and PDF.
    [Arguments]    &{quicknote_info}
    Click    ${BOOKING_FORM_LOCATORS}[span.view_notebook]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[span.quicknote_qform]    ${LONG_WAIT}
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_view_notebook]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[input.quicknote_text]    ${LONG_WAIT}
    ${actual_text}    Get Text    ${QUICKNOTE_LOCATORS}[input.quicknote_text]
    Should Contain    ${actual_text}    ${quicknote_info}[input.text]
    Validate Quicknote Attachment Exists    ${quicknote_info}[attach.image]
    Validate Quicknote Attachment Exists    ${quicknote_info}[attach.pdf]
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_cancel]
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[input.quicknote_text]    ${LONG_WAIT}

Validate Quicknote Attachment Exists
    [Documentation]    Validates that an attachment with the given filename exists in the quicknote view.
    [Arguments]    ${filename}
    ${attachment_locator}    Set Variable    //a[contains(@href,'${filename}') or contains(text(),'${filename}')]
    Wait Until Element Is Visible    ${attachment_locator}    ${LONG_WAIT}

Validate Quicknote Printout Rendered Correctly
    [Documentation]    Validates that the quicknote printout renders correctly with all expected content.
    [Arguments]    ${expected_printout_text}
    Click    ${QUICKNOTE_LOCATORS}[button.quicknote_print]
    Wait Until    2s
    ${printout_text}    Get Text    //body[contains(.,'${expected_printout_text}')]
    Should Contain    ${printout_text}    ${expected_printout_text}
    Press Keys    //body    Escape
    Wait Until    1s
