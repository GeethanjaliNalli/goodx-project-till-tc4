*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including login, tab navigation, and closing the section.
Resource    ../common/super.resource
Resource    ../object_repository/about_section_navigation.resource
Resource    ./login_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main interface.
    Wait Until Element Is Visible    ${button.about}    timeout=10s
    Click    ${button.about}
    Wait Until Element Is Visible    ${tab.overview}    timeout=10s

Navigate To About Tab
    [Documentation]    Navigates to a specific tab in the About section.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=5s

Navigate Through All About Tabs
    [Documentation]    Navigates through all tabs in the About section sequentially.
    Click    ${tab.overview}
    Wait Until Element Is Visible    ${tab.overview}    timeout=5s
    Click    ${tab.team}
    Wait Until Element Is Visible    ${tab.team}    timeout=5s
    Click    ${tab.contact}
    Wait Until Element Is Visible    ${tab.contact}    timeout=5s

Close About Section
    [Documentation]    Closes the About section after navigation.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${tab.overview}    timeout=5s

Verify About Section Navigation
    [Documentation]    Performs login, opens the About section, navigates all tabs, and closes the section.
    Login With Valid Credentials
    Open About Section
    Navigate Through All About Tabs
    Close About Section
