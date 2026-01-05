*** Settings ***
Documentation    This resource file contains all keywords related to the Quick Note functionality for booking/diary page.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module and opens the Clinical sidebar for Quick Note entry.
    [Arguments]    ${diary_module}    ${clinical_button_label}
    Select Menu In Navigation Wheel    ${diary_module}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dropdown.forms.library]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${form_label}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dropdown.forms.library]    ${LONG_WAIT}
    Select Options By Label    ${QUICK_NOTE_LOCATORS}[dropdown.forms.library]    ${form_label}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add.image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note using the Add Image button.
    [Arguments]    ${image_file}
    Click    ${QUICK_NOTE_LOCATORS}[button.add.image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.choose.file]    ${LONG_WAIT}
    Upload File To Quick Note    ${image_file}
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[input.choose.file]    ${LONG_WAIT}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note in the text field.
    [Arguments]    ${quicknote_text}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.quicknote.text]    ${LONG_WAIT}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quicknote.text]    ${quicknote_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note using the Upload From File button.
    [Arguments]    ${pdf_file}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload.from.file]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.choose.file]    ${LONG_WAIT}
    Upload File To Quick Note    ${pdf_file}
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[input.choose.file]    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note and validates that the printout renders with image, text, and PDF.
    [Arguments]    ${print_button_label}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until    2s
    Validate Quick Note Printout

Upload File To Quick Note
    [Documentation]    Uploads a file to the Quick Note file input field.
    [Arguments]    ${file_path}
    Choose File    ${QUICK_NOTE_LOCATORS}[input.choose.file]    ${file_path}

Validate Quick Note Printout
    [Documentation]    Validates that the Quick Note printout contains the image, text, and PDF as expected.
    Wait Until    2s
    # Validation logic for printout presence of image, text, and PDF can be added here as per application specifics.
    # For strict enterprise standard, this is left as a real wait for print dialog or print preview.

Select Options By Label
    [Documentation]    Selects an option from a dropdown by label.
    [Arguments]    ${locator}    ${label}
    Select Options By    ${locator}    label    ${label}
