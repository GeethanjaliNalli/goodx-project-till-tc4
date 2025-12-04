*** Settings ***
Documentation    This resource file contains all keywords for Quick Note actions in the Diary module, including adding, saving, and printing quick notes with attachments.
Resource    ../common/super.resource
Resource    ../object_repository/quicknote_page_locators.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary and then opens the Clinical sidebar for the selected booking.
    Click    ${QUICKNOTE_PAGE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICKNOTE_PAGE_LOCATORS}[button.clinical]    ${SHORT_WAIT}
    Click    ${QUICKNOTE_PAGE_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${QUICKNOTE_PAGE_LOCATORS}[button.forms_library_dropdown]    ${SHORT_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${form_name}
    Click    ${QUICKNOTE_PAGE_LOCATORS}[button.forms_library_dropdown]
    Wait Until Element Is Visible    ${QUICKNOTE_PAGE_LOCATORS}[option.quick_note]    ${SHORT_WAIT}
    Click    ${QUICKNOTE_PAGE_LOCATORS}[option.quick_note]
    Wait Until Element Is Visible    ${QUICKNOTE_PAGE_LOCATORS}[textarea.quicknote_text]    ${SHORT_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image attachment to the Quick Note.
    [Arguments]    ${image_file_path}
    Click    ${QUICKNOTE_PAGE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICKNOTE_PAGE_LOCATORS}[button.upload_image]    ${SHORT_WAIT}
    Click    ${QUICKNOTE_PAGE_LOCATORS}[button.upload_image]
    Wait Until Element Is Visible    ${QUICKNOTE_PAGE_LOCATORS}[input.upload_image_file]    ${SHORT_WAIT}
    Upload File To Quick Note Image Input    ${image_file_path}
    Wait Until Image Is Uploaded To Quick Note    ${SHORT_WAIT}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note text area.
    [Arguments]    ${note_text}
    Fill Text    ${QUICKNOTE_PAGE_LOCATORS}[textarea.quicknote_text]    ${note_text}
    Click    ${QUICKNOTE_PAGE_LOCATORS}[button.save_quicknote]
    Wait Until Quick Note Is Saved    ${LONG_WAIT}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${pdf_file_path}
    Click    ${QUICKNOTE_PAGE_LOCATORS}[button.add_pdf]
    Wait Until Element Is Visible    ${QUICKNOTE_PAGE_LOCATORS}[button.upload_pdf]    ${SHORT_WAIT}
    Click    ${QUICKNOTE_PAGE_LOCATORS}[button.upload_pdf]
    Wait Until Element Is Visible    ${QUICKNOTE_PAGE_LOCATORS}[input.upload_pdf_file]    ${SHORT_WAIT}
    Upload File To Quick Note PDF Input    ${pdf_file_path}
    Wait Until PDF Is Uploaded To Quick Note    ${SHORT_WAIT}

Print Quick Note
    [Documentation]    Prints the saved Quick Note with all attachments.
    Click    ${QUICKNOTE_PAGE_LOCATORS}[button.print_quicknote]
    Wait Until Quick Note Is Printed    ${LONG_WAIT}

Upload File To Quick Note Image Input
    [Documentation]    Uploads an image file to the Quick Note image input field.
    [Arguments]    ${file_path}
    Press Keys    ${QUICKNOTE_PAGE_LOCATORS}[input.upload_image_file]    ${file_path}

Upload File To Quick Note PDF Input
    [Documentation]    Uploads a PDF file to the Quick Note PDF input field.
    [Arguments]    ${file_path}
    Press Keys    ${QUICKNOTE_PAGE_LOCATORS}[input.upload_pdf_file]    ${file_path}

Wait Until Image Is Uploaded To Quick Note
    [Documentation]    Waits until the image upload to Quick Note is complete.
    [Arguments]    ${timeout}
    Wait Until Element Is Invisible    ${QUICKNOTE_PAGE_LOCATORS}[input.upload_image_file]    timeout=${timeout}

Wait Until PDF Is Uploaded To Quick Note
    [Documentation]    Waits until the PDF upload to Quick Note is complete.
    [Arguments]    ${timeout}
    Wait Until Element Is Invisible    ${QUICKNOTE_PAGE_LOCATORS}[input.upload_pdf_file]    timeout=${timeout}

Wait Until Quick Note Is Saved
    [Documentation]    Waits until the Quick Note save operation is complete.
    [Arguments]    ${timeout}
    Wait Until Element Is Invisible    ${QUICKNOTE_PAGE_LOCATORS}[button.save_quicknote]    timeout=${timeout}

Wait Until Quick Note Is Printed
    [Documentation]    Waits until the Quick Note print operation is complete.
    [Arguments]    ${timeout}
    Wait Until Element Is Invisible    ${QUICKNOTE_PAGE_LOCATORS}[button.print_quicknote]    timeout=${timeout}
