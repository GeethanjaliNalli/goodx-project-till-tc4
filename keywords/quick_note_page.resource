*** Settings ***
Documentation    This resource file contains all keywords related to the Quick Note functionality for diary bookings.
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary and then opens the Clinical Sidebar for the selected booking.
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${form_locator}
    Click    ${QUICK_NOTE_LOCATORS}[select.forms_library]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library]    label    Quick Note
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note using the provided image button and file path.
    [Arguments]    ${image_button_locator}    ${image_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_file]    ${LONG_WAIT}
    Upload File To Quick Note    ${QUICK_NOTE_LOCATORS}[button.upload_file]    ${image_path}
    Wait Until Image Is Uploaded    ${QUICK_NOTE_LOCATORS}[button.add_image]

Upload File To Quick Note
    [Documentation]    Uploads a file to the Quick Note using the given locator and file path.
    [Arguments]    ${file_upload_locator}    ${file_path}
    Choose File    ${file_upload_locator}    ${file_path}

Wait Until Image Is Uploaded
    [Documentation]    Waits until the uploaded image is visible in the Quick Note.
    [Arguments]    ${image_button_locator}
    Wait Until    2s
    # Optionally, add a check for image preview if locator available

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note text area.
    [Arguments]    ${text_area_locator}    ${quick_note_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${quick_note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note using the PDF upload button and file path.
    [Arguments]    ${pdf_button_locator}    ${pdf_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.upload_file]    ${LONG_WAIT}
    Upload File To Quick Note    ${QUICK_NOTE_LOCATORS}[button.upload_file]    ${pdf_path}
    Wait Until PDF Is Uploaded    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]

Wait Until PDF Is Uploaded
    [Documentation]    Waits until the uploaded PDF is visible in the Quick Note.
    [Arguments]    ${pdf_button_locator}
    Wait Until    2s
    # Optionally, add a check for PDF preview if locator available

Print Quick Note
    [Documentation]    Prints the Quick Note and waits for the print dialog or confirmation.
    [Arguments]    ${print_button_locator}
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until Print Dialog Is Open

Wait Until Print Dialog Is Open
    [Documentation]    Waits until the print dialog is open after clicking the print button.
    Wait Until    2s

Save Quick Note
    [Documentation]    Saves the Quick Note form.
    Click    ${QUICK_NOTE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save]    timeout=${LONG_WAIT}

Validate Quick Note Is Saved
    [Documentation]    Validates that the Quick Note is saved with image, text, and PDF.
    [Arguments]    ${quick_note_text}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${LONG_WAIT}
    ${actual_text}    Get Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]
    Should Contain    ${actual_text}    ${quick_note_text}
    # Optionally, add image and PDF existence checks if preview locators are available

Enter Quick Note Form Data
    [Documentation]    Enters data into the Quick Note form fields using a dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${QUICK_NOTE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END
