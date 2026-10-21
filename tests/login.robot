*** Settings ***

Documentation    Cenários de testes do Login SAC

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***

Deve logar como Gestor de Academia
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Não deve logar com senha incorreta
    Go to login page
    Submit login form    sac@smartbit.com    abc123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com email incorreto
    Go to login page
    Submit login form    404@smartbit.com    abc123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!
