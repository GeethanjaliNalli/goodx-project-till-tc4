*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_03 Verify Navigation In The About Section
    [Documentation]    Verify that a user can open the About section, navigate through all available tabs, and close the section successfully.
    ...    This ensures that all About section navigation elements are accessible and functioning as expected.
    ...    The user must be able to view Company, Privacy Policy, Terms & Conditions, and Contact Us tabs and close the About dialog.
    Open About Section
    Navigate All About Tabs
    Close About Section
