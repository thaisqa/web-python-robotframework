*** Settings ***
Library       SeleniumLibrary
Resource      ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/

*** Keywords ***
Open the browser
    Open Browser    url=${URL}         browser=Chrome

Close the browser
    Close Browser