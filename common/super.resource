*** Settings ***
Documentation       This super.resource file has all imported Libraries and Resources
Library             Collections
Library             DateTime
Library             OperatingSystem
Library             String
Library             ../library/CustomLibrary.py
Resource            ../common/global_config.resource
Resource            ../keywords/common_keywords.resource
Resource            ../keywords/login_page.resource
Resource            ../keywords/dashboard_page.resource
Resource            ../keywords/add_edit_page.resource
Resource            ../object_repository/login_page.resource
Resource            ../object_repository/dashboard_page.resource
Resource            ../object_repository/add_edit_page.resource
Resource            ../Testdata/booking_data.resource
Library             Browser        jsextension=${CURDIR}/../library/custom_library.js