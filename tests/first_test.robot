*** Settings ***
Library   SeleniumLibrary

*** Variables ***
*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]
${CARD_COLABORADOR}       class:colaborador

*** Test Cases ***
Verify if the informations are input correctly
    Given I access the Organo website
    And I input the informations on form
    When I click on Create card button
    Then The new card is created

*** Keywords ***
Given I access the Organo website
    Open Browser    url=${URL}         browser=Chrome

And I input the informations on form
    Input Text       ${CAMPO_NOME}        Thata
    Input Text       ${CAMPO_CARGO}       QA
    Input Text       ${CAMPO_IMAGEM}      https://picsum.photos/200/300 
    Click Element    ${CAMPO_TIME} 
    Click Element    ${OPCAO_PROGRAMACAO} 

When I click on Create card button
    Click Element    ${BOTAO_CARD}  

Then The new card is created
    Element Should Be Visible    ${CARD_COLABORADOR}