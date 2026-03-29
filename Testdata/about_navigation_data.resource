*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=validUser
    ...    input.password=ValidPass123

&{ABOUT_NAVIGATION}
    ...    button.about=About
    ...    tab.company=Company
    ...    tab.privacy=Privacy Policy
    ...    tab.terms=Terms & Conditions
    ...    tab.contact=Contact Us
    ...    button.close=Close

&{EXPECTED_DATA}
    ...    navigation_status=Success
    ...    about_tabs=[Company, Privacy Policy, Terms & Conditions, Contact Us]
    ...    about_closed=True
