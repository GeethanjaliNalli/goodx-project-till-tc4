*** Settings ***
Documentation    This file contains all locators for the About section navigation and interaction.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    xpath=//button[@id="aboutBtn" or text()="About"]
${dialog.about}    xpath=//div[contains(@class,"about-dialog") or @role="dialog" and .//h2[text()="About"]]
${tab.overview}    xpath=//div[contains(@class,"about-dialog")]//div[contains(@role,"tab") and text()="Overview"]
${tab.terms}    xpath=//div[contains(@class,"about-dialog")]//div[contains(@role,"tab") and text()="Terms"]
${tab.privacy}    xpath=//div[contains(@class,"about-dialog")]//div[contains(@role,"tab") and text()="Privacy"]
${button.close.about}    xpath=//div[contains(@class,"about-dialog")]//button[contains(@class,"close") or @aria-label="Close"]
