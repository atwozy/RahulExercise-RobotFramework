*** Settings ***
Library    SeleniumLibrary
Variables    ../Variables/variable.yaml

*** Variables ***
${s-size}    S
${s-add}    Add to cart
${c-count}    0

*** Keywords ***
Open shop site
    Open Browser    https://react-shopping-cart-67954.firebaseapp.com/    Chrome
    Maximize Browser Window