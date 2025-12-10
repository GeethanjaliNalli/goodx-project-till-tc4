*** Settings ***
Documentation    This resource file contains all the keywords for Quick Note functionality in the Diary module.
Resource    ../common/super.resource
Resource    ../Testdata/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module and clinical sidebar for a booking.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Wait Until Element Is Visible    ${DIARY_PAGE_LOCATORS}[booking.timeslot]    ${LONG_WAIT}
    Click    ${DIARY_PAGE_LOCATORS}[booking.timeslot]
    Wait Until Element Is Visible    ${DIARY_PAGE_LOCATORS}[button.clinical.sidebar]    ${LONG_WAIT}
    Click    ${DIARY_PAGE_LOCATORS}[button.clinical.sidebar]
    Wait Until Element Is Visible    ${CLINICAL_SIDEBAR_LOCATORS}[quicknote.tab]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form in the clinical sidebar.
    Click    ${CLINICAL_SIDEBAR_LOCATORS}[quicknote.tab]
    Wait Until Element Is Visible    ${QUICK_NOTE_FORM_LOCATORS}[input.quicknote_text]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note form.
    [Arguments]    ${image_file}
    Click    ${QUICK_NOTE_FORM_LOCATORS}[button.add.image]
    Wait Until Element Is Visible    ${QUICK_NOTE_FORM_LOCATORS}[input.upload.image]    ${LONG_WAIT}
    Upload File To Quick Note Image    ${image_file}
    Wait Until Element Is Visible    ${QUICK_NOTE_FORM_LOCATORS}[image.preview]    ${LONG_WAIT}

Add Quick Note Text
    [Documentation]    Adds text to the Quick Note form.
    [Arguments]    ${note_text}
    Fill Text    ${QUICK_NOTE_FORM_LOCATORS}[input.quicknote_text]    ${note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note form.
    [Arguments]    ${pdf_file}
    Click    ${QUICK_NOTE_FORM_LOCATORS}[button.add.pdf]
    Wait Until Element Is Visible    ${QUICK_NOTE_FORM_LOCATORS}[input.upload.pdf]    ${LONG_WAIT}
    Upload File To Quick Note PDF    ${pdf_file}
    Wait Until Element Is Visible    ${QUICK_NOTE_FORM_LOCATORS}[pdf.preview]    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note and waits for print preview with all content.
    Click    ${QUICK_NOTE_FORM_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${QUICK_NOTE_FORM_LOCATORS}[print.preview]    ${LONG_WAIT}
    Validate Quick Note Print Preview    ${QUICK_NOTE_DATA}

Upload File To Quick Note Image
    [Documentation]    Uploads an image file to the Quick Note image input.
    [Arguments]    ${image_file}
    Upload File    ${QUICK_NOTE_FORM_LOCATORS}[input.upload.image]    ${image_file}

Upload File To Quick Note PDF
    [Documentation]    Uploads a PDF file to the Quick Note PDF input.
    [Arguments]    ${pdf_file}
    Upload File    ${QUICK_NOTE_FORM_LOCATORS}[input.upload.pdf]    ${pdf_file}

Validate Quick Note Print Preview
    [Documentation]    Validates that the print preview contains the image, text, and PDF as expected.
    [Arguments]    &{quick_note_data}
    Wait Until Element Is Visible    ${QUICK_NOTE_FORM_LOCATORS}[print.preview.image]    ${LONG_WAIT}
    Wait Until Element Is Visible    ${QUICK_NOTE_FORM_LOCATORS}[print.preview.text]    ${LONG_WAIT}
    Wait Until Element Is Visible    ${QUICK_NOTE_FORM_LOCATORS}[print.preview.pdf]    ${LONG_WAIT}
    ${actual_text}    Get Text    ${QUICK_NOTE_FORM_LOCATORS}[print.preview.text]
    Should Contain    ${actual_text}    ${quick_note_data}[input.quicknote_text]
    # Optionally, verify image and PDF presence by checking visibility or file name if visible

