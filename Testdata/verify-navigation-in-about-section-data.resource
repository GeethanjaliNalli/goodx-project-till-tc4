*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=validUser
    ...    input.password=validPass123

&{ABOUT_NAVIGATION}
    ...    button.about=About
    ...    tab.company=Company
    ...    tab.team=Team
    ...    tab.careers=Careers
    ...    tab.contact=Contact
    ...    button.close=Close

&{EXPECTED_DATA}
    ...    navigation_status=Success
    ...    about_tabs_visited=Company, Team, Careers, Contact
    ...    about_closed=True
