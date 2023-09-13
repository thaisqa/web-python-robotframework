*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary    # robotcode: ignore
Resource        ../setup_teardown.robot
Test Setup      Open the browser
Test Teardown   Close the browser

*** Variables ***
${INPUT_NAME}             id:form-nome
${INPUT_JOB}            id:form-cargo
${INPUT_IMAGE}           id:form-imagem
${LIST_GROUP}             class:lista-suspensa
${BUTTON_CARD}             id:form-botao

@{select_time}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')] 
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação e Gestão')]

${OPTION_PROGRAMACAO}    //option[contains(.,'Programação')]


*** Test Cases ***
Verify if is possible create more than 1 card
    Given I input the informations on form
    And I click on Create card button
    Then Identify 3 cards on group

Verify if is possible create 1 card for each group
    Given I input the informations on form
    Then create and identify 1 card in each group

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
