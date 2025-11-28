*** Settings ***
Documentation    This diary page resource file has all the diary and quicknote related keywords.
Resource    ../common/super.resource

*** Keywords ***
Open Booking Details
    [Documentation]    Opens the booking details for the specified booking time in the diary grid.
    [Arguments]    ${booking_time}
    ${booking_locator}=    Set Variable    //div[contains(@class,'start') and text()='${booking_time}']/ancestor::div[contains(@class,'booking')]
    Wait Until Element Is Visible    locator=${booking_locator}    timeout=${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until Element Is Visible    locator=${DIARY_GRID_LOCATORS}[span.booking_view_notebook]    timeout=${SHORT_WAIT}
    Click    ${DIARY_GRID_LOCATORS}[span.booking_view_notebook]
    Wait Until Element Is Visible    locator=${QUICKNOTE_EVENT_LOCATORS}[button.add_image]    timeout=${SHORT_WAIT}

Add Quicknote To Booking
    [Documentation]    Adds a quicknote (with text, image, and PDF) to the currently opened booking using the provided quicknote info dictionary.
    [Arguments]    &{quicknote_info}
    Enter Quicknote Data    &{quicknote_info}
    Attach Quicknote Image    ${quicknote_info}[attach.image]
    Attach Quicknote PDF    ${quicknote_info}[attach.pdf]

Enter Quicknote Data
    [Documentation]    Enters quicknote fields dynamically using dictionary keys.
    [Arguments]    &{quicknote_info}
    FOR    ${field}    ${value}    IN    &{quicknote_info}
        Run Keyword If    '${field}' == 'input.text'    Fill Text    ${QUICKNOTE_EVENT_LOCATORS}[textarea.note]    ${value}
    END

Attach Quicknote Image
    [Documentation]    Attaches an image file to the quicknote if provided.
    [Arguments]    ${image_file}
    Run Keyword If    '${image_file}' != ''    Click    ${QUICKNOTE_EVENT_LOCATORS}[button.add_image]
    Run Keyword If    '${image_file}' != ''    Upload File    ${QUICKNOTE_EVENT_LOCATORS}[input.pdf_file]    ${image_file}

Attach Quicknote PDF
    [Documentation]    Attaches a PDF file to the quicknote if provided.
    [Arguments]    ${pdf_file}
    Run Keyword If    '${pdf_file}' != ''    Upload File    ${QUICKNOTE_EVENT_LOCATORS}[input.pdf_file]    ${pdf_file}

Save Quicknote
    [Documentation]    Saves the quicknote for the booking.
    Click    ${QUICKNOTE_EVENT_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${QUICKNOTE_EVENT_LOCATORS}[button.save]    timeout=${LONG_WAIT}

Validate Quicknote Is Saved And Printable
    [Documentation]    Validates that the quicknote is saved and can be printed with the image, text, and PDF added.
    [Arguments]    &{expected_result}
    Click    ${QUICKNOTE_EVENT_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${QUICKNOTE_EVENT_LOCATORS}[button.print]    ${SHORT_WAIT}
    Run Keyword If    ${expected_result}[contains_image]    Validate Quicknote Contains Image
    Run Keyword If    ${expected_result}[contains_text]    Validate Quicknote Contains Text
    Run Keyword If    ${expected_result}[contains_pdf]    Validate Quicknote Contains PDF
    Run Keyword If    ${expected_result}[quicknote_printable]    Validate Quicknote Print Preview Is Displayed

Validate Quicknote Contains Image
    [Documentation]    Validates that the quicknote print preview contains the attached image.
    Wait Until Element Is Visible    ${QUICKNOTE_EVENT_LOCATORS}[img.profile_picture]    ${SHORT_WAIT}

Validate Quicknote Contains Text
    [Documentation]    Validates that the quicknote print preview contains the entered note text.
    ${note_text}=    Get Text    ${QUICKNOTE_EVENT_LOCATORS}[textarea.note]
    Should Contain    ${note_text}    Patient reported mild headache. Prescribed paracetamol.

Validate Quicknote Contains PDF
    [Documentation]    Validates that the quicknote print preview contains the attached PDF file.
    Wait Until Element Is Visible    ${QUICKNOTE_EVENT_LOCATORS}[input.pdf_file]    ${SHORT_WAIT}

Validate Quicknote Print Preview Is Displayed
    [Documentation]    Validates that the quicknote print preview is displayed.
    Wait Until Element Is Visible    ${QUICKNOTE_EVENT_LOCATORS}[button.print]    ${SHORT_WAIT}

Upload File
    [Documentation]    Uploads a file to the specified file input locator.
    [Arguments]    ${locator}    ${file_path}
    Choose File    ${locator}    ${file_path}
