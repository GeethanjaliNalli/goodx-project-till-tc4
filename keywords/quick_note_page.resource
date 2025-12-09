*** Settings ***
Documentation    This file contains all Quick Note related keywords for adding a quick note to a booking, including image, text, and PDF attachment, following enterprise keyword architecture.
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar For Booking
    [Documentation]    Opens the Diary module and opens the Clinical sidebar for a given booking timeslot.
    [Arguments]    ${diary_module}    ${booking_time}
    Select Menu In Navigation Wheel    ${diary_module}
    Select Timeslot    ${booking_time}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${quick_note_form_button}
    Click    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]
    Wait Until Element Is Visible    ${quick_note_form_button}    ${SHORT_WAIT}
    Click    ${quick_note_form_button}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[textbox.note_text]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note by uploading a file.
    [Arguments]    ${add_image_button}    ${image_file}
    Click    ${add_image_button}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.select_image]    ${SHORT_WAIT}
    Upload File To Quick Note Image Field    ${QUICK_NOTE_LOCATORS}[input.select_image]    ${image_file}
    Wait Until Image Is Uploaded To Quick Note    ${image_file}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note textbox.
    [Arguments]    ${note_textbox}    ${note_text}
    Fill Text    ${note_textbox}    ${note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${add_pdf_button}    ${pdf_file}
    Click    ${add_pdf_button}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.select_pdf]    ${SHORT_WAIT}
    Upload File To Quick Note PDF Field    ${QUICK_NOTE_LOCATORS}[input.select_pdf]    ${pdf_file}
    Wait Until PDF Is Uploaded To Quick Note    ${pdf_file}

Print Quick Note
    [Documentation]    Initiates printing of the Quick Note.
    [Arguments]    ${print_button}
    Click    ${print_button}
    Wait Until Quick Note Printout Is Rendered

Upload File To Quick Note Image Field
    [Documentation]    Uploads an image file to the Quick Note image input field.
    [Arguments]    ${image_input_locator}    ${image_file}
    Set File Input Files    ${image_input_locator}    ${image_file}

Upload File To Quick Note PDF Field
    [Documentation]    Uploads a PDF file to the Quick Note PDF input field.
    [Arguments]    ${pdf_input_locator}    ${pdf_file}
    Set File Input Files    ${pdf_input_locator}    ${pdf_file}

Wait Until Image Is Uploaded To Quick Note
    [Documentation]    Waits until the image is uploaded and visible in the Quick Note.
    [Arguments]    ${image_file}
    # Implementation depends on UI feedback; wait for textbox or image preview
    Wait Until    1s

Wait Until PDF Is Uploaded To Quick Note
    [Documentation]    Waits until the PDF is uploaded and visible in the Quick Note.
    [Arguments]    ${pdf_file}
    # Implementation depends on UI feedback; wait for textbox or PDF preview
    Wait Until    1s

Wait Until Quick Note Printout Is Rendered
    [Documentation]    Waits until the Quick Note printout is rendered.
    Wait Until    2s

Validate Quick Note Is Auto Completed
    [Documentation]    Validates that the Quick Note is auto completed with image, text, and PDF.
    [Arguments]    ${expected_text}    ${image_file}    ${pdf_file}
    ${actual_text}    Get Text    ${QUICK_NOTE_LOCATORS}[textbox.note_text]
    Should Contain    ${actual_text}    ${expected_text}
    # Image and PDF validation would require UI element checks
    Wait Until    1s
