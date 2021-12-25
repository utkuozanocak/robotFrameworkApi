*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../BaseTest/baseUrl.py

*** Test Cases ***

TC_001_NotNullResponseControl
    Create Session          Get_Users            ${Base_URL}
    ${response}=            GET On Session       Get_Users                public/v1/users
    ${json_response}=       set variable         ${response.json()}
    Should Not Be Empty     ${json_response}