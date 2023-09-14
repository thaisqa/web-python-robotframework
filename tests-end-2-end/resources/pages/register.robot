*** Settings ***
Resource    ../main.robot

*** Variables ***
${INPUT_NAME}             id:form-nome
${INPUT_JOB}              id:form-cargo
${INPUT_IMAGE}            id:form-imagem
${LIST_GROUP}             class:lista-suspensa
${BUTTON_CARD}            id:form-botao

@{select_time}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')] 
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação e Gestão')]

${BUTTON_CARD}             id:form-botao

${OPTION_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPTION_FRONT}            //option[contains(.,'Front-End')]
${OPTION_DADOS}            //option[contains(.,'Data Science')]
${OPTION_DEVOPS}           //option[contains(.,'Devops')] 
${OPTION_UX}               //option[contains(.,'UX e Design')]
${OPTION_MOBILE}           //option[contains(.,'Mobile')]
${OPTION_INOVACAO}         //option[contains(.,'Inovação e Gestão')]
${CARD_COLABORADOR}       class:colaborador


*** Keywords ***
 Given I input the informations on form
    ${Name}          FakerLibrary.First Name    # robotcode: ignore
    ${Job}           FakerLibrary.Job    # robotcode: ignore
    ${Image}         FakerLibrary.Image Url    # robotcode: ignore

    Input Text       ${INPUT_NAME}      ${Name}
    Input Text       ${INPUT_JOB}       ${Job}
    Input Text       ${INPUT_IMAGE}     ${Image}
    Click Element    ${LIST_GROUP} 
    Click Element    ${select_time}[0]

And I click on Create card button
     Click Element    ${BUTTON_CARD}

Then Identify 3 cards on group
    FOR    ${i}    IN RANGE    1    3    
        Given I input the informations on form
        And I click on Create card button
    END

Then create and identify 1 card in each group
    FOR    ${indice}    ${time}    IN ENUMERATE    @{select_time}
        Given I input the informations on form
        Click Element    ${time}
        And I click on Create card button
        
    END

Given I click on Create card button
    Click Element    ${BUTTON_CARD}  

Then The error message is visible
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro

When I click on Create card button
    Click Element    ${BUTTON_CARD}  

Then The new card is created
    Element Should Be Visible    ${CARD_COLABORADOR}