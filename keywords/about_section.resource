*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including login, tab navigation, and closing the About dialog.
Resource    ../common/super.resource
Resource    ../object_repository/about_section_page.resource
Resource    ../keywords/login_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main dashboard.
    Click    ${button.about}
    Wait Until Element Is Visible    ${tab.company}    timeout=5s

Navigate To About Tab
    [Documentation]    Navigates to a specific tab in the About section by tab locator.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=2s

Navigate All About Tabs
    [Documentation]    Navigates through all tabs in the About section.
    Click    ${tab.company}
    Wait Until Element Is Visible    ${tab.company}    timeout=2s
    Click    ${tab.privacy}
    Wait Until Element Is Visible    ${tab.privacy}    timeout=2s
    Click    ${tab.terms}
    Wait Until Element Is Visible    ${tab.terms}    timeout=2s
    Click    ${tab.contact}
    Wait Until Element Is Visible    ${tab.contact}    timeout=2s

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${button.close.about}    timeout=5s

Verify About Section Navigation
    [Documentation]    Logs in, opens the About section, navigates all tabs, and closes the About section.
    Login With Valid Credentials
    Open About Section
    Navigate All About Tabs
    Close About Section
