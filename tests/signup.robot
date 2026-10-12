*** Settings ***
Documentation       Cenários de testes de pré-cadastro de clientes

Library      Browser

Resource    ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000
    Get Text
    ...    css=#signup h2
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text      id=name        ${account}[name]
    Fill Text      id=email       ${account}[email]
    Fill Text      id=document    ${account}[document]
    Click          text=//button[text()="Cadastrar"]

    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da familia Smartbit!    
    ...    visible    
    ...    5

Campo nome deve ser obrigatorio
    [Tags]    required

    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000
    Get Text
    ...    css=#signup h2
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text      id=email       teste@teste.com
    Fill Text      id=document    12345678990
    Click          text=//button[text()="Cadastrar"]

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    
    ...    5

    Get Text    css=form .notice    equal    Por favor informe o seu nome completo

Campo email deve ser obrigatorio
    [Tags]    required

    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000
    Get Text
    ...    css=#signup h2
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text      id=name       Thiago muss
    Fill Text      id=document    12345678990
    Click          text=//button[text()="Cadastrar"]

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    
    ...    5

    Get Text    css=form .notice    equal    Por favor informe o seu melhor email

Campo cpf deve ser obrigatorio
    [Tags]    required

    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000
    Get Text
    ...    css=#signup h2
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text      id=email       teste@teste.com
    Fill Text      id=name        Thiago Muss
    Click          text=//button[text()="Cadastrar"]

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    
    ...    5

    Get Text    css=form .notice    equal    Por favor informe o seu CPF

Email no formato incorreto
    [Tags]    invalido

    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000
    Get Text
    ...    css=#signup h2
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text      id=email       teste*teste.com
    Fill Text      id=name        Thiago Muss
    Fill Text      id=document    12345678990
    Click          text=//button[text()="Cadastrar"]

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    
    ...    5

    Get Text    css=form .notice    equal    Oops! O email informado é invalido

CPF no formato incorreto
    [Tags]    invalido

    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000
    Get Text
    ...    css=#signup h2
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text      id=email       teste@teste.com
    Fill Text      id=name        Thiago Muss
    Fill Text      id=document    1234567899a
    Click          text=//button[text()="Cadastrar"]

    Wait For Elements State    
    ...    css=form .notice   
    ...    visible    
    ...    5

    Get Text    css=form .notice    equal    Oops! O CPF informado é invalido
