*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../BaseTest/baseUrl.py

*** Test Cases ***

TC_002_Status200Test
    Create Session          Get_Users            ${Base_URL}
    ${response}=            GET On Session       Get_Users                public/v1/users
    ${actual_code}=         convert to string    ${response.status_code}
    should be equal         ${actual_code}       200
    Log To Console          Response Code = ${actual_code}