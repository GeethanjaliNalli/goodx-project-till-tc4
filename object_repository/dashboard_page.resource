*** Settings ***
Documentation       This file contains all types of locators for the Dashboard page.


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.logout}    .logout
${link.diary}    [class="option AnyDiaryScreen selected"]
${ATTENTION_ALERT}    xpath=//span[text()='Attention!']
${button.attention.cancel}    xpath=//button[text()='Cancel']
${button.attention.ok}     xpath=//button[text()='Ok']
${link}
${link.navigation.menu}    div > a
${svg.viewbox}    div > svg
${segment.diary}    svg > g:nth-child(3)
${text.date}    [class="input-group date"] > input
${button.now}    xpath=//t[text()="Now"]
${div.selected.timeslot}    xpath=//div[@class="timeslot ui-droppable selected"]