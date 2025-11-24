*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=alex.smith
    ...    input.password=Password123

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company Info
    ...    tab.terms=Terms & Conditions
    ...    tab.privacy=Privacy Policy
    ...    tab.contact=Contact Us
    ...    tab.version=Version Info

&{EXPECTED_DATA}
    ...    navigation.status=Success
    ...    navigation.closed=True
