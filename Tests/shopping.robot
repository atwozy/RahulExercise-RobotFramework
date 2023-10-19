*** Settings ***
Resource    ../Library/lib.robot
Test Setup    Open shop site
   
*** Test Cases ***
Add small sizes
    Click small selection    S


*** Keywords ***
Click small selection
    [Arguments]    ${size}
    ${Web}=    Get WebElements    ${Shops}[small]
    ${count}=    Set Variable    1
    FOR    ${element}    IN    @{Web}
        Exit For Loop If    '${size}' == '${element.text}'
            ${count}=    Evaluate    ${count} + 1
    END
    Click Element    //*[@class='sc-bj2vay-1 hcyKTa'][${count}]/label/span

    
    
    