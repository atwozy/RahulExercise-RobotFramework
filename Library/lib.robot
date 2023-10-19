*** Settings ***
Library                  SeleniumLibrary 
Library                  Collections 
Library                  String
Variables                ..//Variables/vars.yaml

*** Variables ***
${dd-username}    standard_user
${dd-password}    secret_sauce
${c-size}    S
${addToCart}    Add to cart
${message}    0

*** Keywords ***
Open first browser
    Open Browser    https://spreecommerce.org/    Chrome

Open second browser
    Open Browser    https://www.saucedemo.com/    Chrome

Open shop site
    Open Browser    https://react-shopping-cart-67954.firebaseapp.com/    Chrome
    Maximize Browser Window
