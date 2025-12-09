*** Settings ***
Documentation    This resource file contains all the keywords for Quick Note functionality on Booking/Diary page.
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module and opens the Clinical Sidebar for a booking timeslot.
    [Arguments]    ${diary_module}    ${booking_time}
    Select Menu In Navigation Wheel    ${diary_module}
    Select Timeslot    ${booking_time}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form in the clinical sidebar.
    [Arguments]    ${quick_note_form}
    Click    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library_dropdown]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library_dropdown]    label    ${quick_note_form}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[option.quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the quick note using the upload button and file path.
    [Arguments]    ${image_upload_button}    ${image_path}
    Click    ${image_upload_button}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Upload File To Quick Note    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${image_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_picture]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_picture]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}

Add Text To Quick Note
    [Documentation]    Adds text to the quick note text field.
    [Arguments]    ${quick_note_text_field}    ${quick_note_text}
    Fill Text    ${quick_note_text_field}    ${quick_note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the quick note.
    [Arguments]    ${pdf_upload_button}    ${pdf_path}
    Click    ${pdf_upload_button}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Upload File To Quick Note    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${pdf_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_pdf]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_pdf]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the quick note using the print button.
    [Arguments]    ${print_button}
    Click    ${print_button}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_action]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print_action]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.print_action]    ${LONG_WAIT}

Validate Quick Note Is Added
    [Documentation]    Validates that the quick note is added with image, text, and PDF.
    [Arguments]    ${validation_section}    ${expected_text}    ${expected_image_path}    ${expected_pdf_path}
    Wait Until Element Is Visible    ${validation_section}    ${LONG_WAIT}
    ${actual_text}=    Get Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]
    Should Contain    ${actual_text}    ${expected_text}
    Validate Quick Note Image Is Present    ${expected_image_path}
    Validate Quick Note PDF Is Present    ${expected_pdf_path}

Upload File To Quick Note
    [Documentation]    Uploads a file to the quick note using the provided file input locator.
    [Arguments]    ${file_input_locator}    ${file_path}
    Press Keys    ${file_input_locator}    ${file_path}

Validate Quick Note Image Is Present
    [Documentation]    Validates that the uploaded image is present in the quick note.
    [Arguments]    ${expected_image_path}
    ${image_file_name}=    Evaluate Expression    ${expected_image_path}.split('/')[-1]
    ${image_locator}=    Set Variable    //img[contains(@src, '${image_file_name}')]
    Wait Until Element Is Visible    ${image_locator}    ${LONG_WAIT}

Validate Quick Note PDF Is Present
    [Documentation]    Validates that the uploaded PDF is present in the quick note.
    [Arguments]    ${expected_pdf_path}
    ${pdf_file_name}=    Evaluate Expression    ${expected_pdf_path}.split('/')[-1]
    ${pdf_locator}=    Set Variable    //a[contains(@href, '${pdf_file_name}')]
    Wait Until Element Is Visible    ${pdf_locator}    ${LONG_WAIT}
