*** Settings ***
Library    Selenium2Library


*** Test Cases ***
Open SauceDemo
    Open Browser    https://www.saucedemo.com/  google chrome
    #Input Text    id=user-name    standerd_user
    Input Text    locator=id=user-name    text=standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button
    # Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Sleep    2s
    Close Browser
    

Open SauceDemo2 
    Open Browser    https://www.saucedemo.com/    google chrome
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauceee
    Sleep    2s
    Close Browser


Open SauceDemo3
    Open Browser     https://www.saucedemo.com/     google chrome
    Input Text    id=user-name    asdf
    Input Password    //*[@id="password"]     secret_sauce
    Click Button    id=login-button
    Sleep    2s
    # Close Browser

Open SauceDemo4
    Open Browser     https://www.saucedemo.com/     google chrome
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    id=login-button
    Sleep    2s
    Close Browser

Open SauceDemo5
    Open Browser     https://www.saucedemo.com/     google chrome
    Input Text    //*[@id="user-name"]    text=standard_user
    Click Button    id=login-button
    Sleep    2s
    Close Browser


#Login with standard_user wrong password

#Login with wrong username and valid password

#Login without username

#Login without password

#Új fájl:
#Buy product and complete checkout