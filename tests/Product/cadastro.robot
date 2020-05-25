***Settings***
Documentation       Cadastro de produtos
...                 Sendo um administrador do catálogo
...                 Quero cadastrar novos produtos
...                 Para que eu possa disponibiliza-los na loja virtual

Resource            ../../resources/actions.robot

Suite Setup         Login Session   papito@ninjapixel.com   pwd123
Suite Teardown      Close Session
Test Teardown       After Test



***Test Cases***
Novo produto
    [Tags]      new_product
    Dado que eu tenho um novo produto       dk.json
    Quando faço o cadastro desse produto
    Então devo ver esse item na lista
    
Produto Duplicar
    [Tags]      Dup
    Dado que eu tenho um novo produto  master.json
    Mas esta produto já foi cadastrado
    Quando faço o cadastro desse produto
    Então devo ver a mensagem de alerta     Oops - Este produto já foi cadastrado!
