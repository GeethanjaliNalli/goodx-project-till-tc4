*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_03 Verify Navigation In The About Section
    [Documentation]    Verify that the user can navigate to each tab in the About section and close the section successfully.
    ...    Ensures navigation through Company, Terms, and Privacy tabs in the About section.
    ...    Confirms the About section can be closed after navigation.
    Open About Section
    Navigate To Company Tab
    Navigate To Terms Tab
    Navigate To Privacy Tab
    Close About Section
