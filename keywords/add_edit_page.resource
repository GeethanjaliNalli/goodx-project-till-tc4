*** Settings ***
Documentation    This add edit page resource file has all the add and edit page related keywords, including Quicknote functionality.
Resource    ../common/super.resource

*** Keywords ***
Select Existing Booking With New Patient
    [Documentation]    Selects an existing booking in the diary for a new patient (not yet added to debtor list).
    # Assumes booking is visible on diary grid, selects first matching booking with new patient
    ${booking_locator}=    Evaluate    "//div[contains(@class,'booking') and .//span[contains(@class,'patient-type') and text()='New Patient']]"    modules=BuiltIn
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until Element Is Visible    ${button.open_forms_library}    ${LONG_WAIT}

Open Quicknote Section For Booking
    [Documentation]    Opens the Quicknote section for the selected booking.
    Click    ${button.open_forms_library}
    Wait Until Element Is Visible    ${select.forms_library}    ${LONG_WAIT}
    Select Options By    ${select.forms_library}    label    Quick Note
    Wait Until Element Is Visible    ${item.quicknote}    ${LONG_WAIT}
    Click    ${item.quicknote}
    Wait Until Element Is Visible    ${input.quicknote_text}    ${LONG_WAIT}

Add Quicknote Details
    [Documentation]    Adds quicknote details (text, image, PDF) using provided data dictionary.
    [Arguments]    &{quicknote_data}
    FOR    ${field}    ${value}    IN    &{quicknote_data}
        Run Keyword If    '${field}' == 'input.text'    Fill Text    ${input.quicknote_text}    ${value}
        Run Keyword If    '${field}' == 'upload.image'    Upload Quicknote Image    ${value}
        Run Keyword If    '${field}' == 'upload.pdf'    Upload Quicknote PDF    ${value}
    END

Upload Quicknote Image
    [Documentation]    Uploads an image to the quicknote section.
    [Arguments]    ${image_path}
    Click    ${button.add_image}
    Wait Until Element Is Visible    ${button.upload_image}    ${LONG_WAIT}
    Upload File    ${button.upload_image}    ${image_path}
    Wait Until    1s

Upload Quicknote PDF
    [Documentation]    Uploads a PDF to the quicknote section.
    [Arguments]    ${pdf_path}
    Click    ${button.upload_pdf}
    Upload File    ${button.upload_pdf}    ${pdf_path}
    Wait Until    1s

Save Quicknote
    [Documentation]    Saves the quicknote form.
    Click    ${button.save}
    Wait Until Element Is Invisible    ${input.quicknote_text}    timeout=${LONG_WAIT}

Validate Quicknote Rendered With Details
    [Documentation]    Validates that the quicknote is auto completed and rendered with the image, text, and PDF as provided.
    [Arguments]    &{quicknote_data}
    # Validate text
    ${quicknote_text_locator}=    Set Variable    ${input.quicknote_text}
    Wait Until Element Is Visible    ${quicknote_text_locator}    ${LONG_WAIT}
    ${actual_text}=    Get Text    ${quicknote_text_locator}
    Should Contain    ${actual_text}    ${quicknote_data}[input.text]
    # Validate image
    ${image_preview_locator}=    Evaluate    "//img[contains(@src, '${quicknote_data}[upload.image]')]"    modules=BuiltIn
    Wait Until Element Is Visible    ${image_preview_locator}    ${LONG_WAIT}
    # Validate PDF
    ${pdf_preview_locator}=    Evaluate    "//a[contains(@href, '${quicknote_data}[upload.pdf]')]"    modules=BuiltIn
    Wait Until Element Is Visible    ${pdf_preview_locator}    ${LONG_WAIT}
    # Validate print button is present
    Wait Until Element Is Visible    ${button.print}    ${LONG_WAIT}

Upload File
    [Documentation]    Uploads a file to the specified locator.
    [Arguments]    ${locator}    ${file_path}
    Choose File    ${locator}    ${file_path}
