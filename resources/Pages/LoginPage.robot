***Settings***
Documentation       LoginPage
...                 Representa a página login com todos os seus elementos
...                 É também suas funcionalidades


**Variables***
${DIV_ALERT}    class:alert

***Keywords***
Login With
    [Arguments]     ${email}        ${pass}

    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Click Element   xpath://button[text()="Entrar"]