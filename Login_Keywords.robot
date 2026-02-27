*** Settings ***
Library    Selenium2Library

*** Keywords ***
Login with valid user
    Open browser    https://www.saucedemo.com/    chrome
    Input Text    //*[@id="user-name"]    text=standard_user
    Input Password    id=password     secret_sauce
    Click Button    id=login-button