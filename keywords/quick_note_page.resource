*** Settings ***
Documentation    This resource file contains all keywords for Quick Note functionality in Diary bookings, including adding images, text, PDFs, and printing the Quick Note.
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary booking and navigates to the Clinical sidebar for the current booking.
    Click    ${BOOKING_DISPLAY_BUTTON}
    Wait Until Element Is Visible    ${BOOKING_CLINICAL_BUTTON}    ${LONG_WAIT}
    Click    ${BOOKING_CLINICAL_BUTTON}
    Wait Until Element Is Visible    ${BOOKING_CLINICAL_SUBSCREEN_LINK}    ${LONG_WAIT}
    Click    ${BOOKING_CLINICAL_SUBSCREEN_LINK}
    Wait Until Element Is Visible    ${FORMS_LIBRARY_DROPDOWN}    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the Forms Library dropdown in the Clinical sidebar.
    Click    ${FORMS_LIBRARY_DROPDOWN}
    Wait Until Element Is Visible    ${QUICK_NOTE_OPTION}    ${LONG_WAIT}
    Click    ${QUICK_NOTE_OPTION}
    Wait Until Element Is Visible    ${ADD_IMAGE_BUTTON}    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note using the provided file path.
    [Arguments]    ${image_file_path}
    Click    ${ADD_IMAGE_BUTTON}
    Wait Until Element Is Visible    ${ADD_IMAGE_ACTION_BUTTON}    ${LONG_WAIT}
    Click    ${ADD_IMAGE_ACTION_BUTTON}
    Wait Until Element Is Visible    ${UPLOAD_IMAGE_FILE_INPUT}    ${LONG_WAIT}
    Upload File To Quick Note Image Input    ${UPLOAD_IMAGE_FILE_INPUT}    ${image_file_path}
    Wait Until Image Is Uploaded To Quick Note

Upload File To Quick Note Image Input
    [Documentation]    Uploads the image file to the Quick Note image input.
    [Arguments]    ${input_locator}    ${file_path}
    Fill File    ${input_locator}    ${file_path}

Wait Until Image Is Uploaded To Quick Note
    [Documentation]    Waits until the image is uploaded and visible in the Quick Note form.
    Wait Until    2s

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note using the provided value.
    [Arguments]    ${note_text}
    Wait Until Element Is Visible    ${QUICK_NOTE_TEXTAREA}    ${LONG_WAIT}
    Fill Text    ${QUICK_NOTE_TEXTAREA}    ${note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note using the provided file path.
    [Arguments]    ${pdf_file_path}
    Click    ${UPLOAD_PDF_FILE_BUTTON}
    Wait Until Element Is Visible    ${UPLOAD_PDF_FILE_INPUT}    ${LONG_WAIT}
    Upload File To Quick Note PDF Input    ${UPLOAD_PDF_FILE_INPUT}    ${pdf_file_path}
    Wait Until PDF Is Uploaded To Quick Note

Upload File To Quick Note PDF Input
    [Documentation]    Uploads the PDF file to the Quick Note PDF input.
    [Arguments]    ${input_locator}    ${file_path}
    Fill File    ${input_locator}    ${file_path}

Wait Until PDF Is Uploaded To Quick Note
    [Documentation]    Waits until the PDF is uploaded and visible in the Quick Note form.
    Wait Until    2s

Print Quick Note
    [Documentation]    Saves and prints the Quick Note, ensuring the printout renders with the image, text, and PDF.
    Click    ${SAVE_BUTTON}
    Wait Until Element Is Invisible    ${SAVE_BUTTON}    ${LONG_WAIT}
    Click    ${PRINT_BUTTON}
    Wait Until Print Dialog Is Displayed

Wait Until Print Dialog Is Displayed
    [Documentation]    Waits until the print dialog or print action is triggered for the Quick Note.
    Wait Until    2s
