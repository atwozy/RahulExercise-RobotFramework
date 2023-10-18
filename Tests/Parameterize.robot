*** Settings ***
#Test Setup    Open first browser
Test Setup    Open second browser
Test Teardown    Close Browser
Test Template    Test Case 1
Resource                ../Library/lib.robot


*** Test Cases ***    username    password
Valid credentials    ${dd-username}    ${dd-password}    
Invalid username    2345678    ${dd-password}
Invalid Password    ${dd-username}   asdfg 
Characters          @#$%^&%^       @#$%^&

*** Keywords ***
Test Case 1
    [Arguments]    ${username}    ${password}
    Maximize Browser Window
    Login to the browser    ${username}    ${password}
    

*** Keywords ***
Login to the browser
    [Arguments]    ${username}    ${password}
    Input Text    ${T3}[username]   ${username} 
    Input Text    ${T3}[pass]    ${password}
    Click Element    ${T3}[lg-btn]