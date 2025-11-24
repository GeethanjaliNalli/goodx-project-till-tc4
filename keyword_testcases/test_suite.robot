*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_03 Verify Navigation In The About Section
    [Documentation]    Verify that the user can open the About section, navigate through all tabs (Company, Team, Legal, Privacy), and close the About section successfully.
    ...    This ensures the About section navigation is functioning as expected for a logged-in user.
    ...    The test covers tab navigation and dialog closure in the About module.
    Resource    ../keywords/about_section_navigation.resource
    Open About Section
    Navigate To Company Tab
    Navigate To Team Tab
    Navigate To Legal Tab
    Navigate To Privacy Tab
    Close About Section
