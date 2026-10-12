*** Settings ***
Documentation       Cenários de testes de pré-cadastro de clientes

Library      Browser

Resource    ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000
    Get Text       css=#signup h2   equal    Faça seu cadastro e venha para a Smartbit!

    Fill Text      id=name        ${account}[name]
    Fill Text      id=email       ${account}[email]
    Fill Text      id=document    ${account}[document]
    Click          text=//button[text()="Cadastrar"]

    Wait For Elements State    text=Falta pouco para fazer parte da familia Smartbit!    visible    5


