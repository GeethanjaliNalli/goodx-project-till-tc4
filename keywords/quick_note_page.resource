*** Settings ***
Documentation    This resource file contains all keywords related to Quick Note functionality (Add Quick Note to Booking).
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary module and opens the Clinical Sidebar for a booking at the given time.
    [Arguments]    ${diary_module}    ${booking_time}
    Select Menu In Navigation Wheel    ${diary_module}
    Select Timeslot    ${booking_time}
    Click    ${QUICK_NOTE_LOCATORS}[button.select_booking]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[button.clinical_sidebar]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the forms library dropdown.
    [Arguments]    ${select_by}=label
    Click    ${QUICK_NOTE_LOCATORS}[button.forms_library_dropdown]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${LONG_WAIT}
    Select Options By    ${QUICK_NOTE_LOCATORS}[select.forms_library]    ${select_by}    Quick Note
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[option.quick_note]    ${LONG_WAIT}
    Click    ${QUICK_NOTE_LOCATORS}[option.quick_note]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.add_image]    ${LONG_WAIT}

Add Images To Quick Note
    [Documentation]    Adds one or more images to the Quick Note.
    [Arguments]    @{image_files}
    FOR    ${image_file}    IN    @{image_files}
        Click    ${QUICK_NOTE_LOCATORS}[button.add_image]
        Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
        Upload File To Quick Note    ${image_file}
        Wait Until Image Is Uploaded To Quick Note    ${image_file}
    END

Upload File To Quick Note
    [Documentation]    Uploads a file (image or PDF) to the Quick Note using the file chooser.
    [Arguments]    ${file_path}
    Fill File Chooser    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${file_path}

Wait Until Image Is Uploaded To Quick Note
    [Documentation]    Waits until the image is uploaded and visible in the Quick Note form.
    [Arguments]    ${image_file}
    ${image_name}    Evaluate    str(${image_file}).split('/')[-1]
    Wait Until Element Is Visible    xpath=//img[contains(@src, '${image_name}')]    ${LONG_WAIT}

Add Quick Note Text
    [Documentation]    Adds text to the Quick Note textbox.
    [Arguments]    ${quicknote_text}
    Fill Text    ${QUICK_NOTE_LOCATORS}[input.quicknote_textbox]    ${quicknote_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${pdf_file}
    Click    ${QUICK_NOTE_LOCATORS}[button.upload_pdf]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.choose_file]    ${LONG_WAIT}
    Upload File To Quick Note    ${pdf_file}
    Wait Until PDF Is Uploaded To Quick Note    ${pdf_file}

Wait Until PDF Is Uploaded To Quick Note
    [Documentation]    Waits until the PDF is uploaded and visible in the Quick Note form.
    [Arguments]    ${pdf_file}
    ${pdf_name}    Evaluate    str(${pdf_file}).split('/')[-1]
    Wait Until Element Is Visible    xpath=//a[contains(text(),'${pdf_name}')]    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note by clicking the Print button and waiting for the print dialog.
    Click    ${QUICK_NOTE_LOCATORS}[button.print]
    Wait Until Element Is Visible    ${QUICK_NOTE_LOCATORS}[button.print_dialog]    ${LONG_WAIT}

Save Quick Note
    [Documentation]    Saves the Quick Note form.
    Click    ${QUICK_NOTE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${QUICK_NOTE_LOCATORS}[button.save]    ${LONG_WAIT}

Fill File Chooser
    [Documentation]    Fills the file chooser with the specified file path.
    [Arguments]    ${locator}    ${file_path}
    Press Keys    ${locator}    ${file_path}

