*** Settings ***
Resource                ../Library/lib.robot
Library    String

*** Variables ***
${element}                css:.content-block.stick-to-footer



*** Test Cases ***
Test Case 1
    Open Browser                                https://elementalselenium.com/               Chrome
    Maximize Browser Window                     
    Select Window
    

*** Keywords ***
Select Window
    Click Element    ${Test-2}[h-link]
    Switch Window    NEW
    Element Text Should Be    ${Test-2}[el]    The Tips
Getting text    
    ${paragraph}=    Get Text    ${Test-2}[paragraph] 
    ${split}=    Split String    ${paragraph}    file
    ${text-split}=    Get From List    ${paragraph}    1
    Log    ${text-split}

    
        

        
        

    
