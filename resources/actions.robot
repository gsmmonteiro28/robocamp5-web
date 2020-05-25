***Settings***
Documentation       Aqui teremos todas as palavras de ação dos testes automatizados

Library     OperatingSystem
Library     SeleniumLibrary
Library     Libs/database.py
#Importa a funcionalidade de PageObject
Resource    helpers.robot
Resource    Pages/BasePage.robot
Resource    Pages/SideBar.robot
Resource    Pages/LoginPage.robot
Resource    Pages/ProductPage.robot

***Keywords***
##Steps
Dado que acesso a página login
    Go To       ${base_url}/login
   
Quando eu submeto minhas credenciais "${email}" e "${pass}"
    LoginPage.Login With  ${email}    ${pass}
#    Input Text      id:emailId      ${email}
#    Input Text      id:passId       ${pass}
#    Click Element   xpath://button[text()="Entrar"]

Então devo ser autenticado
    Wait Until Element Is Visible       ${LOGGED_USER}
    Wait Until Element Contains         ${LOGGED_USER}     Papito

Então devo ver a mensagem de alerta "${expect_alert}"
    Wait Until Element Is Visible       ${DIV_ALERT}
    Wait Until Element Contains          ${DIV_ALERT}    ${expect_alert}

## Cadastro
Dado que eu tenho um novo produto
    [Arguments]     ${json_file}
    ##Transforma o arquivo de string em json
    ${product_json}=    Get Json Product   ${json_file}

    Remove Product By Title     ${product_json['title']}
    #Manter a variável ativa na memória até o final do teste Novo prodruto
    Set Test Variable       ${product_json}
    #Mantem a variável ativa na memória até o final da Swite de teste
    ##Set Swite Variable      ${product_json}
    #Variavel Global mantem o arquivo ativo todo o tempo (Sommente para RPA)
    ##Set Global Variable      ${product_json}

Mas esta produto já foi cadastrado
    Go To From
    Create new product      ${product_json}

Quando faço o cadastro desse produto
    Go To From
    Create new product      ${product_json}

Então devo ver esse item na lista
    Table Should Contain        class:table      ${product_json['title']}


Então devo ver a mensagem de alerta
    [Arguments]     ${expect_alert}
    Wait Until Element Contains         ${ALERT_DANGER}     ${expect_alert} 
    
##Exclusão
Dado que "${json_file}" é um produto indesejvel
##    Dado que eu tenho um novo produto       ${json_file}
##    Quando faço o cadastro desse produto
    ${product_json}=    Get Json Product   ${json_file}

    Remove Product By Title     ${product_json['title']}

    Go To From
    Create new product      ${product_json}
    #Manter a variável ativa na memória até o final do teste Novo prodruto
    Set Test Variable       ${product_json}

Qando solicito a exclusão
    Request Remove      ${product_json['title']}

E confirmo a solicitação
    Confirm Remove

Então não devo ver este item no catálogo
    Wait Until Element Does Not Contain     class:table        ${product_json['title']}

## Desistir da exclusão
Dado que "${json_file}" é um produto desejvel
    
    ${product_json}=    Get Json Product   ${json_file}

    Remove Product By Title     ${product_json['title']}

    Go To From
    Create new product      ${product_json}
    #Manter a variável ativa na memória até o final do teste Novo prodruto
    Set Test Variable       ${product_json}

Quando solicito a exclusão
    Request Remove      ${product_json['title']}

Mas cancelo a solicitação
    Cancel Remove

Então devo ver este item no catálogo
    Wait Until Element Contains      class:table        ${product_json['title']}