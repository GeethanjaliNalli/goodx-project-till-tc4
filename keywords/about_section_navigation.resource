*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including login, tab navigation, and closing the dialog.
Resource    ../common/super.resource
Resource    ../object_repository/about_section_navigation.resource
Resource    login_page.resource

*** Keywords ***

Login With Valid Credentials
    [Documentation]    Logs in using valid username and password.
    # Assumes existing keywords for login are in login_page.resource
    Login To Application

Open About Section
    [Documentation]    Opens the About section from the main interface.
    Click    ${button.about}
    Wait Until Element Is Visible    ${dialog.about}    timeout=5s

Navigate To About Tab
    [Documentation]    Navigates to a specified tab in the About section.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=2s

Navigate Through All About Tabs
    [Documentation]    Navigates through all tabs in the About section.
    Navigate To About Tab    ${tab.overview}
    Navigate To About Tab    ${tab.terms}
    Navigate To About Tab    ${tab.privacy}

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${dialog.about}    timeout=5s

Verify About Section Navigation
    [Documentation]    Performs login, opens About section, navigates all tabs, and closes the dialog.
    Login With Valid Credentials
    Open About Section
    Navigate Through All About Tabs
    Close About Section
