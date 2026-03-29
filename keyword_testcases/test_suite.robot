*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_02 Verify Navigation In The About Section
    [Documentation]    Verify that a user can navigate to the About section, access all tabs, and close the dialog successfully.
    ...    This test ensures that the Overview, License, and Credits tabs are accessible in the About section.
    ...    The About dialog should be closed at the end of the test.
    Resource    ../keywords/about_section.resource
    Navigate All About Tabs
    Close About Section
