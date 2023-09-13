*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:3000/

*** Keywords ***
Open the browser
    Log To Console    START TESTS
    Open Browser    url=${URL}         browser=Chrome

Close the browser
    Close Browser
    Log To Console    FINISHED TESTS