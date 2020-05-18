***Settings***
Documentation           BasePage
...                     Representa a inicialização do Selenium e demais cursos como ganchos e helpers



***Variables***
${base_url}         http://pixel-web:3000


***Keywords***
##Hooks
Open Session
    Open Chrome
    ##Redefine o tamanho do browser
    Set Window size     1440    900
    ##Redefine o padrão geral de tempo de aguardar elemento do Selenium
    Set Selenium Implicit Wait  5 

Login Session
    [Arguments]     ${email}    ${pass}
    Open Session
    #Criado uma .robot para fazer login, escondendo a função (encapsulamento) uma Keywords especial - PageObject
    Login With  ${email}    ${pass}
#    Go To       http://pixel-web:3000/login

#    Input Text      id:emailId      ${email}
#    Input Text      id:passId       ${pass}
#    Click Element   xpath://button[text()="Entrar"]

Close Session
    Close Browser

Clear Local Storage
    Execute Javascript                  localStorage.clear();

After Test
    Capture page Screenshot

##Helpers
Open Chrome
    Open Browser        ${base_url}    Chrome     options=add_experimental_option('excludeSwitches', ['enable-logging'])
