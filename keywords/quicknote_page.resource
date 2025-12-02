*** Settings ***
Documentation    This resource file contains all keywords related to Quicknote functionality for booking diary entries.
Resource    ../common/super.resource
Resource    ../object_repository/add_edit_page.resource

*** Keywords ***
Add Quicknote To Booking
    [Documentation]    Adds a quicknote (text, image, PDF) to a booking using provided quicknote data.
    [Arguments]    &{quicknote_data}
    Open Quicknote Modal
    Enter Quicknote Data    &{quicknote_data}
    Save And Print Quicknote
    Wait Until Quicknote Modal Is Closed

Open Booking Details
    [Documentation]    Opens the booking details for the specified booking time.
    [Arguments]    ${booking_time}
    ${booking_locator}=    Set Variable    //div[contains(@class,'start') and text()='${booking_time}']
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until Element Is Visible    ${dialog.quicknote_modal}    ${LONG_WAIT}

Open Quicknote Modal
    [Documentation]    Ensures the Quicknote modal/dialog is open before adding data.
    Wait Until Element Is Visible    ${dialog.quicknote_modal}    ${LONG_WAIT}

Enter Quicknote Data
    [Documentation]    Enters quicknote data (text, image, PDF) using the provided dictionary.
    [Arguments]    &{quicknote_data}
    FOR    ${field}    ${value}    IN    &{quicknote_data}
        Run Keyword If    '${field}' == 'input.text'    Fill Quicknote Text    ${value}
        Run Keyword If    '${field}' == 'upload.image'    Upload Quicknote Image    ${value}
        Run Keyword If    '${field}' == 'upload.pdf'    Upload Quicknote PDF    ${value}
    END

Fill Quicknote Text
    [Documentation]    Fills the quicknote text area with the provided text.
    [Arguments]    ${text}
    Fill Text    ${QUICKNOTE_LOCATORS}[input.text]    ${text}

Upload Quicknote Image
    [Documentation]    Uploads an image to the quicknote using the add image button.
    [Arguments]    ${image_file}
    Click    ${QUICKNOTE_LOCATORS}[button.add_image]
    Press Keys    ${QUICKNOTE_LOCATORS}[button.add_image]    ${image_file}
    Wait Until    1s

Upload Quicknote PDF
    [Documentation]    Uploads a PDF to the quicknote using the add PDF button.
    [Arguments]    ${pdf_file}
    Click    ${QUICKNOTE_LOCATORS}[button.add_pdf]
    Press Keys    ${QUICKNOTE_LOCATORS}[button.add_pdf]    ${pdf_file}
    Wait Until    1s

Save And Print Quicknote
    [Documentation]    Saves and prints the quicknote by clicking the print quicknote button.
    Click    ${QUICKNOTE_LOCATORS}[button.print_quicknote]
    Wait Until Element Is Invisible    ${dialog.quicknote_modal}    ${LONG_WAIT}

Wait Until Quicknote Modal Is Closed
    [Documentation]    Waits until the quicknote modal/dialog is closed after saving/printing.
    Wait Until Element Is Invisible    ${dialog.quicknote_modal}    ${LONG_WAIT}

Validate Quicknote Is Auto Completed And Printout Rendered
    [Documentation]    Validates that the quicknote is auto-completed and printout is rendered with image, text, and PDF as expected.
    [Arguments]    &{quicknote_data}
    Validate Quicknote Text Is Auto Completed    ${quicknote_data}[input.text]
    Validate Quicknote Image Is Rendered    ${quicknote_data}[upload.image]
    Validate Quicknote PDF Is Rendered    ${quicknote_data}[upload.pdf]
    Validate Quicknote Printout Is Rendered

Validate Quicknote Text Is Auto Completed
    [Documentation]    Validates that the quicknote text is auto completed with the expected value.
    [Arguments]    ${expected_text}
    ${actual_text}=    Get Text    ${QUICKNOTE_LOCATORS}[input.text]
    Should Contain    ${actual_text}    ${expected_text}

Validate Quicknote Image Is Rendered
    [Documentation]    Validates that the quicknote image is rendered after upload.
    [Arguments]    ${expected_image}
    ${image_locator}=    Set Variable    //img[contains(@src,'${expected_image}')]
    Wait Until Element Is Visible    ${image_locator}    ${LONG_WAIT}

Validate Quicknote PDF Is Rendered
    [Documentation]    Validates that the quicknote PDF is rendered after upload.
    [Arguments]    ${expected_pdf}
    ${pdf_locator}=    Set Variable    //a[contains(@href,'${expected_pdf}')]
    Wait Until Element Is Visible    ${pdf_locator}    ${LONG_WAIT}

Validate Quicknote Printout Is Rendered
    [Documentation]    Validates that the quicknote printout is rendered after saving/printing.
    ${printout_locator}=    Set Variable    //div[contains(@class,'quicknote-printout')]
    Wait Until Element Is Visible    ${printout_locator}    ${LONG_WAIT}
