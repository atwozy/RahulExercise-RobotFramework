*** Settings ***
Library                  SeleniumLibrary 
Library                  Collections 
Library                  String
Variables                ..//Variables/vars.yaml

*** Variables ***
${dd-username}    standard_user
${dd-password}    secret_sauce

*** Keywords ***
Open first browser
    Open Browser    https://spreecommerce.org/    Chrome

Open second browser
    Open Browser    https://www.saucedemo.com/    Chrome
