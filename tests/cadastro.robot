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
    
***Keywords***
Dado que eu tenho um novo produto
    [Arguments]     ${json_file}
    #Gurda o arquivo em uma variavel string
    ${string_file}=     Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ##Transforma o arquivo de string em json
    ${product_json}=    Evaluate    json.loads($string_file)    json
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