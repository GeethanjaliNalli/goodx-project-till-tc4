*** Settings ***
Documentation    This file contains all locators for the About section navigation and tabs.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    css=button#about
${tab.overview}    xpath=//div[@role="tablist"]//button[normalize-space(text())="Overview"]
${tab.team}    xpath=//div[@role="tablist"]//button[normalize-space(text())="Team"]
${tab.contact}    xpath=//div[@role="tablist"]//button[normalize-space(text())="Contact"]
${button.close.about}    css=button[aria-label="Close About Section"]
