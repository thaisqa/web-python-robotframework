*** Settings ***
Library   SeleniumLibrary


*** Test Cases ***
Open the browser and access the Organo website
    Open Browser    url=http://localhost:3000/    browser=Chrome

Input the informations on form
    Input Text       id:form-nome     Thata
    Input Text       id:form-cargo    QA
    Input Text       id:form-imagem   https://picsum.photos/200/300 
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Click Element    id:form-botao
    Element Should Be Visible    class:colaborador