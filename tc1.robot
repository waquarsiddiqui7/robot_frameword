*** Settings ***
Documentation    Validate test case
Library    SeleniumLibrary
Library    FakerLibrary


*** Variables ***
${url}  https://rahulshettyacademy.com/loginpagePractise/
${url00}    https://testautomationpractice.blogspot.com/
${browser}  chrome
${url1}     https://www.google.co.in/
${JS_CODE}  document.body.style.backgroundColor = 'ed';
${expected_color}     white
${NUM_USERS}  5
${BROWSERS}  Chrome  Firefox  Edge


*** Test Cases ***
Validate test case
     Write a Robot Framework test case to open a browser (e.g., Chrome) and navigate to a specified URL
    Create a test case to verify the title of a webpage after it loads
    Implement a test case to search for a specific keyword on Google and verify the results
    Write a test case to fill out a form on a webpage and submit it
    Develop a test case to handle a dropdown menu and select an option based on its text
    Create a test case to validate the presence of an element (e.g., a button or link) on a webpage
    Implement a test case to capture a screenshot of a webpage during the test execution
     Write a test case to handle alerts or pop-up windows that appear during interactions with a webpage
      Create a test case to perform mouse hover actions on an element (e.g., triggering a dropdown menu)
      Write a test case to simulate keyboard input (e.g., typing into a text field) on a webpage
      Implement a test case to verify the contents of a table on a webpage (e.g., checking specific rows or columns)
      Create a test case to validate the functionality of pagination on a webpage (e.g., navigating through multiple pages of search results)
        Develop a test case to execute JavaScript code on a webpage and verify its effects
      Implement a test case to perform drag-and-drop actions between elements on a webpage
      Write a test case to handle cookies in a browser session (e.g., accepting or deleting cookies)
      Write a test case to verify the responsiveness of a webpage by resizing the browser window
       Implement a test case to handle authentication mechanisms (e.g., logging in with credentials) on a webpage
*** Keywords ***
 Write a Robot Framework test case to open a browser (e.g., Chrome) and navigate to a specified URL
    open browser    ${url}  ${browser}
    maximize browser window
    sleep   2

Create a test case to verify the title of a webpage after it loads
    title should be     LoginPage Practise | Rahul Shetty Academy
    sleep    2
    close browser
Implement a test case to search for a specific keyword on Google and verify the results
    open browser    ${url1}  ${browser}
    input text      xpath://*[@id="APjFqb"]     capgemini
    sleep       3
    click element    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[2]/div[4]/div[6]/center/input[1]
    close browser
Write a test case to fill out a form on a webpage and submit it
    open browser    ${url}  ${browser}
    maximize browser window
    input text    xpath://*[@id="username"]     rahulshettyacademy
    sleep    1
    input text    xpath://*[@id="password"]     learning
    sleep   2
    click element    xpath://*[@id="terms"]
    sleep    3
    click element       xpath://*[@id="signInBtn"]
    sleep    4
    close browser
Develop a test case to handle a dropdown menu and select an option based on its text
    open browser    ${url}  ${browser}
    maximize browser window
    input text    xpath://*[@id="username"]     rahulshettyacademy
    sleep    1
    input text    xpath://*[@id="password"]     learning
    sleep   2
    select from list by label    xpath://*[@id="login-form"]/div[5]/select      Teacher
    sleep    3
    click element    xpath://*[@id="terms"]
    sleep    3
    click element       xpath://*[@id="signInBtn"]
    sleep    4
    close browser

Create a test case to validate the presence of an element (e.g., a button or link) on a webpage
    open browser    https://letcode.in/buttons      ${browser}
    sleep       2
    maximize browser window
    click button    xpath://*[@id="color"]
    sleep       2
    close browser
Implement a test case to capture a screenshot of a webpage during the test execution
    open browser    ${url}  ${browser}
    maximize browser window
    input text    xpath://*[@id="username"]     rahulshettyacademy
    sleep    1
    input text    xpath://*[@id="password"]     learning
    sleep   2
    click element    xpath://*[@id="terms"]
    sleep    3
    click element       xpath://*[@id="signInBtn"]
    sleep    6
    capture page screenshot
    sleep   4
    close browser
Write a test case to handle alerts or pop-up windows that appear during interactions with a webpage
    open browser    ${url00}    ${browser}
    maximize browser window
    click element      xpath://*[@id="HTML9"]/div[1]/button[1]
    sleep   3
    handle alert    accept
    sleep    3
    close browser
