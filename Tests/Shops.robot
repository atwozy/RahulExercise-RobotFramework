*** Settings ***
Resource    ../Library/lib.robot
Suite Setup    Open shop site

*** Test Cases ***
Add all small sizes
    Add Small Products    ${c-size}    ${addToCart}
    Close cart  
    Verify empty cart    ${message}

*** Keywords ***
Add Small Products
    [Arguments]    ${size}    ${bt}
    ${sizes}=    Get WebElements    ${Shops}[small]
    ${count}=    Set Variable    1

#Select 'Small' Sizes
    FOR    ${element}    IN    @{sizes}
        Exit For Loop If    '${size}' == '${element.text}'
            ${count}=    Evaluate    ${count}+1
    END
    #Click Element    css:.sc-bj2vay-0.DCKcC>div:nth-child(${count})>label>span
    Click Element    //*[@class='sc-bj2vay-1 hcyKTa'][${count}]/label/span

#Add all products to cart
    Sleep    00:03
    ${prod}=    Get WebElements    ${Shops}[products]
    ${count}=    Set Variable    1
    FOR    ${element}    IN    @{prod}
        IF    '${bt}' == '${element.text}'
            Click Element    css:.sc-uhudcz-0.iZZGui>div:nth-child(${count})>button
        END
        ${count}=    Evaluate    ${count}+1
    END     

Close cart
    #[Arguments]    ${remove}
    Sleep    00:03
    ${el}=    Get WebElements    ${Shops}[i-cart]
    ${el_length}=    Get Length    ${el}
    
    
    FOR    ${count}    IN RANGE    ${el_length + 1}
        ${count}=    Set Variable    1
        Click Element    //*[@class='sc-11uohgb-0 hDmOrM'][${count}]/button
        ${count}=    Evaluate    ${count}+1   
    END

Verify empty cart
    [Arguments]    ${label_display}
    Wait Until Element Is Visible    ${Shops}[empty]
    ${em}=    Get Text    ${Shops}[empty]
    Should Be Equal As Strings   ${em}    ${label_display}
    Log    ${em}
     
    

  



    

