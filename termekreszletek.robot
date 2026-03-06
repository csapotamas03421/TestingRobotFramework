*** Settings ***
Library    Selenium2Library
Library    Collections
Resource    Login_Keywords.robot

*** Test Cases ***
Item based on name
    Login with valid user

    ${item_name}=    Get Text    class:inventory_item_name
    Click Element    class:inventory_item_name
    Should Be Equal    ${item_name}    Sauce Labs Backpack

    ${item_description}=    Get Text    class=inventory_details_desc
    Should Not Be Empty    ${item_description}

    Click Element    //*[@id="back-to-products"]

    Sleep    2s
    Close Browser


Item based on image
    Login with valid user

    ${item_price}=    Get Text    class:inventory_item_price
    Click Element    class:inventory_item_img
    Should Be Equal    ${item_price}    $29.99

    Element Should Be Visible    class:inventory_details_img
    ${image_src}=    Get Element Attribute    css:.inventory_details_img    src
    Should Not Be Empty    ${image_src}

    Click Element    //*[@id="back-to-products"]

    Sleep    2s
    Close Browser
    

Checkout validation
    Login with valid user

    Click Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="shopping_cart_container"]/a
    ${current_url}=    Get Location
    Click Element    //*[@id="checkout"]


    ${long_name}=    Evaluate    "A" * 15
    Input Text    //*[@id="first-name"]    text=${long_name}
    Input Text    id=last-name    text=Tamas
    Input Text    id=postal-code    text=1234
    

    ${name_text}=    Get Text    id=first-name
    Should Match Regexp    ${name_text}    [A-Za-zÁÉÍÓÖŐÚÜŰáéíóöőúüű ] {10, 30}$    
    Sleep    3s


    Click Element    //*[@id="cancel"]
    Should Be Equal    ${current_url}    https://www.saucedemo.com/cart.html
    Sleep    3s
    Close Browser
    





