***Settings***
Documentation       Aqui teremos todas as palavras de ação dos testes automatizados

Library     SeleniumLibrary
#Importa a funcionalidade de PageObject
Resource    Pages/BasePage.robot
Resource    Pages/SideBar.robot
Resource    Pages/LoginPage.robot

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