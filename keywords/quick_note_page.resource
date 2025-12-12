*** Settings ***
Documentation    This resource file contains all keywords for Adding a Quick Note to a booking in the diary module.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary booking and then opens the Clinical Sidebar for the selected booking.
    [Arguments]    ${select_booking_button_key}    ${clinical_sidebar_button_key}
    ${select_booking_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    button.select_booking
    ${clinical_sidebar_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    button.clinical_sidebar
    Click    ${select_booking_locator}
    Wait Until Element Is Visible    ${clinical_sidebar_locator}    ${LONG_WAIT}
    Click    ${clinical_sidebar_locator}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library_dropdown]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the Forms Library dropdown in the Clinical Sidebar.
    [Arguments]    ${forms_library_dropdown_key}    ${quick_note_option_key}
    ${dropdown_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    select.forms_library_dropdown
    ${option_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    option.quick_note
    Wait Until Element Is Visible    ${dropdown_locator}    ${LONG_WAIT}
    Select Options By    ${dropdown_locator}    label    QUICK NOTE
    Wait Until Element Is Visible    ${option_locator}    ${LONG_WAIT}
    Click    ${option_locator}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note using the Add Image button and uploads from file.
    ${add_image_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    button.add_image
    ${upload_from_file_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    button.upload_from_file
    Click    ${add_image_locator}
    Wait Until Element Is Visible    ${upload_from_file_locator}    ${LONG_WAIT}
    Click    ${upload_from_file_locator}
    Wait Until Element Is Invisible    ${upload_from_file_locator}    ${LONG_WAIT}

Add Quick Note Text
    [Documentation]    Adds text to the Quick Note textbox.
    [Arguments]    ${quick_note_text}
    ${textbox_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    input.quick_note_text
    Wait Until Element Is Visible    ${textbox_locator}    ${LONG_WAIT}
    Fill Text    ${textbox_locator}    ${quick_note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note using the Upload PDF button.
    ${upload_pdf_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    button.upload_pdf
    Click    ${upload_pdf_locator}
    Wait Until Element Is Invisible    ${upload_pdf_locator}    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note using the Print button.
    ${print_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    button.print
    Click    ${print_locator}
    ${print_dialog_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    button.print_dialog
    Wait Until Element Is Visible    ${print_dialog_locator}    ${LONG_WAIT}
    Click    ${print_dialog_locator}
    Wait Until Element Is Invisible    ${print_dialog_locator}    ${LONG_WAIT}

Validate Quick Note Is Added And Displayed
    [Documentation]    Validates that the Quick Note is added and displayed correctly with the provided text.
    [Arguments]    ${expected_quick_note_text}
    ${textbox_locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    input.quick_note_text
    Wait Until Element Is Visible    ${textbox_locator}    ${LONG_WAIT}
    ${actual_text}    Get Text    ${textbox_locator}
    Should Contain    ${actual_text}    ${expected_quick_note_text}
