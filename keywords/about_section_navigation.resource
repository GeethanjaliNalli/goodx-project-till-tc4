*** Settings ***
Documentation    This file provides keywords to automate navigation through all tabs in the About section and closing it.
Resource    ../common/super.resource
Resource    ../object_repository/about_section_navigation.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main page.
    Click    ${button.about}
    Wait Until Element Is Visible    ${tab.company}    timeout=5s

Navigate To Company Tab
    [Documentation]    Navigates to the Company tab in the About section.
    Click    ${tab.company}
    Wait Until Element Is Visible    ${tab.company}    timeout=2s

Navigate To Team Tab
    [Documentation]    Navigates to the Team tab in the About section.
    Click    ${tab.team}
    Wait Until Element Is Visible    ${tab.team}    timeout=2s

Navigate To Legal Tab
    [Documentation]    Navigates to the Legal tab in the About section.
    Click    ${tab.legal}
    Wait Until Element Is Visible    ${tab.legal}    timeout=2s

Navigate To Privacy Tab
    [Documentation]    Navigates to the Privacy tab in the About section.
    Click    ${tab.privacy}
    Wait Until Element Is Visible    ${tab.privacy}    timeout=2s

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${tab.company}    timeout=5s
