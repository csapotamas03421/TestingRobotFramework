*** Settings ***
Library        Selenium2Library


*** Test Cases ***
Open SauceDemo
    Open Browser    https://www.saucedemo.com/  firefox
    Sleep    2s
    Close Browser

Open SauceDemo chrome
    Open Browser    https://www.saucedemo.com/    chrome
    Sleep    2s
    Close Browser 
