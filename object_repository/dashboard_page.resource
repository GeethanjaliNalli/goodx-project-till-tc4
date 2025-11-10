*** Settings ***
Documentation       This file has all type of locators for dashboard Page


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.logout}    .logout
${link.diary}    [class="option AnyDiaryScreen selected"]
${button.attention.cancel}    [class="btn btn-sm btn-default mr20"]
${button.attention.ok}     xpath=//button[text()='Ok']
