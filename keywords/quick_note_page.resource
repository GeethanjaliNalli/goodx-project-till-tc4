*** Settings ***
Documentation    This resource file contains all keywords for Quick Note functionality in Booking/Diary, including adding quick notes, uploading images and PDFs, and printing.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module and opens the clinical sidebar for a booking at the specified time.
    [Arguments]    ${diary_module}    ${booking_time}
    Select Menu In Navigation Wheel    ${diary_module}
    Select Timeslot    ${booking_time}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${form_name}
    Click    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${SHORT_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]    label    ${form_name}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_image]    ${SHORT_WAIT}

Add Image To Quick Note
    [Documentation]    Uploads an image to the Quick Note form using the provided image path.
    [Arguments]    ${image_button_locator}    ${image_path}
    Click    ${image_button_locator}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${SHORT_WAIT}
    Upload File To Quick Note Image    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${image_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_picture]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_picture]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.select_picture]    ${SHORT_WAIT}

Add Text To Quick Note
    [Documentation]    Adds the specified text to the Quick Note text field.
    [Arguments]    ${text_field_locator}    ${text}
    Fill Text    ${text_field_locator}    ${text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note form using the provided PDF path.
    [Arguments]    ${pdf_button_locator}    ${pdf_path}
    Click    ${pdf_button_locator}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_pdf_file]    ${SHORT_WAIT}
    Upload File To Quick Note PDF    ${QUICK_NOTE_LOCATORS}[button.upload_pdf_file]    ${pdf_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_pdf]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_pdf]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.select_pdf]    ${SHORT_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note by clicking the print button and waits for the print action to complete.
    [Arguments]    ${print_button_locator}
    Click    ${print_button_locator}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_action]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print_action]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.print_action]    ${LONG_WAIT}

Upload File To Quick Note Image
    [Documentation]    Uploads an image file to the Quick Note image upload field.
    [Arguments]    ${choose_file_locator}    ${file_path}
    Upload File    ${choose_file_locator}    ${file_path}

Upload File To Quick Note PDF
    [Documentation]    Uploads a PDF file to the Quick Note PDF upload field.
    [Arguments]    ${choose_file_locator}    ${file_path}
    Upload File    ${choose_file_locator}    ${file_path}
