*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary
Resource        ../setup_teardown.robot
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

*** Keywords ***
Given I input the informations on form
    ${Name}          FakerLibrary.First Name    # robotcode: ignore
    ${Job}           FakerLibrary.Job    # robotcode: ignore
    ${Image}         FakerLibrary.Image Url    # robotcode: ignore

    Input Text       ${INPUT_NAME}      ${Name}
    Input Text       ${INPUT_JOB}       ${Job}
    Input Text       ${INPUT_IMAGE}     ${Image}
    Click Element    ${LIST_GROUP} 
    Click Element    ${OPTION_PROGRAMACAO} 

When I click on Create card button
    Click Element    ${BUTTON_CARD}  

Then The new card is created
    Element Should Be Visible    ${CARD_COLABORADOR}