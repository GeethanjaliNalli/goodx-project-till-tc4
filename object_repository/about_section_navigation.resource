*** Settings ***
Documentation    This file contains all locators for the About section navigation page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    xpath=//button[normalize-space(text())="About"]
${dialog.about}    xpath=//div[contains(@class,"about-dialog")]
${tab.overview}    xpath=//div[contains(@class,"about-dialog")]//div[contains(@role,"tab") and text()="Overview"]
${tab.license}    xpath=//div[contains(@class,"about-dialog")]//div[contains(@role,"tab") and text()="License"]
${button.close.about}    xpath=//div[contains(@class,"about-dialog")]//button[@aria-label="Close"]
