*** Settings ***
Documentation    This file contains all locators for the About section navigation page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    xpath=//button[normalize-space(text())="About"]
${tab.company}    xpath=//div[@role="tablist"]//button[normalize-space(text())="Company"]
${tab.terms}    xpath=//div[@role="tablist"]//button[normalize-space(text())="Terms"]
${tab.privacy}    xpath=//div[@role="tablist"]//button[normalize-space(text())="Privacy"]
${button.close.about}    xpath=//div[contains(@class,"about-section")]//button[@aria-label="Close"]
