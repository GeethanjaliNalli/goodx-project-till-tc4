*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=validUser01
    ...    input.password=ValidPass123

&{ABOUT_TABS}
    ...    tab.company=Company Info
    ...    tab.terms=Terms & Conditions
    ...    tab.privacy=Privacy Policy
    ...    tab.contact=Contact Us
    ...    tab.version=Version Info

&{EXPECTED_DATA}
    ...    navigation.success=User is able to navigate through all tabs in the About section and close the section successfully.
