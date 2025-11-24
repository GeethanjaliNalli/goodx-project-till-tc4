*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_03 Verify Navigation In The About Section
    [Documentation]    Verify that the user can navigate to each tab in the About section and close it successfully.
    ...    This test ensures all About section tabs are accessible and the dialog can be closed.
    ...    The user must be logged in before executing these steps.
    Resource    ../keywords/about_section.resource
    Navigate All About Tabs
