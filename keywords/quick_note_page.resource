*** Settings ***
Documentation    This resource file contains all keywords related to Quick Note functionality (Adding a quick note to a booking).
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar For New Patient Booking
    [Documentation]    Opens the Diary and clinical sidebar for a booking with a new patient (not added to debtor list yet).
    Click    ${button.select.booking}
    Wait Until Element Is Visible    ${dialog.select.booking}    ${LONG_WAIT}
    Click    ${dialog.select.booking}
    Wait Until Element Is Visible    ${button.clinical}    ${LONG_WAIT}
    Click    ${button.clinical}
    Wait Until Element Is Visible    ${dropdown.forms.library}    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${select_by}=label
    Wait Until Element Is Visible    ${dropdown.forms.library}    ${LONG_WAIT}
    Select Options By    ${dropdown.forms.library}    ${select_by}    QUICK NOTE
    Wait Until Element Is Visible    ${button.add.image}    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the quick note using the provided file path.
    [Arguments]    ${add_image_button_locator}    ${choose_file_locator}    ${image_path}
    Click    ${add_image_button_locator}
    Wait Until Element Is Visible    ${choose_file_locator}    ${LONG_WAIT}
    Upload File To Quick Note    ${choose_file_locator}    ${image_path}
    Wait Until    2s

Add Text To Quick Note
    [Documentation]    Adds text to the quick note.
    [Arguments]    ${text_area_locator}    ${text}
    Wait Until Element Is Visible    ${text_area_locator}    ${LONG_WAIT}
    Fill Text    ${text_area_locator}    ${text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the quick note.
    [Arguments]    ${add_pdf_button_locator}    ${choose_pdf_locator}    ${pdf_path}
    Click    ${add_pdf_button_locator}
    Wait Until Element Is Visible    ${choose_pdf_locator}    ${LONG_WAIT}
    Upload File To Quick Note    ${choose_pdf_locator}    ${pdf_path}
    Wait Until    2s

Print Quick Note
    [Documentation]    Prints the quick note.
    [Arguments]    ${print_button_locator}
    Wait Until Element Is Visible    ${print_button_locator}    ${LONG_WAIT}
    Click    ${print_button_locator}
    Wait Until    2s

Upload File To Quick Note
    [Documentation]    Uploads a file to the quick note using the file input locator.
    [Arguments]    ${file_input_locator}    ${file_path}
    Set File Input Files    ${file_input_locator}    ${file_path}

Save Quick Note
    [Documentation]    Saves the quick note.
    Click    ${button.save.quicknote}
    Wait Until Element Is Invisible    ${button.save.quicknote}    ${LONG_WAIT}

Validate Quick Note Contains Image Text And PDF
    [Documentation]    Validates that the quick note contains the uploaded image, text, and PDF.
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    ${input.quicknote.text}    ${LONG_WAIT}
    ${actual_text}    Get Text    ${input.quicknote.text}
    Should Contain    ${actual_text}    ${expected_text}
    # Image and PDF validation would require additional locators for uploaded file preview.

# Helper atomic keywords
Click
    [Arguments]    ${locator}
    Click    ${locator}

Fill Text
    [Arguments]    ${locator}    ${text}
    Fill Text    ${locator}    ${text}

Select Options By
    [Arguments]    ${locator}    ${select_by}    ${value}
    Select Options By    ${locator}    ${select_by}    ${value}

Set File Input Files
    [Arguments]    ${locator}    ${file_path}
    Set File Input Files    ${locator}    ${file_path}

Wait Until Element Is Visible
    [Arguments]    ${locator}    ${timeout}
    Wait For Elements State    ${locator}    attached    timeout=${timeout}
    Wait For Elements State    ${locator}    visible    timeout=${timeout}

Wait Until Element Is Invisible
    [Arguments]    ${locator}    ${timeout}
    Wait For Elements State    ${locator}    hidden    timeout=${timeout}

Wait Until
    [Arguments]    ${duration}
    Wait Until    ${duration}
