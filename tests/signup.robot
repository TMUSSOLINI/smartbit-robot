*** Settings ***
Documentation       Cenários de testes de pré-cadastro de clientes

Library      Browser


*** Test Cases ***
Deve iniciar o cadastro do cliente
    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000
    Get Text       css=#signup h2   equal    Faça seu cadastro e venha para a Smartbit!
    

