***Settings***
Documentation   Login
...             Sendo um administrador de catálogo
...             Quero me autenticar no sistema
...             Para que eu possa gerenciar os produtos da loja virtual


Resource            ../resources/actions.robot

Suite Setup         Open Session
Suite Teardown      Close Session
Test Teardown       After Test

***Test Cases***
Usuário autenticado
    [Tags]  Sucesso_test
    Dado que acesso a página login
    Quando eu submeto minhas credenciais "papito@ninjapixel.com" e "pwd123"
    Então devo ser autenticado

    [Teardown]  Clear Local Storage

Senha invalida
    [Template]      Testativa de Login
    papito@ninjapixel.com       abc123      Usuário e/ou senha inválidos

Email não cadastrado
    [Template]      Testativa de Login
    papito@ninjapixel.com.br        pwd123      Usuário e/ou senha inválidos

Email incorreto
    [Template]      Testativa de Login
    papito#ninjapixel.com.br        pwd123      Usuário e/ou senha inválidos

Email não informado
    [Template]      Testativa de Login
    ${EMPTY}        pwd123      Opps. Informe o seu email!
    
Senha não informada
    [Template]      Testativa de Login
    papito@ninjapixel.com       ${EMPTY}       Opps. Informe a sua senha!

***Keywords***
Testativa de Login
    [Arguments]     ${imput_email}      ${imput_pass}       ${output_text}
    
    Dado que acesso a página login
    Quando eu submeto minhas credenciais "${imput_email}" e "${imput_pass}"
    Então devo ver a mensagem de alerta "${output_text}" 
