***Settings***
Documentation       Exclusão de produtos
...                 Sendo um administrador do catálogo que possuo produtos indesejados
...                 Quero deleter esse produtos
...                 Para que eu possa manter meu catálogo organizado

Resource            ../../resources/actions.robot

Suite Setup         Login Session   papito@ninjapixel.com   pwd123
Suite Teardown      Close Session
Test Teardown       After Test

***Test Cases***
Apagar produtos
    [Tags]      delete_product
    Dado que "mario.json" é um produto indesejvel
    Qando solicito a exclusão
    E confirmo a solicitação
    Então não devo ver este item no catálogo

Desistir da remoção
    [Tags]      cancel_delete
    Dado que "zelda.json" é um produto desejvel
    Quando solicito a exclusão
    Mas cancelo a solicitação
    Então devo ver este item no catálogo