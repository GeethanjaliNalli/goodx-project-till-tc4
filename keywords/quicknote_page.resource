*** Settings ***
Documentation    This resource file contains all keywords related to Quicknote functionality for booking diary entries, including adding, validating, and interacting with quicknotes.
Resource    ../common/super.resource

*** Keywords ***
Open Booking Details
    [Documentation]    Opens the booking details for the specified timeslot.
    [Arguments]    ${booking_time}
    ${booking_locator}    Set Variable    xpath=//div[contains(@class,'start') and text()='${booking_time}']
    Wait Until Element Is Visible    locator=${booking_locator}    timeout=${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until Element Is Visible    locator=${QUICKNOTE_LOCATORS}[button.add_quicknote]    timeout=${LONG_WAIT}

Add Quicknote To Booking
    [Documentation]    Adds a quicknote to the currently opened booking details using the provided quicknote data (text, image, pdf).
    [Arguments]    &{quicknote_data}
    Click    ${QUICKNOTE_LOCATORS}[button.add_quicknote]
    Wait Until Element Is Visible    locator=${QUICKNOTE_LOCATORS}[dialog.quicknote]    timeout=${LONG_WAIT}
    Enter Quicknote Data    &{quicknote_data}
    Click    ${QUICKNOTE_LOCATORS}[button.save_quicknote]
    Wait Until Element Is Invisible    locator=${QUICKNOTE_LOCATORS}[dialog.quicknote]    timeout=${LONG_WAIT}
    Wait Until Element Is Visible    locator=${QUICKNOTE_LOCATORS}[section.quicknote_list]    timeout=${LONG_WAIT}

Enter Quicknote Data
    [Documentation]    Enters quicknote fields (text, image, pdf) dynamically using dictionary keys.
    [Arguments]    &{quicknote_data}
    FOR    ${field}    ${value}    IN    &{quicknote_data}
        ${locator}    Get From Dictionary    ${QUICKNOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('upload.')
        ...    Upload File    ${locator}    ${value}
    END

Validate Quicknote Is Saved And Displayed
    [Documentation]    Validates that the quicknote is saved and displayed with the correct text, image, and PDF.
    [Arguments]    &{quicknote_data}
    ${quicknote_text_locator}    Set Variable    ${QUICKNOTE_LOCATORS}[label.quicknote_text]
    ${quicknote_image_locator}    Set Variable    ${QUICKNOTE_LOCATORS}[img.quicknote_image]
    ${quicknote_pdf_locator}    Set Variable    ${QUICKNOTE_LOCATORS}[link.quicknote_pdf]
    Wait Until Element Is Visible    locator=${quicknote_text_locator}    timeout=${LONG_WAIT}
    ${actual_text}    Get Text    ${quicknote_text_locator}
    Should Contain    ${actual_text}    ${quicknote_data}[input.text]
    Wait Until Element Is Visible    locator=${quicknote_image_locator}    timeout=${LONG_WAIT}
    ${actual_image_src}    Get Element Attribute    ${quicknote_image_locator}    src
    Should Contain    ${actual_image_src}    ${quicknote_data}[upload.image]
    Wait Until Element Is Visible    locator=${quicknote_pdf_locator}    timeout=${LONG_WAIT}
    ${actual_pdf_link}    Get Element Attribute    ${quicknote_pdf_locator}    href
    Should Contain    ${actual_pdf_link}    ${quicknote_data}[upload.pdf]

Upload File
    [Documentation]    Uploads a file to the specified input field.
    [Arguments]    ${locator}    ${file_path}
    Choose File    ${locator}    ${file_path}
