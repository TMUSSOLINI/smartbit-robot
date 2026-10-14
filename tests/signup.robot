*** Settings ***
Documentation       Cenários de testes de pré-cadastro de clientes

Library      Browser

Resource    ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    Start session
    Submit signup form    ${account}


    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da familia Smartbit!    
    ...    visible    
    ...    5

Campo nome deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=thiago@thiago.com
    ...    cpf=12345678990

    Start session
    Submit signup form    ${account}

    Notice should be    Por favor informe o seu nome completo

Campo email deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Thiago muss
    ...    email=${EMPTY}
    ...    cpf=12345678990

    Start session
    Submit signup form    ${account}

    Notice should be    Por favor informe o seu melhor email

Campo cpf deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Thiago Muss
    ...    email=thiago@thiago.com
    ...    cpf=${EMPTY}

    Start session
    Submit signup form    ${account}

    Notice should be    Por favor informe o seu CPF

Email no formato incorreto
    [Tags]    invalido

    ${account}    Create Dictionary
    ...    name=Thiago Muss
    ...    email=thiago*thiago.com
    ...    cpf=12345678990

    Start session
    Submit signup form    ${account}

    Notice should be    Oops! O email informado é invalido

CPF no formato incorreto
    [Tags]    invalido

    ${account}    Create Dictionary
    ...    name=Thiago Muss
    ...    email=thiago@thiago.com
    ...    cpf=1234567899a

    Start session
    Submit signup form    ${account}

    Notice should be   Oops! O CPF informado é invalido 
  

*** Keywords ***

Start session
    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000

Submit signup form
    [Arguments]    ${account}
    Get Text
    ...    css=#signup h2
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text      id=name        ${account}[name]
    Fill Text      id=email       ${account}[email]
    Fill Text      id=document    ${account}[document]
    Click          text=//button[text()="Cadastrar"]
    
Notice should be
    [Arguments]    ${target}

    ${element}    Set Variable    css=form .notice 
    Wait For Elements State    
    ...      ${element}
    ...    visible    
    ...    5

    Get Text    ${element}    equal    ${target}
