*** Settings ***
Documentation    This resource file contains all keywords related to Quick Note functionality in the Diary module.
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Navigates to the Diary and opens the Clinical sidebar for the selected booking.
    Wait Until Element Is Visible    ${BOOKING_SELECT_BUTTON}    ${LONG_WAIT}
    Click    ${BOOKING_SELECT_BUTTON}
    Wait Until Element Is Visible    ${CLINICAL_BUTTON}    ${LONG_WAIT}
    Click    ${CLINICAL_BUTTON}
    Wait Until Element Is Visible    ${BOOKING_CLINICAL_LINK}    ${LONG_WAIT}
    Click    ${BOOKING_CLINICAL_LINK}
    Wait Until Element Is Visible    ${FORMS_LIBRARY_DROPDOWN}    ${LONG_WAIT}

Select Quick Note Form In Clinical Sidebar
    [Documentation]    Selects the Quick Note form from the Clinical sidebar forms dropdown.
    Click    ${FORMS_LIBRARY_DROPDOWN}
    Wait Until Element Is Visible    ${FORMS_LIBRARY_DROPDOWN_BUTTON}    ${SHORT_WAIT}
    Click    ${FORMS_LIBRARY_DROPDOWN_BUTTON}
    Wait Until Element Is Visible    ${QUICK_NOTE_OPTION}    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_OPTION}
    Wait Until Element Is Visible    ${QUICK_NOTE_LIST_ITEM}    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LIST_ITEM}
    Wait Until Element Is Visible    ${ADD_IMAGE_BUTTON}    ${SHORT_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note form.
    [Arguments]    ${image_file}
    Click    ${ADD_IMAGE_BUTTON}
    Wait Until Element Is Visible    ${UPLOAD_IMAGE_FROM_FILE_BUTTON}    ${SHORT_WAIT}
    Click    ${UPLOAD_IMAGE_FROM_FILE_BUTTON}
    Wait Until Element Is Visible    ${IMAGE_FILE_INPUT}    ${SHORT_WAIT}
    Upload File    ${IMAGE_FILE_INPUT}    ${image_file}
    Wait Until    2s

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note form.
    [Arguments]    ${quick_note_text}
    Wait Until Element Is Visible    ${QUICK_NOTE_TEXTAREA}    ${SHORT_WAIT}
    Fill Text    ${QUICK_NOTE_TEXTAREA}    ${quick_note_text}
    Wait Until    1s

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note form.
    [Arguments]    ${pdf_file}
    Wait Until Element Is Visible    ${PDF_UPLOAD_INPUT}    ${SHORT_WAIT}
    Upload File    ${PDF_UPLOAD_INPUT}    ${pdf_file}
    Wait Until    2s

Print Quick Note
    [Documentation]    Saves and prints the Quick Note, ensuring printout renders with image, text, and PDF.
    Click    ${SAVE_BUTTON}
    Wait Until Element Is Invisible    ${SAVE_BUTTON}    ${LONG_WAIT}
    Wait Until Element Is Visible    ${PRINT_BUTTON}    ${SHORT_WAIT}
    Click    ${PRINT_BUTTON}
    Wait Until    2s

# Low-level atomic helpers
Upload File
    [Documentation]    Uploads a file to the specified input field.
    [Arguments]    ${input_locator}    ${file_path}
    Choose File    ${input_locator}    ${file_path}

