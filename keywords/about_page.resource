*** Settings ***
Documentation    This About page resource file has all the About section navigation keywords.
Resource    ../common/super.resource

*** Keywords ***
Open About Section
    [Documentation]    Opens the About section from the main navigation or menu.
    Click    ${about_section_locators}[button.about]
    Wait Until Element Is Visible    ${about_section_locators}[dialog.about]    ${LONG_WAIT}

Navigate To About Tab
    [Documentation]    Navigates to the specified tab in the About section.
    [Arguments]    ${tab_name}
    ${tab_locator}    Get From Dictionary    ${about_section_locators}    ${tab_name}
    Click    ${tab_locator}
    Wait Until About Tab Is Active    ${tab_locator}

Wait Until About Tab Is Active
    [Documentation]    Waits until the specified About tab is active and its content is visible.
    [Arguments]    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    ${SHORT_WAIT}
    ${content_locator}    Get About Tab Content Locator    ${tab_locator}
    Wait Until Element Is Visible    ${content_locator}    ${SHORT_WAIT}

Get About Tab Content Locator
    [Documentation]    Returns the locator for the content area of the specified About tab.
    [Arguments]    ${tab_locator}
    ${tab_key}    Get About Tab Key From Locator    ${tab_locator}
    ${content_locator}    Get From Dictionary    ${about_section_locators}    ${tab_key}.content
    [Return]    ${content_locator}

Get About Tab Key From Locator
    [Documentation]    Returns the tab key for the given tab locator.
    [Arguments]    ${tab_locator}
    FOR    ${key}    ${value}    IN    &{about_section_locators}
        Run Keyword If    '${value}' == '${tab_locator}'    Set Variable    ${found_key}    ${key}
        Run Keyword If    '${value}' == '${tab_locator}'    Exit For Loop
    END
    [Return]    ${found_key}

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${about_section_locators}[button.close]
    Wait Until Element Is Invisible    ${about_section_locators}[dialog.about]    ${SHORT_WAIT}
