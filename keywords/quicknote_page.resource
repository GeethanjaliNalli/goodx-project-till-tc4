*** Settings ***
Documentation    This resource file contains all keywords related to Quicknote functionality for booking diary entries, including adding, validating, and interacting with quicknotes.
Resource    ../common/super.resource

*** Keywords ***
Open Booking Details
    [Documentation]    Opens the booking details dialog for the specified booking time.
    [Arguments]    ${booking_time}
    ${booking_locator}=    Evaluate    "//div[contains(@class,'start') and text()='${booking_time}']"
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}
    Click    ${booking_locator}
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[button.open-forms-library]    ${LONG_WAIT}

Add Quicknote To Booking
    [Documentation]    Adds a quicknote to the booking using provided quicknote data (text, image, pdf).
    [Arguments]    &{quicknote_data}
    Open Forms Library
    Select Quicknote From Forms Library
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}
    Enter Quicknote Data    &{quicknote_data}
    Save Quicknote
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}

Validate Quicknote Is Rendered Correctly
    [Documentation]    Validates that the quicknote is rendered with the correct text, image, and PDF after addition.
    [Arguments]    &{quicknote_data}
    Open Quicknote Print Preview
    Validate Quicknote Text    ${quicknote_data}[input.quicknote_text]
    Validate Quicknote Image    ${quicknote_data}[input.quicknote_image]
    Validate Quicknote PDF    ${quicknote_data}[input.quicknote_pdf]
    Close Quicknote Print Preview

Open Forms Library
    [Documentation]    Opens the Forms Library from the booking details dialog.
    Click    ${QUICKNOTE_LOCATORS}[button.open-forms-library]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[select.forms-library]    ${SHORT_WAIT}

Select Quicknote From Forms Library
    [Documentation]    Selects 'Quick Note' from the forms library dropdown and opens the quicknote dialog.
    Select Options By    ${QUICKNOTE_LOCATORS}[select.forms-library]    label    Quick Note
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[item.quicknote]    ${SHORT_WAIT}
    Click    ${QUICKNOTE_LOCATORS}[item.quicknote]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[label.quicknote-title]    ${SHORT_WAIT}

Enter Quicknote Data
    [Documentation]    Enters quicknote data (text, image, pdf) into the quicknote dialog using dictionary keys.
    [Arguments]    &{quicknote_data}
    FOR    ${field}    ${value}    IN    &{quicknote_data}
        Run Keyword If    '${field}' == 'input.quicknote_text' and '${value}' != ''    Fill Text    ${QUICKNOTE_LOCATORS}[input.quicknote.text]    ${value}
        Run Keyword If    '${field}' == 'input.quicknote_image' and '${value}' != ''    Add Quicknote Image    ${value}
        Run Keyword If    '${field}' == 'input.quicknote_pdf' and '${value}' != ''    Add Quicknote PDF    ${value}
    END

Add Quicknote Image
    [Documentation]    Adds an image to the quicknote.
    [Arguments]    ${image_path}
    Click    ${QUICKNOTE_LOCATORS}[button.add-image]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[button.upload-image]    ${SHORT_WAIT}
    Upload File    ${QUICKNOTE_LOCATORS}[button.upload-image]    ${image_path}
    Wait Until    1s

Add Quicknote PDF
    [Documentation]    Adds a PDF to the quicknote.
    [Arguments]    ${pdf_path}
    Click    ${QUICKNOTE_LOCATORS}[button.upload-pdf]
    Upload File    ${QUICKNOTE_LOCATORS}[button.upload-pdf]    ${pdf_path}
    Wait Until    1s

Save Quicknote
    [Documentation]    Saves the quicknote entry.
    Click    ${QUICKNOTE_LOCATORS}[button.save-quicknote]
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}

Open Quicknote Print Preview
    [Documentation]    Opens the print preview for the quicknote.
    Click    ${QUICKNOTE_LOCATORS}[button.print-quicknote]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}

Close Quicknote Print Preview
    [Documentation]    Closes the quicknote print preview dialog.
    Click    ${button.close-quicknote-dialog}
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${SHORT_WAIT}

Validate Quicknote Text
    [Documentation]    Validates that the quicknote text is displayed in the print preview.
    [Arguments]    ${expected_text}
    ${actual_text}=    Get Text    ${QUICKNOTE_LOCATORS}[input.quicknote.text]
    Should Contain    ${actual_text}    ${expected_text}

Validate Quicknote Image
    [Documentation]    Validates that the quicknote image is displayed in the print preview.
    [Arguments]    ${expected_image_path}
    ${image_locator}=    Evaluate    "//img[contains(@src, '${expected_image_path.split('/')[-1]}')]"
    Wait Until Element Is Visible    ${image_locator}    ${SHORT_WAIT}

Validate Quicknote PDF
    [Documentation]    Validates that the quicknote PDF is displayed in the print preview.
    [Arguments]    ${expected_pdf_path}
    ${pdf_locator}=    Evaluate    "//a[contains(@href, '${expected_pdf_path.split('/')[-1]}')]"
    Wait Until Element Is Visible    ${pdf_locator}    ${SHORT_WAIT}
