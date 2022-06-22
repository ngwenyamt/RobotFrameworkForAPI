*** Settings ***

Library                                                     RequestsLibrary
#Library                                                    JSONLibrary
Library                                                     Selenium2Library
Library                                                     Collections
Library                                                     ../../../../ESG/Keywords/UserDefinedKeywords/UserDefinedKeywords.py

*** Variables ***

${Relative_Path} =                                          /api/User
${Relative_Path_ImportTemplate}                             /api/User/ImportTemplate
${User_id}=                                                 53908607-5bdc-42c6-c95f-08d98cce1a76
${Invalid_User_id}=                                         my user id

*** Keywords ***

#***********************************************************NEGATIVE SCENARIOS**************************************************************************************************
GET request by invalid action id
    [Documentation]                                         GET request by invalid action id
    sleep                                                   2
    #Call the method "get requests by id" to Request and to get the response           NOTE: The get requests by id method expects 2 aurguments(relative path, actionid)
    ${response}=  get requests by id                         ${Relative_Path}                               ${Invalid_User_id}

    #STEP 1
    #Validate if the status is 404 or not
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     404
    log to console                                           GET request by invalid user id was successful