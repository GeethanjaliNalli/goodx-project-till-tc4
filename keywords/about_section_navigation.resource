*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including opening, navigating tabs, and closing the dialog.
Resource    ../common/super.resource
Resource    ../object_repository/about_section_navigation.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section dialog from the main page.
    Click    ${button.about}
    Wait Until Element Is Visible    ${dialog.about}    timeout=5s

Navigate To Overview Tab
    [Documentation]    Navigates to the Overview tab in the About section.
    Click    ${tab.overview}
    Wait Until Element Is Visible    ${tab.overview}    timeout=3s

Navigate To License Tab
    [Documentation]    Navigates to the License tab in the About section.
    Click    ${tab.license}
    Wait Until Element Is Visible    ${tab.license}    timeout=3s

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${dialog.about}    timeout=5s

Verify About Section Navigation
    [Documentation]    Performs navigation to each tab in the About section and closes it successfully.
    Open About Section
    Navigate To Overview Tab
    Navigate To License Tab
    Close About Section
