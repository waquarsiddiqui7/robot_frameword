*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://testautomationpractice.blogspot.com/
${BROWSER}    Chrome
${TIMEOUT}    10 seconds

*** Test Cases ***
Validate Page Load Time
    Open Browser    ${URL}    ${BROWSER}
    maximize browser window
    ${start_time}=    get time
    Wait Until Page Contains    ${URL}    timeout=${TIMEOUT}
    ${end_time}=    get time
    ${load_time}=    evaluate        ${end_time} -   ${start_time}
    Should Be True    ${load_time} < ${TIMEOUT}
    Close Browser
