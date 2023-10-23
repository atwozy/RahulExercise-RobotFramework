*** Settings ***
Resource    ../Library/library.robot
Suite Setup   Open shop site


*** Test Cases ***
Shopping
    Select all small size items    ${s-size}    ${s-add}
    Remove selected items
    Verify empty cart and close it    ${c-count} 

    

*** Keywords ***
Select all small size items
    [Arguments]    ${size}    ${cart}
    ${get_sizes}=    Get WebElements    ${Shop}[small]
    ${count}=    Set Variable    1
    
    #Filter to small
    FOR    ${element}    IN    @{get_sizes}
        Exit For Loop If    '${element.text}' == '${size}'
        ${count}=    Evaluate    ${count}+1
    END
    Click Element    xpath=//*[@class='sc-bj2vay-1 hcyKTa'][${count}]/label/span
    
    #Add small items
    Sleep    00:01
    ${addToCart}=    Get WebElements    ${Shop}[add_cart]
    ${count}=    Set Variable    1

    FOR    ${element}    IN    @{addToCart}
        IF    '${element.text}' == '${cart}'
        Click Element    xpath=//div[@class='sc-uhudcz-0 iZZGui']/div[${count}]/button
        ${count}=    Evaluate    ${count}+1
        END
    END

Remove selected items
    Sleep    00:03
    ${get_btn}=    Get WebElements    ${Shop}[x_btn]
    ${el_length}=    Get Length    ${get_btn}
    
    #Remove item/s from cart
    FOR    ${counter}    IN RANGE    ${el_length}       
        ${count}=    Set Variable    1
        Click Element    xpath=//*[@class='sc-11uohgb-0 hDmOrM'][${count}]/button
        ${count}=    Evaluate    ${count}+1
    END

Verify empty cart and close it
    [Arguments]    ${cartCount}
    ${cart_counter}=    Get Text  ${Shop}[cart_counter]
    Log    ${cart_counter}
    Should Be Equal As Strings    ${cartCount}    ${cart_counter}
    Click Element    ${Shop}[c_btn]


