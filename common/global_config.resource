*** Settings ***
Documentation       This common variables file has all the common variable


*** Variables ***
${BROWSER_NAME}    chromium
${HEADLESS_BROWSER}    False
${URL}    https://qa_qualizeal.qagoodx.co.za/
${USERNAME}    automation
${PASSWORD}    auto123
${SHORT_WAIT}     10s
${MEDIUM_WAIT}    30s
${LONG_WAIT}      60s
${TESTDATA_FOLDER}    ${EXECDIR}/Testdata/testdata.xlsx
${ATTENTION_ALERT}    xpath=//span[text()='Attention!']