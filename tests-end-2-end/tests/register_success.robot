*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/register.robot
Test Setup      Open the browser
Test Teardown   Close the browser

*** Variables ***
${INPUT_NAME}             id:form-nome
${INPUT_JOB}            id:form-cargo
${INPUT_IMAGE}           id:form-imagem
${LIST_GROUP}             class:lista-suspensa
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
    Given I input the informations on form
    When I click on Create card button
    Then The new card is created
