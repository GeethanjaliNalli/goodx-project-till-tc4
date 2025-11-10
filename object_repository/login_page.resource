*** Settings ***
Documentation       This file has all type of locators for login Page


*** Variables ***
# robocop: disable=section-variable-not-uppercase
${label.loadingbar}    .status
${textbox.username}    input[type="text"]
${textbox.password}    input[type="password"]
${button.login}        [type="submit"]
${label.error}         [class="error"]
${form.loginform}      form > div
