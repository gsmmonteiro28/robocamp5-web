***Settings***
Documentation       Aqui teremos todas as palavras de ação dos testes automatizados

Library     SeleniumLibrary
Library     Libs/database.py
#Importa a funcionalidade de PageObject
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
    #Gurda o arquivo em uma variavel string
    ${string_file}=     Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ##Transforma o arquivo de string em json
    ${product_json}=    Evaluate    json.loads($string_file)    json

    Remove Product By Title     ${product_json['title']}

    #Manter a variável ativa na memória até o final do teste Novo prodruto
    Set Test Variable       ${product_json}
    #Mantem a variável ativa na memória até o final da Swite de teste
    ##Set Swite Variable      ${product_json}
    #Variavel Global mantem o arquivo ativo todo o tempo (Sommente para RPA)
    ##Set Global Variable      ${product_json}

Quando faço o cadastro este produto
    Go To From
    Create new product      ${product_json}

Então devo ver esse item na lista
    Table Should Contain        class:table      ${product_json['title']}


    Sleep   2