Create a test case to perform mouse hover actions on an element (e.g., triggering a dropdown menu)
    open browser    ${url00}    ${browser}
    maximize browser window
    scroll element into view    xpath://*[@id="country"]
    sleep    4
    mouse over      xpath://*[@id="country"]
    sleep   5
#    mouse over       xpath://*[@id="country"]/option[10]
    click element    xpath://*[@id="country"]/option[10]
    sleep   4
    mouse over    xpath://*[@id="female"]
    close browser
Write a test case to simulate keyboard input (e.g., typing into a text field) on a webpage
    open browser    ${url}  ${browser}
    maximize browser window
    input text    xpath://*[@id="username"]     rahulshettyacademy
    sleep    1
    input text    xpath://*[@id="password"]     learning
    sleep   3
    close browser
Implement a test case to verify the contents of a table on a webpage (e.g., checking specific rows or columns)
    open browser    ${url00}    ${browser}
    maximize browser window
    sleep       3
    ${text}=    get text    xpath://*[@id="HTML1"]/div[1]/table/tbody/tr[2]/td[1]
    ${author}   get text    xpath://*[@id="HTML1"]/div[1]/table/tbody/tr[2]/td[2]
    ${Subject}  get text    xpath://*[@id="HTML1"]/div[1]/table/tbody/tr[2]/td[3]
    log to console       ${text}
    should be equal as strings    ${text}    Learn Selenium
    should be equal as strings    ${author}     Amit
    should be equal as strings    ${Subject}    Selenium
    sleep    3
    drag and drop       xpath://*[@id="draggable"]/p    xpath://*[@id="droppable"]


    close browser
Create a test case to validate the functionality of pagination on a webpage (e.g., navigating through multiple pages of search results)
    open browser    ${url00}    ${browser}
    maximize browser window
    click element    xpath://*[@id="post-body-1307673142697428135"]/a[2]
#    click button    xpath://*[@id="HTML4"]/div[1]/button
#    wait until page contains element    xpath://*[@id="logo"]/a/img
#    sleep   3
#    page should contain image    xpath://*[@id="content"]/div[2]/div[2]/div/div[1]/a/img
#    title should be    Your Store
    wait until page contains    Login
    sleep   4
    title should be     OrangeHRM
    close all browsers
Develop a test case to execute JavaScript code on a webpage and verify its effects
    open browser    ${url00}    ${browser}
    Maximize Browser Window
    sleep    5
    Execute JavaScript  ${JS_CODE}
    ${actual_color}=  Execute JavaScript  return window.getComputedStyle(document.body).backgroundColor;
    should not be equal    ${actual_color}    ${expected_color}
    close browser


Implement a test case to perform drag-and-drop actions between elements on a webpage
    open browser    ${url00}}    ${browser}
    maximize browser window
    sleep       4
    scroll element into view    xpath://*[@id="draggable"]/p
    sleep       3
    drag and drop       xpath://*[@id="draggable"]/p    xpath://*[@id="droppable"]
    close browser
Write a test case to handle cookies in a browser session (e.g., accepting or deleting cookies)
    open browser    ${url00}    ${browser}
    maximize browser window
    sleep    4
    delete all cookies
    close browser
Write a test case to verify the responsiveness of a webpage by resizing the browser window
    open browser    ${url00}    ${browser}
    maximize browser window
    sleep   4
    set window size    1920     1080
    sleep   4
    set window size    1366     768
    sleep    4
    set window size    768      1024
    sleep           4
    close browser
Implement a test case to handle authentication mechanisms (e.g., logging in with credentials) on a webpage
    open browser    ${url}  ${browser}
     maximize browser window
    input text    xpath://*[@id="username"]     rahulshettyacade
    sleep    1
    input text    xpath://*[@id="password"]     learning
    sleep   2
    click element    xpath://*[@id="terms"]
    sleep    3
    click element       xpath://*[@id="signInBtn"]
    sleep    10
    input text    xpath://*[@id="username"]     rahulshettyacademy
    sleep    1
    input text    xpath://*[@id="password"]     learning
    sleep   2
    click element    xpath://*[@id="terms"]
    sleep    3
    click element       xpath://*[@id="signInBtn"]
    sleep    4
    close browser
