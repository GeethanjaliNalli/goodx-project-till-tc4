*** Settings ***
Documentation    This file contains all locators for the About section navigation and tabs.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    css=button[aria-label="About"]
${dialog.about}    xpath=//div[contains(@class,"about-dialog")]
${tab.overview}    xpath=//div[contains(@class,"about-dialog")]//div[@role="tab" and text()="Overview"]
${tab.license}     xpath=//div[contains(@class,"about-dialog")]//div[@role="tab" and text()="License"]
${tab.credits}     xpath=//div[contains(@class,"about-dialog")]//div[@role="tab" and text()="Credits"]
${button.close.about}    xpath=//div[contains(@class,"about-dialog")]//button[@aria-label="Close"]
