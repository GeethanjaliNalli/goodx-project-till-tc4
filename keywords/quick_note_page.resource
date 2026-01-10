*** Settings ***
Documentation    This resource file contains all keywords for Quick Note functionality (Add Quick Note to Booking).
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module and opens the Clinical Sidebar for the specified booking time.
    [Arguments]    ${diary_module}    ${booking_time}
    Select Menu In Navigation Wheel    ${diary_module}
    Select Timeslot    ${booking_time}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_booking]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.open_clinical]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.open_clinical]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the Clinical Sidebar forms library.
    [Arguments]    ${form_name}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library]    label    ${form_name}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[option.quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image attachment to the Quick Note form.
    [Arguments]    ${image_upload_button}    ${image_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Upload File To Quick Note    ${image_path}
    Wait Until Image Is Uploaded To Quick Note    ${image_path}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note form.
    [Arguments]    ${text_field_locator}    ${quick_note_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${quick_note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file as an attachment to the Quick Note form.
    [Arguments]    ${pdf_upload_button}    ${pdf_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Upload File To Quick Note    ${pdf_path}
    Wait Until PDF Is Uploaded To Quick Note    ${pdf_path}

Print Quick Note
    [Documentation]    Prints the Quick Note after attachments and text are added.
    [Arguments]    ${print_button_locator}
    Click    ${QUICK_NOTE_LOCATORS}[button.print_quick_note]
    Wait Until Quick Note Print Dialog Is Visible

Validate Quick Note Created With All Attachments
    [Documentation]    Validates that the Quick Note is created with image, text, and PDF displayed correctly.
    [Arguments]    ${validation_section}    ${expected_text}    ${expected_image_path}    ${expected_pdf_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${LONG_WAIT}
    ${actual_text}=    Get Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]
    Should Contain    ${actual_text}    ${expected_text}
    Validate Image Is Displayed In Quick Note    ${expected_image_path}
    Validate PDF Is Displayed In Quick Note    ${expected_pdf_path}

Upload File To Quick Note
    [Documentation]    Uploads a file to the Quick Note form using the file chooser dialog.
    [Arguments]    ${file_path}
    Choose File    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${file_path}

Wait Until Image Is Uploaded To Quick Note
    [Documentation]    Waits until the image is uploaded and displayed in the Quick Note form.
    [Arguments]    ${image_path}
    ${image_file_name}=    Evaluate    str(${image_path}).split('/')[-1]
    Wait Until Element Is Visible    xpath=//img[contains(@src, '${image_file_name}')]    ${LONG_WAIT}

Wait Until PDF Is Uploaded To Quick Note
    [Documentation]    Waits until the PDF is uploaded and displayed in the Quick Note form.
    [Arguments]    ${pdf_path}
    ${pdf_file_name}=    Evaluate    str(${pdf_path}).split('/')[-1]
    Wait Until Element Is Visible    xpath=//a[contains(@href, '${pdf_file_name}')]    ${LONG_WAIT}

Wait Until Quick Note Print Dialog Is Visible
    [Documentation]    Waits until the print dialog for the Quick Note is displayed.
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print]    ${LONG_WAIT}

Validate Image Is Displayed In Quick Note
    [Documentation]    Validates that the uploaded image is displayed in the Quick Note form.
    [Arguments]    ${image_path}
    ${image_file_name}=    Evaluate    str(${image_path}).split('/')[-1]
    Wait Until Element Is Visible    xpath=//img[contains(@src, '${image_file_name}')]    ${LONG_WAIT}

Validate PDF Is Displayed In Quick Note
    [Documentation]    Validates that the uploaded PDF is displayed in the Quick Note form.
    [Arguments]    ${pdf_path}
    ${pdf_file_name}=    Evaluate    str(${pdf_path}).split('/')[-1]
    Wait Until Element Is Visible    xpath=//a[contains(@href, '${pdf_file_name}')]    ${LONG_WAIT}
