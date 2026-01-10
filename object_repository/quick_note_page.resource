*** Settings ***
Documentation     This file contains all types of locators for the Quick Note functionality (Add Quicknote to Booking).

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${link.booking}                       a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
${button.clinical}                    a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
${dropdown.forms_library}             a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().medicalaid_contracts)"]
${option.quick_note}                  a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
${button.add_image}                   a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
${button.upload_from_file}            a[data-bind="processEvent: { click: 'About' }"]
${input.choose_file}                  a[data-bind="processEvent: { click: 'About' }"]
${image.selected_picture}             a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
${button.save_quick_note}             a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().medicalaid_contracts)"]
${textarea.quick_note_text}           a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
${button.upload_pdf}                  a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
${file.pdf_select_and_open}           a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
${button.print_quick_note}            a[data-bind="processEvent: { click: 'About' }"]
