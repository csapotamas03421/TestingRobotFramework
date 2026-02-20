1. Kosár funkcionalitás
    Több termék hozzáadása
    Termék eltávolítása a kosárból
    Kosár tartalmának ellenőrzése
---------------------------------------
1. Shopping cart functionality
    Add multiple products
    Remove products from the shopping cart
    Check the contents of the shopping cart

*** Settings ***
Library    Selenium2Library


*** Test Cases ***
Open SauceDemo
    Succes Login

    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Contain    class:shopping_cart_badge    3

    Click Element    class:shopping_cart_link
    ${count_items}=    Get Element Count    class:cart_item
    Should Be Equal As Numbers    ${count_items}    3
    Sleep    2s
    
    Remove Products

   
  

*** Keywords ***
Succes Login
    Open Browser    https://www.saucedemo.com/    google chrome
    Input Text    id=user-name    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep    2s


Check The Number Of Elements
    [Arguments]    ${expected_counts}
    ${count_items}=    Get Element Count    class:cart_item
    Should Be Equal As Numbers    ${count_items}    ${expected_counts}


Remove Products
    Click Element    //*[@id="remove-sauce-labs-backpack"]
    Click Element    //*[@id="remove-sauce-labs-bike-light"]

    ${count_remaining_items}    Get Element Count    class:cart_item
    Should Be Equal As Numbers    ${count_remaining_items}    1 
    Sleep    2s
    Close Browser
     


   