*** Settings ***
Documentation    This resource file contains all keywords related to Quick Note functionality in the Clinical/Booking workflow.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource
Resource    ../Testdata/quick_note_data.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary and then opens the Clinical Sidebar for the selected booking.
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dialog.select_booking]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${forms_library_locator}
    Click    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library]    label    Quick Note
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[option.quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note using the image upload button and file input.
    [Arguments]    ${image_upload_button_locator}    ${image_file_input_locator}    ${image_preview_locator}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.choose_file]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Wait Until Element Is Visible    ${image_file_input_locator}    ${LONG_WAIT}
    # File upload is handled by PlaywrightLibrary's file chooser, assumed to be handled outside if needed
    Wait Until Element Is Visible    ${image_preview_locator}    ${LONG_WAIT}

Add Quick Note Text
    [Documentation]    Adds text to the Quick Note text area.
    [Arguments]    ${text_area_locator}    ${quick_note_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${quick_note_text}
    Wait Until    1s

Add Quick Note Description
    [Documentation]    Adds description to the Quick Note description field.
    [Arguments]    ${description_locator}    ${quick_note_description}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_description]    ${quick_note_description}
    Wait Until    1s

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note using the PDF upload button and file input.
    [Arguments]    ${pdf_upload_button_locator}    ${pdf_file_input_locator}    ${pdf_preview_locator}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Wait Until Element Is Visible    ${pdf_file_input_locator}    ${LONG_WAIT}
    # File upload is handled by PlaywrightLibrary's file chooser, assumed to be handled outside if needed
    Wait Until Element Is Visible    ${pdf_preview_locator}    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note using the print button.
    [Arguments]    ${print_button_locator}
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_event]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print_event]
    Wait Until    2s

Save Quick Note
    [Documentation]    Saves the Quick Note in the Patient's Clinical record.
    Click    ${QUICK_NOTE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save]    ${LONG_WAIT}

Enter Quick Note Data
    [Documentation]    Enters Quick Note form fields dynamically using dictionary keys.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Validate Quick Note Is Saved In Clinical Record
    [Documentation]    Validates that the Quick Note is saved in the Patient's Clinical record.
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${LONG_WAIT}
    ${actual_text}    Get Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]
    Should Contain    ${actual_text}    ${expected_text}

# High-level orchestration for test case TC00005_Diary_Add Quicknote
Add Quicknote To Booking
    [Documentation]    Adds a quick note to a booking and validates it is saved in the Patient's Clinical record.
    Open Diary And Open Clinical Sidebar
    Select Quick Note Form    ${QUICK_NOTE_LOCATORS}[select.forms_library]
    Add Image To Quick Note    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${QUICK_NOTE_LOCATORS}[button.select_picture]
    Add Quick Note Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${QUICK_NOTE_DATA}[input.quick_note_text]
    Add Quick Note Description    ${QUICK_NOTE_LOCATORS}[input.quick_note_description]    ${QUICK_NOTE_DATA}[input.quick_note_description]
    Upload PDF To Quick Note    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]    ${QUICK_NOTE_LOCATORS}[button.select_pdf]    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Print Quick Note    ${QUICK_NOTE_LOCATORS}[button.print]
    Save Quick Note
    Validate Quick Note Is Saved In Clinical Record    ${QUICK_NOTE_DATA}[input.quick_note_text]
