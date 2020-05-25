***Settings***
Documentation       Tentativa de Cadastro de produtos
...                 Cenários de tentativa de cadastro com mesmo estilo de validação

Resource            ../../resources/actions.robot

Suite Setup         Login Session   papito@ninjapixel.com   pwd123
Suite Teardown      Close Session
Test Teardown       After Test

Test Template       Tentar cadastrar Produtos


***Test Cases***
Nome não informado          contra.json         Oops - Informe o nome do produto!
Categoria não selecionado   streetf2.json       Oops - Selecione uma categoria!
Preço não informado         shinobi.json        Oops - Informe o preço também!

***Keywords***
Tentar cadastrar Produtos    
    [Arguments]     ${json_file}        ${expect_mensage}

    Dado que eu tenho um novo produto       ${json_file} 
    Quando faço o cadastro desse produto
    Então devo ver a mensagem de alerta     ${expect_mensage}