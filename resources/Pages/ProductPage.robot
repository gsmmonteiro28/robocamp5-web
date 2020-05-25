***Settings***
Documentation       ProductPage
...                 Representa a página de cadastro de produtos com todos os elementos
...                 E também suas funcionalidades

***Variables***
${PRODUCT_ADD}      class:product-add
${ALERT_DANGER}     class:alert-danger

***Keywords***
Go To From
    Wait Until Element Is Visible   ${PRODUCT_ADD}
    Click Element                   ${PRODUCT_ADD}

Select category
    [Arguments]     ${cat}
    Click Element   css:input[placeholder^="Gat"]
    Wait Until Element Is Visible       xpath://li//span[text()="${cat}"]
    #seleciona o item dentro do campo categoria
    Sleep   2
    Click Element                       xpath://li//span[text()="${cat}"]

Request Remove
    [Arguments]     ${title}
    
    Click Element       xpath://tr[td//text()[contains(., '${title}')]]//button

Confirm Remove
    Click Element       class:swal2-confirm

Cancel Remove
    Click Element       class:swal2-cancel
  
Create new product
    [Arguments]     ${product_json}

    Input Text      css:input[placeholder$="produto?"]  ${product_json['title']}
    #seleciona o campo categoria
    Select category     ${product_json['cat']}

    Input Text      css:input[name=price]       ${product_json['price']} 

    Click Element       id:create-product

    sleep       2