*** Settings ***
Documentation    Keywords for navigating and verifying the About section tabs.
Resource    ../common/super.resource
Resource    ../object_repository/about_section.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section dialog from the main application.
    Click    ${button.about}
    Wait Until Element Is Visible    ${dialog.about}    timeout=5s

Select About Tab
    [Documentation]    Selects a specific tab in the About section by locator.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=2s

Navigate All About Tabs
    [Documentation]    Navigates through all tabs in the About section.
    Open About Section
    Select About Tab    ${tab.overview}
    Select About Tab    ${tab.license}
    Select About Tab    ${tab.credits}

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${dialog.about}    timeout=5s
