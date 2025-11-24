*** Settings ***
Documentation    This file provides keywords for navigation and actions in the About section.
Resource    ../common/super.resource
Resource    ../object_repository/about_section_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main interface.
    Click    ${button.about}
    Wait Until Element Is Visible    ${tab.company}    timeout=5s

Navigate To Company Tab
    [Documentation]    Navigates to the Company tab in the About section.
    Click    ${tab.company}
    Wait Until Element Is Visible    ${tab.company}    timeout=2s

Navigate To Terms Tab
    [Documentation]    Navigates to the Terms tab in the About section.
    Click    ${tab.terms}
    Wait Until Element Is Visible    ${tab.terms}    timeout=2s

Navigate To Privacy Tab
    [Documentation]    Navigates to the Privacy tab in the About section.
    Click    ${tab.privacy}
    Wait Until Element Is Visible    ${tab.privacy}    timeout=2s

Close About Section
    [Documentation]    Closes the About section dialog or panel.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${button.close.about}    timeout=5s
