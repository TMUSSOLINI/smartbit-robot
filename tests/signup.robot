*** Settings ***
Documentation       Cenários de testes de pré-cadastro de clientes

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    Submit signup form    ${account}
    Verify welcome message
    
Campo nome deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=thiago@thiago.com
    ...    cpf=12345678990

    Submit signup form    ${account}
    Notice should be    Por favor informe o seu nome completo

Campo email deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Thiago muss
    ...    email=${EMPTY}
    ...    cpf=12345678990

    Submit signup form    ${account}
    Notice should be    Por favor informe o seu melhor email

Campo cpf deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Thiago Muss
    ...    email=thiago@thiago.com
    ...    cpf=${EMPTY}

    Submit signup form    ${account}
    Notice should be    Por favor informe o seu CPF

Email no formato incorreto
    [Tags]    invalido

    ${account}    Create Dictionary
    ...    name=Thiago Muss
    ...    email=thiago*thiago.com
    ...    cpf=12345678990

    Submit signup form    ${account}
    Notice should be    Oops! O email informado é invalido

CPF no formato incorreto
    [Tags]    invalido

    ${account}    Create Dictionary
    ...    name=Thiago Muss
    ...    email=thiago@thiago.com
    ...    cpf=1234567899a

    Submit signup form    ${account}
    Notice should be   Oops! O CPF informado é invalido
