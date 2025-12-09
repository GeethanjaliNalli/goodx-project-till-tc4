*** Settings ***
Documentation    This resource file contains all keywords for Adding a Quick Note to a booking (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary and then opens the Clinical sidebar for the selected booking.
    Click    ${button.select_booking}
    Wait Until Element Is Visible    ${button.clinical}    ${LONG_WAIT}
    Click    ${button.clinical}
    Wait Until Element Is Visible    ${select.forms_library}    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${form_locator}
    Wait Until Element Is Visible    ${select.forms_library}    ${LONG_WAIT}
    Select Options By    ${select.forms_library}    label    QUICK NOTE
    Wait Until Element Is Visible    ${button.add_image}    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note by uploading the specified file.
    [Arguments]    ${image_upload_locator}    ${image_path}
    Click    ${button.add_image}
    Wait Until Element Is Visible    ${button.upload_from_file}    ${LONG_WAIT}
    Click    ${button.upload_from_file}
    Wait Until Element Is Visible    ${button.choose_file}    ${LONG_WAIT}
    Upload File To Quick Note Image    ${button.choose_file}    ${image_path}
    Wait Until Element Is Visible    ${button.save_quick_note}    ${LONG_WAIT}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note text input field.
    [Arguments]    ${text_field_locator}    ${quick_note_text}
    Wait Until Element Is Visible    ${input.quick_note_text}    ${LONG_WAIT}
    Fill Text    ${input.quick_note_text}    ${quick_note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${pdf_upload_locator}    ${pdf_path}
    Click    ${button.upload_pdf}
    Wait Until Element Is Visible    ${button.choose_file}    ${LONG_WAIT}
    Upload File To Quick Note PDF    ${button.choose_file}    ${pdf_path}
    Wait Until Element Is Visible    ${button.save_quick_note}    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note after adding image, text, and PDF.
    [Arguments]    ${print_button_locator}
    Click    ${button.save_quick_note}
    Wait Until Element Is Invisible    ${button.save_quick_note}    ${LONG_WAIT}
    Wait Until Element Is Visible    ${button.print_quick_note}    ${LONG_WAIT}
    Click    ${button.print_quick_note}
    Wait Until    2s

Upload File To Quick Note Image
    [Documentation]    Uploads an image file to the Quick Note image upload input.
    [Arguments]    ${file_input_locator}    ${file_path}
    Choose File    ${file_input_locator}    ${file_path}

Upload File To Quick Note PDF
    [Documentation]    Uploads a PDF file to the Quick Note PDF upload input.
    [Arguments]    ${file_input_locator}    ${file_path}
    Choose File    ${file_input_locator}    ${file_path}
