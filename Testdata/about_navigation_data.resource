*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=alex.user
    ...    input.password=Passw0rd123

&{ABOUT_TABS}
    ...    tab.company=About Company
    ...    tab.team=Team
    ...    tab.careers=Careers
    ...    tab.contact=Contact Us
    ...    tab.legal=Legal

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    about_section_status=All tabs navigated and closed successfully
