*** Settings ***
Documentation    This file contains all locators for the About section navigation and actions.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    xpath=//button[normalize-space(text())="About"]
${tab.company}    xpath=//div[contains(@class,"about-tabs")]//button[normalize-space(text())="Company"]
${tab.privacy}    xpath=//div[contains(@class,"about-tabs")]//button[normalize-space(text())="Privacy Policy"]
${tab.terms}    xpath=//div[contains(@class,"about-tabs")]//button[normalize-space(text())="Terms & Conditions"]
${tab.contact}    xpath=//div[contains(@class,"about-tabs")]//button[normalize-space(text())="Contact Us"]
${button.close.about}    xpath=//div[contains(@class,"about-section")]//button[@aria-label="Close"]
