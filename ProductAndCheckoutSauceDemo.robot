*** Settings ***
Library    Selenium2Library


*** Test Cases ***
Open SauceDemo
    Open Browser  https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    text=standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]

    #Adatok megadása
    Input Text    //*[@id="first-name"]    text=Tamas
    Input Text    //*[@id="last-name"]    text=Csapo
    Input Text    //*[@id="postal-code"]    text=6440
    Click Button    //*[@id="continue"]   
    Click Button    //*[@id="finish"] 

    Sleep    5s
    Page Should Contain    Thank you for your order!
    Close Browser
    

