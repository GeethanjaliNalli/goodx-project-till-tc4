*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=valid_user
    ...    input.password=valid_password

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company Info
    ...    tab.terms=Terms & Conditions
    ...    tab.privacy=Privacy Policy
    ...    tab.support=Support
    ...    tab.version=Version Info

&{EXPECTED_DATA}
    ...    navigation.success=True
    ...    about.tabs.count=5
    ...    about.closed=True
