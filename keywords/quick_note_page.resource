*** Settings ***
Documentation    This resource file contains all keywords for adding and validating Quick Notes in the diary booking workflow.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary booking display and then opens the Clinical sidebar for the selected booking.
    Click    ${BOOKING_DISPLAY_BUTTON}
    Wait Until Element Is Visible    ${CLINICAL_BUTTON}    ${LONG_WAIT}
    Click    ${CLINICAL_BUTTON}
    Wait Until Element Is Visible    ${SELECT_BOOKING_CLINICAL_LINK}    ${LONG_WAIT}
    Click    ${SELECT_BOOKING_CLINICAL_LINK}
    Wait Until Element Is Visible    ${FORMS_LIBRARY_DROPDOWN}    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the Forms Library dropdown.
    [Arguments]    ${quicknote_form_locator}
    Wait Until Element Is Visible    ${FORMS_LIBRARY_DROPDOWN}    ${LONG_WAIT}
    Click    ${FORMS_LIBRARY_DROPDOWN}
    Wait Until Element Is Visible    ${QUICK_NOTE_OPTION}    ${LONG_WAIT}
    Click    ${QUICK_NOTE_OPTION}
    Wait Until Element Is Visible    ${QUICK_NOTE_LIST_ITEM}    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LIST_ITEM}
    Wait Until Element Is Visible    ${ADD_IMAGE_BUTTON}    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note using the provided image path.
    [Arguments]    ${quicknote_image_upload_locator}    ${image_path}
    Click    ${ADD_IMAGE_BUTTON}
    Wait Until Element Is Visible    ${CHOOSE_IMAGE_FILE_INPUT}    ${LONG_WAIT}
    Upload File To Input    ${CHOOSE_IMAGE_FILE_INPUT}    ${image_path}
    Wait Until    1s

Add Text To Quick Note
    [Documentation]    Adds the specified text to the Quick Note textarea.
    [Arguments]    ${quicknote_textarea_locator}    ${note_text}
    Wait Until Element Is Visible    ${NOTE_TEXTAREA}    ${LONG_WAIT}
    Fill Text    ${NOTE_TEXTAREA}    ${note_text}
    Wait Until    1s

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note using the provided PDF path.
    [Arguments]    ${quicknote_pdf_upload_locator}    ${pdf_path}
    Wait Until Element Is Visible    ${UPLOAD_PDF_FILE_INPUT}    ${LONG_WAIT}
    Upload File To Input    ${UPLOAD_PDF_FILE_INPUT}    ${pdf_path}
    Wait Until    1s

Print Quick Note
    [Documentation]    Saves and prints the Quick Note, ensuring the printout renders with the image, text, and PDF.
    [Arguments]    ${quicknote_print_button_locator}
    Click    ${SAVE_BUTTON}
    Wait Until Element Is Invisible    ${SAVE_BUTTON}    ${LONG_WAIT}
    Wait Until Element Is Visible    ${PRINT_BUTTON}    ${LONG_WAIT}
    Click    ${PRINT_BUTTON}
    Wait Until    2s

Upload File To Input
    [Documentation]    Uploads a file to the specified input element.
    [Arguments]    ${input_locator}    ${file_path}
    Choose File    ${input_locator}    ${file_path}

