*** Settings ***
Documentation    This diary page resource file has all the diary and quicknote related keywords.
Resource    ../common/super.resource
Resource    ../object_repository/diary_page.resource

*** Keywords ***
Open Booking Details For New Patient
    [Documentation]    Opens the booking details sidebar for a new patient booking using the provided booking time.
    [Arguments]    ${booking_time}
    ${timeslot_locator}=    Set Variable    //div[contains(@class,'time') and text()='${booking_time}']/ancestor::div[contains(@class,'booking')]
    Wait Until Element Is Visible    ${timeslot_locator}    ${LONG_WAIT}
    Click    ${timeslot_locator}
    Wait Until Element Is Visible    ${DIARY_GRID_LOCATORS}[dialog.sidebar]    ${LONG_WAIT}

Click Add Quick Note Button
    [Documentation]    Clicks the Add Quick Note button in the booking sidebar.
    Wait Until Element Is Visible    ${DIARY_GRID_LOCATORS}[span.btn_view_notebook]    ${LONG_WAIT}
    Click    ${DIARY_GRID_LOCATORS}[span.btn_view_notebook]
    Wait Until Element Is Visible    //button[contains(.,'Add Quick Note')]    ${LONG_WAIT}
    Click    //button[contains(.,'Add Quick Note')]
    Wait Until Element Is Visible    //form[contains(@class,'quicknote-form')]    ${LONG_WAIT}

Select Quick Note Type
    [Documentation]    Selects the quick note type from the dropdown in the quick note form.
    [Arguments]    ${note_type}
    Wait Until Element Is Visible    //select[@name='noteType']    ${LONG_WAIT}
    Select Options By    //select[@name='noteType']    label    ${note_type}

Enter Quick Note Text
    [Documentation]    Enters the quick note text in the quick note form.
    [Arguments]    ${text}
    Wait Until Element Is Visible    //textarea[@name='noteText']    ${LONG_WAIT}
    Fill Text    //textarea[@name='noteText']    ${text}

Attach Image To Quick Note
    [Documentation]    Attaches an image file to the quick note.
    [Arguments]    ${image_path}
    Wait Until Element Is Visible    //input[@type='file' and @accept^='image']    ${LONG_WAIT}
    Choose File    //input[@type='file' and @accept^='image']    ${image_path}
    Wait Until Element Is Visible    //div[contains(@class,'quicknote-attachments')]//img[contains(@src,'${image_path.split("/")[-1]}')]    ${LONG_WAIT}

Attach PDF To Quick Note
    [Documentation]    Attaches a PDF file to the quick note.
    [Arguments]    ${pdf_path}
    Wait Until Element Is Visible    //input[@type='file' and @accept='.pdf']    ${LONG_WAIT}
    Choose File    //input[@type='file' and @accept='.pdf']    ${pdf_path}
    Wait Until Element Is Visible    //div[contains(@class,'quicknote-attachments')]//span[contains(.,'${pdf_path.split("/")[-1]}')]    ${LONG_WAIT}

Set Quick Note Created By
    [Documentation]    Sets the Created By field in the quick note form.
    [Arguments]    ${created_by}
    Wait Until Element Is Visible    //input[@name='createdBy']    ${LONG_WAIT}
    Fill Text    //input[@name='createdBy']    ${created_by}

Set Quick Note Created On
    [Documentation]    Sets the Created On date in the quick note form.
    [Arguments]    ${created_on}
    Wait Until Element Is Visible    //input[@name='createdOn']    ${LONG_WAIT}
    Fill Text    //input[@name='createdOn']    ${created_on}

Set Quick Note Visibility
    [Documentation]    Sets the visibility of the quick note.
    [Arguments]    ${visibility}
    Wait Until Element Is Visible    //select[@name='visibility']    ${LONG_WAIT}
    Select Options By    //select[@name='visibility']    label    ${visibility}

Add Tags To Quick Note
    [Documentation]    Adds tags to the quick note.
    [Arguments]    ${tags}
    Wait Until Element Is Visible    //input[@name='tags']    ${LONG_WAIT}
    Fill Text    //input[@name='tags']    ${tags}
    Press Keys    //input[@name='tags']    Enter

Save Quick Note
    [Documentation]    Saves the quick note form.
    Wait Until Element Is Visible    //button[contains(.,'Save')]    ${LONG_WAIT}
    Click    //button[contains(.,'Save')]
    Wait Until Element Is Invisible    //form[contains(@class,'quicknote-form')]    ${LONG_WAIT}

Validate Quick Note Is Added With Details
    [Documentation]    Validates that the quick note is added with all expected details, including images, text, and PDF.
    [Arguments]    &{expected_data}
    Wait Until Element Is Visible    //div[contains(@class,'quicknote-list')]    ${LONG_WAIT}
    ${note_locator}=    Set Variable    //div[contains(@class,'quicknote-list')]//div[contains(@class,'quicknote-item') and .//div[contains(.,'${expected_data}[text]')]]
    Wait Until Element Is Visible    ${note_locator}    ${LONG_WAIT}
    ${actual_note_type}=    Get Text    ${note_locator}//span[@class='note-type']
    Should Be Equal    ${actual_note_type}    ${expected_data}[note_type]
    ${actual_text}=    Get Text    ${note_locator}//div[contains(@class,'note-text')]
    Should Contain    ${actual_text}    ${expected_data}[text]
    ${actual_created_by}=    Get Text    ${note_locator}//span[@class='created-by']
    Should Be Equal    ${actual_created_by}    ${expected_data}[created_by]
    ${actual_created_on}=    Get Text    ${note_locator}//span[@class='created-on']
    Should Be Equal    ${actual_created_on}    ${expected_data}[created_on]
    ${actual_visibility}=    Get Text    ${note_locator}//span[@class='visibility']
    Should Be Equal    ${actual_visibility}    ${expected_data}[visibility]
    ${actual_tags}=    Get Text    ${note_locator}//span[@class='tags']
    Should Contain    ${actual_tags}    ${expected_data}[tags]
    Wait Until Element Is Visible    ${note_locator}//img[contains(@src,'${expected_data}[image_file]')]    ${LONG_WAIT}
    Wait Until Element Is Visible    ${note_locator}//span[contains(.,'${expected_data}[pdf_file]')]    ${LONG_WAIT}
