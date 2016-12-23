*** Settings ***
Documentation   This suite contains simple tests for Hireukraine
Library  Selenium2Library
Library  BuiltIn
Library  MyLibrary.py
Resource    var.robot
Test Teardown  Close All Browsers


*** Test Cases ***
Check Header links
    [Tags]  SMOKE1
    Open Main Page
    Scroll Page to Locator  0   2000
    Go to all Pages from 'Our-Services' drop down list
    Go to 'Contact Us' Page

Check HireUs pop-up window on Main Page
    [Tags]  SMOKE1
    Open Main Page
    Open and close HireUs Pop-up window
    scroll page to locator  0   40000
    Open and close Lets-Start Pop-up window


Negative tests for 'Leave us a message' block on 'Contact Us' page
    [Tags]  SMOKE1
    Open Contact Us Page
    Enter data only on Name Field
    Enter invalid data on email field
    Enter data on message field
    reload page
    Enter valid data only on email field
