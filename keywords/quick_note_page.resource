*** Settings ***
Documentation    This resource file contains all keywords for Adding a Quick Note to a Booking.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary booking and then opens the Clinical Sidebar for the selected booking.
    [Arguments]    ${booking_name}    ${clinical_sidebar_name}
    Click Booking In Diary    ${booking_name}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}

Click Booking In Diary
    [Documentation]    Clicks on the booking in the diary using the booking name.
    [Arguments]    ${booking_name}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.select_booking]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dialog.select_booking]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[dialog.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the Forms Library dropdown.
    [Arguments]    ${forms_library_label}    ${quick_note_option}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library]    label    ${quick_note_option}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note.
    [Arguments]    ${image_file}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Upload Image File To Quick Note    ${image_file}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.save_quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.save_quick_note]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save_quick_note]    ${LONG_WAIT}

Upload Image File To Quick Note
    [Documentation]    Uploads the specified image file to the Quick Note.
    [Arguments]    ${image_file}
    Click    ${QUICK_NOTE_LOCATORS}[button.choose_file]
    Press Keys    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${image_file}
    Wait Until    2s

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note.
    [Arguments]    ${quick_note_text}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${LONG_WAIT}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${quick_note_text}
    Wait Until    1s

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${pdf_file}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Press Keys    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]    ${pdf_file}
    Wait Until    2s

Print Quick Note
    [Documentation]    Prints the Quick Note with the image, text, and PDF added.
    [Arguments]    ${print_button_label}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print_quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.print]    ${LONG_WAIT}

Validate Quick Note Is Auto Completed And Printed
    [Documentation]    Validates that the Quick Note is auto completed and printout is rendered with image, text, and PDF.
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${LONG_WAIT}
    ${actual_text}=    Get Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]
    Should Contain    ${actual_text}    Test@123
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print]    ${LONG_WAIT}

Enter Quick Note Data
    [Documentation]    Enters Quick Note fields dynamically using dictionary keys.
    [Arguments]    ${select_by}=label    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    ${select_by}    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END
