*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../BaseTest/baseUrl.py

*** Test Cases ***

TC_003_NotNullControlTotal_Pages_Page_limit
    Create Session          Get_Users            ${Base_URL}
    ${response}=            GET On Session       Get_Users                public/v1/users
    ${json_response}=       set variable         ${response.json()}
    ${total}=               Get value from JSON  ${json_response}         meta.pagination.total
    ${pages}=               Get value from JSON  ${json_response}         meta.pagination.pages
    ${page}=                Get value from JSON  ${json_response}         meta.pagination.page
    ${limit}=               Get value from JSON  ${json_response}         meta.pagination.limit
    Should Not Be Empty     ${total}
    Should Not Be Empty     ${pages}
    Should Not Be Empty     ${limit}
    Should Not Be Empty     ${page}

