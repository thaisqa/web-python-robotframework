*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/register.robot
Test Setup      Open the browser
Test Teardown   Close the browser

*** Test Cases ***
Verify if the informations are input correctly
    Given I click on Create card button
    Then The error message is visible

