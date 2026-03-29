*** Settings ***
Documentation    This resource file contains all keywords for Quick Note functionality (Add Quicknote to Booking).
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource
Resource    ../Testdata/quick_note_data.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module and opens the clinical sidebar for the booking at the given time.
    [Arguments]    ${diary_module}    ${booking_time}
    Select Menu In Navigation Wheel    ${diary_module}
    Select Timeslot    ${booking_time}
    Click Quick Note Booking Clinical Button
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]    ${LONG_WAIT}

Click Quick Note Booking Clinical Button
    [Documentation]    Clicks the clinical button for the selected booking to open the clinical sidebar.
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical]
    Wait Until    1s

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown in the clinical sidebar.
    [Arguments]    ${select_by}=label
    Click    ${QUICK_NOTE_LOCATORS}[dropdown.forms_library]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${SHORT_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[option.quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[dialog.quick_note]    ${LONG_WAIT}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[label.quick_note_title]    ${SHORT_WAIT}
    ${title}    Get Text    ${QUICK_NOTE_LOCATORS}[label.quick_note_title]
    Should Contain    ${title}    Quick Note

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note by uploading a file and verifying preview.
    [Arguments]    ${image_upload_button}    ${image_file_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Upload File To Quick Note Image    ${image_file_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[label.uploaded_image_preview]    ${LONG_WAIT}

Upload File To Quick Note Image
    [Documentation]    Uploads an image file to the Quick Note image input.
    [Arguments]    ${image_file_path}
    Fill File    ${QUICK_NOTE_LOCATORS}[input.upload_image]    ${image_file_path}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note text area.
    [Arguments]    ${text_area}    ${quick_note_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quick_note_text]    ${quick_note_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note and verifies preview.
    [Arguments]    ${pdf_upload_button}    ${pdf_file_path}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_from_file]
    Upload File To Quick Note PDF    ${pdf_file_path}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[label.uploaded_pdf_preview]    ${LONG_WAIT}

Upload File To Quick Note PDF
    [Documentation]    Uploads a PDF file to the Quick Note PDF input.
    [Arguments]    ${pdf_file_path}
    Fill File    ${QUICK_NOTE_LOCATORS}[input.upload_pdf]    ${pdf_file_path}

Print Quick Note
    [Documentation]    Prints the Quick Note and verifies the print preview is rendered.
    [Arguments]    ${print_button}
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[label.print_preview]    ${LONG_WAIT}

Validate Quick Note Is Auto Completed
    [Documentation]    Validates that the Quick Note dialog is auto completed and closed.
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[dialog.quick_note]    ${LONG_WAIT}

Validate Quick Note Print Preview
    [Documentation]    Validates that the print preview contains the uploaded image, text, and PDF.
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[label.print_preview]    ${LONG_WAIT}
    ${print_text}    Get Text    ${QUICK_NOTE_LOCATORS}[label.print_preview]
    Should Contain    ${print_text}    ${expected_text}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[label.uploaded_image_preview]    ${LONG_WAIT}
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[label.uploaded_pdf_preview]    ${LONG_WAIT}

Close Quick Note Dialog
    [Documentation]    Closes the Quick Note dialog.
    Click    ${QUICK_NOTE_LOCATORS}[button.close_dialog]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[dialog.quick_note]    ${LONG_WAIT}
