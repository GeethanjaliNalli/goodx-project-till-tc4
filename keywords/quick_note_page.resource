*** Settings ***
Documentation    This resource file contains all keywords for Quick Note functionality (Add Quicknote to Booking).
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary and opens the clinical sidebar for a booking.
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${form_name}
    Click    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library_input]    ${LONG_WAIT}
    Fill Text    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library_input]    ${form_name}
    Press Keys    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library_input]    Enter
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image as an attachment to the quick note.
    [Arguments]    ${image_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.upload_file]    ${LONG_WAIT}
    Upload File To Quick Note    ${image_path}
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[input.upload_file]    ${MEDIUM_WAIT}

Add Text To Quick Note
    [Documentation]    Adds text to the quick note.
    [Arguments]    ${note_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[textbox.quicknote_reason]    ${note_text}
    Click    ${QUICK_NOTE_LOCATORS}[button.save_quicknote]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save_quicknote]    ${LONG_WAIT}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF attachment to the quick note.
    [Arguments]    ${pdf_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.upload_pdf]    ${LONG_WAIT}
    Upload File To Quick Note PDF    ${pdf_path}
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[input.upload_pdf]    ${MEDIUM_WAIT}

Print Quick Note
    [Documentation]    Prints the quick note and waits for print dialog to appear.
    Click    ${QUICK_NOTE_LOCATORS}[button.print_quicknote]
    Wait Until    2s

Upload File To Quick Note
    [Documentation]    Uploads a file to the quick note image upload input.
    [Arguments]    ${file_path}
    Set File Input Files    ${QUICK_NOTE_LOCATORS}[input.upload_file]    ${file_path}

Upload File To Quick Note PDF
    [Documentation]    Uploads a PDF file to the quick note PDF upload input.
    [Arguments]    ${file_path}
    Set File Input Files    ${QUICK_NOTE_LOCATORS}[input.upload_pdf]    ${file_path}
