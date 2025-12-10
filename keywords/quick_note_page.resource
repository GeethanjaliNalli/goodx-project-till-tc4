*** Settings ***
Documentation    This resource file contains all keywords for Quick Note functionality in the Diary/Booking module.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource
Resource    ../Testdata/quick_note_data.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module and opens the Clinical Sidebar for the selected booking.
    [Arguments]    ${diary_module}    ${clinical_sidebar_key}
    Select Menu In Navigation Wheel    ${diary_module}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_booking]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dialog.select_booking]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[dialog.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${forms_library_dropdown_key}    ${quick_note_option_key}
    Click    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]    ${SHORT_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]    label    Quick Note
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[option.quick_note]
    Wait Until    1s

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note by clicking add image and uploading a file.
    [Arguments]    ${add_image_button_key}    ${image_upload_input_key}    ${image_thumbnail_key}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.choose_file]
    # File upload handled by Playwright context, assume file dialog is handled externally
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_picture]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_picture]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.save_action]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.save_action]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save_action]    ${LONG_WAIT}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note using provided test data.
    [Arguments]    ${quick_note_text_input_key}    ${quick_note_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${quick_note_text}
    Wait Until    1s

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF to the Quick Note.
    [Arguments]    ${add_pdf_button_key}    ${pdf_upload_input_key}    ${pdf_file_row_key}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.choose_file]
    # File upload handled by Playwright context, assume file dialog is handled externally
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_pdf]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_pdf]
    Wait Until    1s

Print Quick Note
    [Documentation]    Prints the current Quick Note.
    [Arguments]    ${print_button_key}
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_action]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print_action]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.print_action]    ${LONG_WAIT}

Enter Quick Note Data
    [Documentation]    Enters Quick Note form fields dynamically using dictionary keys.
    [Arguments]    ${select_by}=label    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    ${select_by}    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Save Quick Note
    [Documentation]    Saves the Quick Note form.
    Click    ${QUICK_NOTE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save]    ${LONG_WAIT}
