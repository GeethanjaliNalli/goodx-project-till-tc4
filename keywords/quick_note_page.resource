*** Settings ***
Documentation    This resource file contains all keywords related to the Quick Note functionality (Adding a quick note to a booking).
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary and then opens the Clinical Sidebar for the selected booking.
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown in the Clinical Sidebar.
    [Arguments]    ${select_by}=label
    Click    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${select_by}    Quick Note
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[option.quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note by clicking the add image button and uploading a file.
    [Arguments]    ${add_image_button_locator}    ${image_upload_input_locator}
    Click    ${add_image_button_locator}
    Wait Until Element Is Visible    ${image_upload_input_locator}    ${LONG_WAIT}
    Upload Image File    ${image_upload_input_locator}
    Wait Until Element Is Invisible    ${image_upload_input_locator}    ${LONG_WAIT}

Add Quick Note Text
    [Documentation]    Adds text to the Quick Note textbox.
    [Arguments]    ${text_area_locator}    ${note_text}
    Fill Text    ${text_area_locator}    ${note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF to the Quick Note by clicking the add PDF button and uploading a file.
    [Arguments]    ${add_pdf_button_locator}    ${pdf_upload_input_locator}
    Click    ${add_pdf_button_locator}
    Wait Until Element Is Visible    ${pdf_upload_input_locator}    ${LONG_WAIT}
    Upload PDF File    ${pdf_upload_input_locator}
    Wait Until Element Is Invisible    ${pdf_upload_input_locator}    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note by clicking the Print button.
    [Arguments]    ${print_button_locator}
    Click    ${print_button_locator}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_binding]    ${LONG_WAIT}

Upload Image File
    [Documentation]    Uploads an image file using the provided file input locator.
    [Arguments]    ${file_input_locator}
    # This assumes the test environment sets ${IMAGE_FILE_PATH} to a valid image path
    Press Keys    ${file_input_locator}    ${IMAGE_FILE_PATH}

Upload PDF File
    [Documentation]    Uploads a PDF file using the provided file input locator.
    [Arguments]    ${file_input_locator}
    # This assumes the test environment sets ${PDF_FILE_PATH} to a valid PDF path
    Press Keys    ${file_input_locator}    ${PDF_FILE_PATH}

Enter Quick Note Data
    [Documentation]    Enters data into the Quick Note form fields using the provided dictionary.
    [Arguments]    ${select_by}=label    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    ${select_by}    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END
