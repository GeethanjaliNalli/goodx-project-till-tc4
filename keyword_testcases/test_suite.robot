*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_03 Verify Navigation In The About Section
    [Documentation]    Verify that a user can successfully login, open the About section, navigate through all tabs (Overview, Terms, Privacy), and close the About dialog.
    ...    This ensures the About section navigation works as expected for a valid user.
    ...    The test covers the full navigation and closure flow for the About section.
    Verify About Section Navigation
