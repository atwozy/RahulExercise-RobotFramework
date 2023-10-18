*** Settings ***
#Test Setup    Open first browser
Test Setup    Open second browser
Test Teardown    Close Browser
Resource                ../Library/lib.robot


*** Test Cases ***
Test Case 1
    #Open Browser    https://spreecommerce.org/    Chrome
    Maximize Browser Window
    Verify List Element
Test Case 2
    #Open Browser    https://spreecommerce.org/    Chrome
    Maximize Browser Window
    Verify Element    Vue Storefront 2

Test Case 3
    #Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    Verify Login Error Message                Epic sadface: Password is required

Test Case 4
    #Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    Select Dropdown 
    

*** Keywords ***
Verify List Element
    @{expectedList}=    Create List    Next.js Commerce    Javascript/TypeScript SDK    Vue Storefront 2
    ${Web}=    Get WebElements    ${Gen}[web-l]
    ${actualList}=    Create List

    FOR    ${element}    IN    @{Web}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}
    Log    ${actualList}

Verify Element
    [Arguments]    ${vue}
    ${Web}=    Get WebElements    ${Gen}[web-l]
    ${count}=    Set Variable    1
    FOR    ${element}    IN    @{Web}
        Exit For Loop If    '${vue}' == '${element.text}'
            ${count}=    Evaluate    ${count} + 1
    END
    Execute JavaScript    window.scrollBy(0, 1000)
    Click Element    css:.vc_row.wpb_row.vc_row-fluid.uf-row.vc_custom_1631736222382>div>div>div>div>div:nth-child(${count})>div>div>h3>a

Verify Login Error Message
    [Arguments]        ${errormessage}
    Input Text    ${T3}[username]   ASDFG@gmail.com
    Click Element    ${T3}[lg-btn]
    Wait Until Element Is Visible    ${T3}[error-message]
    ${em}=    Get Text    ${T3}[error-message]
    Should Be Equal As Strings    ${em}    ${errormessage}

Select Dropdown
    Input Text    ${T3}[username]   ${dd-username}
    Input Text    ${T3}[pass]   secret_sauce
    Click Element    ${T3}[lg-btn]
    Wait Until Element Is Visible    ${T3}[logo]
    Select From List By Value    css:select.product_sort_container    lohi