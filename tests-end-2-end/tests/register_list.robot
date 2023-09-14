*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/register.robot
Test Setup      Open the browser
Test Teardown   Close the browser


*** Test Cases ***
Verify if is possible create more than 1 card
    Given I input the informations on form
    And I click on Create card button
    Then Identify 3 cards on group

Verify if is possible create 1 card for each group
    Given I input the informations on form
    Then create and identify 1 card in each group

