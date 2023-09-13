*** Settings ***
Library         SeleniumLibrary
Resource        setup_teardown.robot
Test Setup      Open the browser
Test Teardown   Close the browser

*** Variables ***
${BUTTON_CARD}             id:form-botao

${OPTION_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPTION_FRONT}            //option[contains(.,'Front-End')]
${OPTION_DADOS}            //option[contains(.,'Data Science')]
${OPTION_DEVOPS}           //option[contains(.,'Devops')] 
${OPTION_UX}               //option[contains(.,'UX e Design')]
${OPTION_MOBILE}           //option[contains(.,'Mobile')]
${OPTION_INOVACAO}         //option[contains(.,'Inovação e Gestão')]
${CARD_COLABORADOR}       class:colaborador

*** Test Cases ***
Verify if the informations are input correctly
    Given I click on Create card button
    Then The error message is visible

*** Keywords ***
Given I click on Create card button
    Click Element    ${BUTTON_CARD}  

Then The error message is visible
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro