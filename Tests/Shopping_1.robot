*** Settings ***
Resource    ../Library/lib.robot
Suite Setup    Open shop site
Variables    ../Variables/variable.yaml


*** Test Cases *** 
Add different clothes
    Select sizes
    Select products

*** Keywords ***
Select sizes
    @{List_Sizes}=    Create List    M  L  
    ${web_elements}=    Get WebElements    ${Shopping}[sizes]
    ${count}=    Set Variable    1

    FOR    ${element}    IN    @{web_elements}
        FOR    ${size}    IN    @{List_Sizes}
            IF    '${element.text}' == '${size}'
            Click Element    xpath=//*[@class='sc-bj2vay-1 hcyKTa'][${count}]/label/span
            END 
        END
        ${count}=    Evaluate    ${count}+1
    END

Select products
    Sleep    00:05
    #Wait Until Element Is Visible   ${Shopping}[products]    timeout=5s
    @{List_products}=    Create List    Cropped Stay Groovy off white    Blue T-Shirt    Grey T-shirt
    ${web_products}=    Get WebElements    ${Shopping}[products]
    ${count}=    Set Variable    1
    
    FOR    ${element}    IN    @{web_products}
        FOR    ${prod}    IN    @{List_products}
            IF    '${element.text}' == '${prod}'
                Click Element   xpath=//div[@class='sc-uhudcz-0 iZZGui']/div[${count}]/button
            END
        END
        ${count}=    Evaluate    ${count}+1
    END