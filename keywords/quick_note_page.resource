*** Settings ***
Documentation    This resource file contains all keywords for Quick Note functionality (adding, uploading, saving, printing) on a booking.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary booking and then opens the Clinical Sidebar for the selected booking.
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown in the Clinical Sidebar.
    [Arguments]    ${select_by}=label
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${select_by}    QUICK NOTE
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note by uploading the specified image file.
    [Arguments]    ${image_upload_field}    ${image_file_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${LONG_WAIT}
    Upload File To Quick Note Image    ${image_file_path}
    Wait Until Image Is Uploaded To Quick Note    ${image_file_path}

Add Quick Note Text
    [Documentation]    Adds text to the Quick Note.
    [Arguments]    ${text_field}    ${note_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${pdf_upload_field}    ${pdf_file_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${LONG_WAIT}
    Upload File To Quick Note PDF    ${pdf_file_path}
    Wait Until PDF Is Uploaded To Quick Note    ${pdf_file_path}

Print Quick Note
    [Documentation]    Prints the Quick Note using the print button.
    [Arguments]    ${print_button}
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_dialog]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print_dialog]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.print_dialog]    ${LONG_WAIT}

Upload File To Quick Note Image
    [Documentation]    Uploads an image file to the Quick Note using the upload from file button.
    [Arguments]    ${file_path}
    Choose File    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${file_path}

Upload File To Quick Note PDF
    [Documentation]    Uploads a PDF file to the Quick Note using the upload from file button.
    [Arguments]    ${file_path}
    Choose File    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${file_path}

Wait Until Image Is Uploaded To Quick Note
    [Documentation]    Waits until the uploaded image is visible in the Quick Note.
    [Arguments]    ${file_path}
    ${image_name}    Evaluate Expression    ${file_path}.split('/')[-1]
    Wait Until Element Is Visible    xpath=//img[contains(@src, '${image_name}')]    ${LONG_WAIT}

Wait Until PDF Is Uploaded To Quick Note
    [Documentation]    Waits until the uploaded PDF is visible in the Quick Note.
    [Arguments]    ${file_path}
    ${pdf_name}    Evaluate Expression    ${file_path}.split('/')[-1]
    Wait Until Element Is Visible    xpath=//a[contains(@href, '${pdf_name}')]    ${LONG_WAIT}
