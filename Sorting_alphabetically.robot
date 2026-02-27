*** Settings ***
Library    Selenium2Library
Library    Collections
Resource    Login_Keywords.robot

*** Test Cases ***
    #2. Rendezési opciók
    #A–Z rendezés
    #Z–A rendezés
    #Ár szerint növekvő
    #Ár szerint csökkenő

Sorting Z to A
    Login with valid user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${product_names}=    Get All Product names
    Verify Z to A    ${product_names}


*** Keywords ***
Get All Product names
    ${products}=    Create List
    @{product_elements}=    Get WebElements    class:inventory_item_name 
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN    @{products}

Verify Z to A
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}=    Get From List    ${product_names}    ${index}
        ${next}=    Get From List    ${product_names}    ${index+1}

        Should Be True    '${current}' >= '${next}'    Products is not Z to A order: current is ${current} and next is ${next}
    END
    
      

