*** Settings ***
Documentation    Suite de testes de adesões de planos

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realziar uma nova adesão
    
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    Go to Erolls
    Go to enroll form
    Select account    Thiago Mussolini    CPF

    Fill Text    css=input[aria-label=select_plan]    Plano Black
    Click    css=div[id*=option] >> text=Plano Black
    

*** Keywords ***

Go to Erolls
    Click    css=a[href="/memberships"]
    Wait For Elements State    css=h1 >> text=Matrículas
    ...    visible    5

Go to enroll form
    Click    css=a[href="/memberships/new"]
    Wait For Elements State    css=h1 >> text=Nova matrícula
    ...    visible    5

Select account
    [Arguments]    ${name}    ${cpf}

    Fill Text    css=input[aria-label=select_account]    ${name}
    Click    css=[data-testid="${cpf}"]