*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/add_edit_page.resource
Resource    ../keywords/common_keywords.resource
Resource    ../keywords/dashboard_page.resource
Resource    ../keywords/login_page.resource
Resource    ../object_repository/add_edit_page.resource
Resource    ../object_repository/dashboard_page.resource
Resource    ../object_repository/login_page.resource
Resource    ../Testdata/booking_data.resource
Resource    ../Testdata/constants.resource

# --- New imports for Adding a quicknote test case ---
Resource    ../../keywords/quick_note_page.resource
Resource    ../../object_repository/quick_note_page.resource
Resource    ../../Testdata/quick_note_data.resource
