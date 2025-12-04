*** Settings ***
Documentation    This file contains the dictionaries for Sick Note (Medical Certificate) data used in Diary - Add Sick note test cases.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_DATA}
...    forms_library_dropdown=SICK NOTE
...    in_the_dates_section_enter=2025-12-04
...    tick_relevant_boxes_under_unfit=Yes
...    expand_light_duty_and_input=No
...    select_extra_information_option_e=None
...    click_doctor_signature_button=Dr John Smith
...    enter_pin_1234_correct_pin=1234
