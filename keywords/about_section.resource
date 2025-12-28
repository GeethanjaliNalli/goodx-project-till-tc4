*** Settings ***
Documentation    This file contains keywords for navigating and validating the About section tabs.
Resource    ../common/super.resource
Resource    ../object_repository/about_section_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section dialog from the main page.
    Click    ${button.about}
    Wait Until Element Is Visible    ${dialog.about}    timeout=5s

Select About Tab
    [Documentation]    Selects a tab in the About section by its locator.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=2s

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${dialog.about}    timeout=5s

Navigate All About Tabs
    [Documentation]    Navigates through all tabs in the About section.
    Open About Section
    Select About Tab    ${tab.overview}
    Select About Tab    ${tab.license}
    Close About Section
