*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_03 Verify Navigation In The About Section
    [Documentation]    Verify that a user can successfully navigate through all tabs in the About section and close the section.
    ...    Ensures the About section opens, each tab is accessible, and the section can be closed without error.
    ...    Validates the navigation flow and UI responsiveness for the About module.
    Verify About Section Navigation
