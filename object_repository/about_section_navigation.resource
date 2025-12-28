*** Settings ***
Documentation    This file contains all locators for the About section navigation page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    css=button#about
${tab.company}    xpath=//div[@role="tablist"]//button[span[text()="Company"]]
${tab.team}    xpath=//div[@role="tablist"]//button[span[text()="Team"]]
${tab.legal}    xpath=//div[@role="tablist"]//button[span[text()="Legal"]]
${tab.privacy}    xpath=//div[@role="tablist"]//button[span[text()="Privacy"]]
${button.close.about}    css=button[aria-label="Close About"]
