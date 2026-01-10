*** Settings ***
Documentation    This resource file contains all keywords related to Quick Note functionality for the Diary/Booking workflow.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module, selects the booking by time, and opens the Clinical Sidebar for the booking.
    [Arguments]    ${diary_module}    ${booking_time}
    Select Menu In Navigation Wheel    ${diary_module}
    Select Timeslot    ${booking_time}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown in the Clinical Sidebar.
    [Arguments]    ${select_by}=label
    Click    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library_dropdown]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library_dropdown]    ${select_by}    Quick Note
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[option.quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.quick_note_select]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.quick_note_select]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.quick_note_textbox]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note by uploading the specified file path.
    [Arguments]    ${image_file_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Upload File To Quick Note Image    ${image_file_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_picture]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_picture]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.select_picture]    ${LONG_WAIT}

Upload File To Quick Note Image
    [Documentation]    Uploads an image file to the Quick Note image file input.
    [Arguments]    ${file_path}
    Press Keys    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${file_path}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note textbox.
    [Arguments]    ${quick_note_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${quick_note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${pdf_file_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Upload File To Quick Note PDF    ${pdf_file_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_pdf]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_pdf]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.select_pdf]    ${LONG_WAIT}

Upload File To Quick Note PDF
    [Documentation]    Uploads a PDF file to the Quick Note PDF file input.
    [Arguments]    ${file_path}
    Press Keys    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${file_path}

Print Quick Note
    [Documentation]    Prints the Quick Note and waits for the print dialog to appear.
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_dialog]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print_dialog]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.print_dialog]    ${LONG_WAIT}

Save Quick Note
    [Documentation]    Saves the Quick Note form.
    Click    ${QUICK_NOTE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save]    ${LONG_WAIT}

Save Quick Note Dialog
    [Documentation]    Saves the Quick Note dialog.
    Click    ${QUICK_NOTE_LOCATORS}[button.save_dialog]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save_dialog]    ${LONG_WAIT}
