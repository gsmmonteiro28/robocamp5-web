***Settings***
Documentation       Cadastro de produtos
...                 Sendo um administrador do catálogo
...                 Quero cadastrar novos produtos
...                 Para que eu possa disponibiliza-los na loja virtual

Library             OperatingSystem
Resource            ../resources/actions.robot

Suite Setup         Login Session   papito@ninjapixel.com   pwd123
Suite Teardown      Close Session
Test Teardown       After Test



***Test Cases***
Novo produto
    Dado que eu tenho um novo produto       dk.json
    Quando eu cadastro este produto
    Então devo ver esse item na lista
    
***Keywords***
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

Quando eu cadastro este produto
    Wait Until Element Is Visible   class:product-add
    Click Element                   class:product-add

    Input Text      css:input[placeholder$="produto?"]  ${product_json['title']}
    #seleciona o campo categoria
    Click Element   css:input[placeholder^="Gat"]

    Wait Until Element Is Visible       xpath://li//span[text()="${product_json['cat']}"]
    #seleciona o item dentro do campo categoria
    Sleep   4
    Click Element                      xpath://li//span[text()="${product_json['cat']}"]

    Input Text      css:input[name=price]       ${product_json['price']} 

    Click Element       id:create-product

Então devo ver esse item na lista
    Table Should Contain        class:table      ${product_json['title']}


    Sleep   2