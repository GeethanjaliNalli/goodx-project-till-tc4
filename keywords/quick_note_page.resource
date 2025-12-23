*** Settings ***
Documentation    This resource file contains all keywords for Quick Note functionality (Adding a quicknote to a booking).
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module and opens the Clinical Sidebar for the specified booking timeslot.
    [Arguments]    ${diary_module}    ${booking_time}
    Select Menu In Navigation Wheel    ${diary_module}
    Select Timeslot    ${booking_time}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dialog.select_booking]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[dialog.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_event]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_event]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown in the clinical sidebar.
    [Arguments]    ${select_by}=label
    Click    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${select_by}    Quick Note
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[option.quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note by uploading the specified image file.
    [Arguments]    ${image_upload_field}    ${image_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Upload File To Quick Note Image    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${image_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.save_dialog]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.save_dialog]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save_dialog]    ${LONG_WAIT}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note text area.
    [Arguments]    ${text_area_field}    ${quicknote_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quicknote_text]    ${quicknote_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${pdf_upload_field}    ${pdf_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_pdf_file]    ${LONG_WAIT}
    Upload File To Quick Note PDF    ${QUICK_NOTE_LOCATORS}[button.upload_pdf_file]    ${pdf_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.save_dialog]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.save_dialog]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save_dialog]    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note and waits for the print dialog.
    [Arguments]    ${print_button_field}
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_dialog]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print_dialog]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.print_dialog]    ${LONG_WAIT}

Upload File To Quick Note Image
    [Documentation]    Uploads an image file to the Quick Note image upload field.
    [Arguments]    ${choose_file_locator}    ${file_path}
    Choose File    ${choose_file_locator}    ${file_path}

Upload File To Quick Note PDF
    [Documentation]    Uploads a PDF file to the Quick Note PDF upload field.
    [Arguments]    ${choose_file_locator}    ${file_path}
    Choose File    ${choose_file_locator}    ${file_path}
