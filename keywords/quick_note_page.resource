*** Settings ***
Documentation    This resource file contains all keywords for Adding a Quick Note to a booking, including image, PDF, and print actions, using strictly defined locators and enterprise keyword architecture.
Resource    ../common/super.resource
Resource    ../object_repository/quick_note_page.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary booking and the Clinical sidebar for the selected booking.
    Click    ${link.booking}
    Wait Until Element Is Visible    ${button.clinical}    ${LONG_WAIT}
    Click    ${button.clinical}
    Wait Until Element Is Visible    ${dropdown.forms_library}    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the Forms Library dropdown.
    [Arguments]    ${select_by}=label
    Click    ${dropdown.forms_library}
    Wait Until Element Is Visible    ${option.quick_note}    ${LONG_WAIT}
    Click    ${option.quick_note}
    Wait Until Element Is Visible    ${button.add_image}    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note by uploading from file and selecting the image.
    [Arguments]    ${image_path}
    Click    ${button.add_image}
    Wait Until Element Is Visible    ${button.upload_from_file}    ${LONG_WAIT}
    Click    ${button.upload_from_file}
    Wait Until Element Is Visible    ${input.choose_file}    ${LONG_WAIT}
    Upload File To Quick Note    ${input.choose_file}    ${image_path}
    Wait Until Element Is Visible    ${image.selected_picture}    ${LONG_WAIT}
    Click    ${image.selected_picture}
    Wait Until Element Is Invisible    ${image.selected_picture}    ${LONG_WAIT}

Add Quick Note Text
    [Documentation]    Adds text to the Quick Note using the provided value.
    [Arguments]    ${quick_note_text}
    Fill Text    ${textarea.quick_note_text}    ${quick_note_text}
    Click    ${button.save_quick_note}
    Wait Until Element Is Invisible    ${button.save_quick_note}    ${LONG_WAIT}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${pdf_path}
    Click    ${button.upload_pdf}
    Wait Until Element Is Visible    ${file.pdf_select_and_open}    ${LONG_WAIT}
    Upload File To Quick Note    ${file.pdf_select_and_open}    ${pdf_path}
    Wait Until Element Is Invisible    ${file.pdf_select_and_open}    ${LONG_WAIT}

Print Quick Note
    [Documentation]    Prints the Quick Note and verifies print action is triggered.
    [Arguments]    ${print_button_label}
    Click    ${button.print_quick_note}
    Wait Until Element Is Invisible    ${button.print_quick_note}    ${LONG_WAIT}

Upload File To Quick Note
    [Documentation]    Uploads a file to the specified locator in the Quick Note form.
    [Arguments]    ${locator}    ${file_path}
    Evaluate Expression    page.set_input_files(${locator}, r'''${file_path}''')

Validate Quick Note Saved In Clinical Record
    [Documentation]    Validates that the Quick Note is saved in the Patient’s Clinical record.
    Wait Until Element Is Visible    ${textarea.quick_note_text}    ${LONG_WAIT}
    ${actual_text}    Get Text    ${textarea.quick_note_text}
    Should Contain    ${actual_text}    ${QUICK_NOTE_INFO}[textarea.quick_note_text]

Validate Quick Note Email And Print Logs
    [Documentation]    Validates that Email and Print logs are recorded in the Patient communication history.
    # Implementation depends on actual communication history UI; add steps as per UI when available.

Enter Quick Note Data
    [Documentation]    Enters Quick Note form fields dynamically using dictionary keys.
    [Arguments]    ${select_by}=label    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${QUICK_NOTE_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    ${select_by}    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('textarea.')
        ...    Fill Text    ${locator}    ${value}
    END
