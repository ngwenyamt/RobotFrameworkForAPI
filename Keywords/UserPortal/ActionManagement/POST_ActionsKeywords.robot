*** Settings ***

Library                                                     RequestsLibrary
#Library                                                    JSONLibrary
Library                                                     Selenium2Library
Library                                                     Collections
Library                                                     ../../../../ESG/Keywords/UserDefinedKeywords/UserDefinedKeywords.py
Library                                                     DateTime

*** Variables ***

${Relative_Path} =                                          /api/Action
${User_id}=                                                 53908607-5bdc-42c6-c95f-08d98cce1a76
${Description_with_1001_cahr}                               SqAjzjIGkEqYXkr4n7jcv0hhT2Dur30nyN2NvKlzycPSVUeTJOVtTsJCA3wZlBIXJsqEVOr2R1MZc1gGKQBnWvdNZJMgTaQEckT40hOxDxRifuDEdOXqCxfQaUktdsULXZSebFiavmsBDb1gcR8pNTvAaA38dbRohdsG2k8RRQ3sgUMkv2Ogr5JBLjalsBFBhYkGbxXsgnGPT9Cohta8LQIM7FTRXV1VPw31yr4FszRQjrAt8K2rLL24avs0E8iCnfOK0SZcy3bjLW929edk71B9XGw6C8LDWI9qsWqaECYHm4gxVcW9GcQmfctH8mzmbOri0I7TUKLrUONj7ddsY3G9itbJtb3zoTaCqxDWPrWFcZETdJKbvjZXVqu3JuidudKvlu01yuBLgQvuy1xx8JQwCZ8NoNM3WqOwjDfKdhWdzjV598S2aMUQ52fnib7z0T73M6pkAKU5Z331g7q3fQcmeSKg3VDqmHWHi1zthDVyNcAjQ12egOP0GrBnv0pqTX5E4CcodlXt2oaO21BtXFrhxQfQl6kVHw5BYerwRYJyZOLbdAH3anyoKTJ1pkJ4j9BNbwEG5GKuX6pxFQwiGs4FtuNiLVWDZwN9wnOtJnqxV5I4i7R1JVn7XVUT8oK7Pz99MEw2YZt6rtOZ9xHkElGFzGL4DZ1eexl5T9CHyIJ2UHw5SKhGqxhfwlswJoMINRHhgWxYfkiVJWDkdgDoJAfiMnQw3EoJBENrLqdMGQ2p4b3sPP2oTKCaLBQSE8DiSC5Tp2mKRELZaS8SFUeFc1LL4t3DIgHrVIXfD5l1F2ydSBAMO5DB6V8EExd49IRNtcB6XTVbv7UfvhaXWQ3B9L5NmV8ZFLRdTD9JEXHKOPoI9fyyDuhRB3rz5MeKIbXMdLf0jWvjP7xOq9wHW19xJIorteCfxCC19ZkEe0FkoywsORbVnLzDtnJvXPQlBlVM3UTgxxHZqraQOMrJdnjuQcemV6s8DMCYBTLt5m0tb
${Description_with_1000_cahr}                               SqAjzjIGkEqYXkr4n7jcv0hhT2Dur30nyN2NvKlzycPSVUeTJOVtTsJCA3wZlBIJsqEVOr2R1MZc1gGKQBnWvdNZJMgTaQEckT40OxDxRifuwDEdOXqCxfQaUktdsULXZSebFiavmsBDb1gcR8pNTvAaA38dbRohdsG2k8RRQ3sgUMkv2Ogr5JBLjalsBFBhYkGbxXsgnGPT9Cohta8LQIM7FTRXV1VPw31yr4FszRQjrAt8K2rLL24avs0E8iCnfOK0SZcy3bjLW929edk71B9XGw6C8LDWI9qsWqaECYHm4gxVcW9GcQmfctH8mzmbOri0I7TUKLrUONj7ddsY3G9itbJtb3zoTaCqxDWPrWFcZETdJKbvjZXVqu3JuidudKvlu01yuBLgQvuy1xx8JQwCZ8NoNM3WqOwjDfKdhWdzjV598S2aMUQ52fnib7z0T73M6pkAKU5Z331g7q3fQcmeSKg3VDqmHWHi1zthDVyNcAjQ12egOP0GrBnv0pqTX5E4CcodlXt2oaO21BtXFrhxQfQl6kVHw5BYerwRYJyZOLbdAH3anyoKTJ1pkJ4j9BNbwEG5GKuX6pxFQwiGs4FtuNiLVWDZwN9wnOtJnqxV5I4i7R1JVn7XVUT8oK7Pz99MEw2YZt6rtOZ9xHkElGFzGL4DZ1eexl5T9CHyIJ2UHw5SKhGqxhfwlswJoMINRHhgWxYfkiVJWDkdgDoJAfiMnQw3EoJBENrLqdMGQ2p4b3sPP2oTKCaLBQSE8DiSC5Tp2mKRELZaS8SFUeFc1LL4t3DIgHrVIXfD5l1F2ydSBAMO5DB6V8EExd49IRNtcB6XTVbv7UfvhaXWQ3B9L5NmV8ZFLRdTD9JEXHKOPoI9fyyDuhRB3rz5MeKIbXMdLf0jWvjP7xOq9wHW19xJIorteCfxCC19ZkEe0FkoywsORbVnLzDtnJvXPQlBlVM3UTgxxHZqraQOMrJdnjuQcemV6s8DMCYBTLt5m0tb
${Priority}=                                                High
${Status}=                                                  ToDo
${time}=                                                    T09:43:13.931Z
${Description}                                              My Action


*** Keywords ***
#***********************************************************NEGATIVE SCENARIOS**************************************************************************************************

POST request where the standalone description contains 1001 characters
    [Documentation]                                           POST request where the standalone description contains 1001 characters
    sleep                                                     2
    #Get Current Date
    ${StartDate}=              get current date               result_format=%Y-%m-%d
    #Get Future Date
    ${DueDate}=                Get Current Date               result_format=%Y-%m-%d   increment=2day

    ${body} =   create dictionary    description=${Description_with_1001_cahr}        priority=${Priority}       Status=${Status}     startDate=${StartDate}       dueDate=${DueDate}      userId=${User_id}
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 201 or not
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      400
    log to console                                            POST request where the standalone description contains 1001 characters was successful

POST request where the standalone action description is blank
    [Documentation]                                         POST request where the standalone action description is blank
    sleep                                                     2
    #Get Current Date
    ${StartDate}=              get current date               result_format=%Y-%m-%d
    #Get Future Date
    ${DueDate}=                Get Current Date               result_format=%Y-%m-%d   increment=2day

    ${body} =   create dictionary    description=        priority=${Priority}       Status=${Status}     startDate=${StartDate}       dueDate=${DueDate}      userId=${User_id}
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 201 or not
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      400
    log to console                                            POST request where the standalone action description is blank was successful

#***********************************************************POSITIVE SCENARIOS**************************************************************************************************
POST request where the standalone action is valid
    [Documentation]                                           POST request where the standalone action is valid
    sleep                                                     2
    #Get Current Date
    ${StartDate}=              get current date               result_format=%Y-%m-%d
    #Get Future Date
    ${DueDate}=                Get Current Date               result_format=%Y-%m-%d   increment=2day

    ${email_with_100_char}=                                   generate_email
    ${body} =   create dictionary    description=${Description_with_1000_cahr}        priority=${Priority}       Status=${Status}     startDate=${StartDate}       dueDate=${DueDate}      userId=${User_id}
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 201 or not
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      201
    log to console                                            POST request where the standalone action is valid was successful


#    #STEP 2: Gets the resource version and the user id from the responds data
#    ${response_data}=    Evaluate                             json.loads("""${response.content}""")    json
#    ${get_action_id}=    Set Variable                         ${response_data['id']}
#    ${get_action_resource_version}=    Set Variable           ${response_data['resourceVersion']}
#
#
#    #STEP 3: Delete the user created above
#    ${delete_body} =   create dictionary       id=${get_action_id}        resourceVersion=${get_action_resource_version}
#    #Call the method "delete requests by id" to Request and to get the response           NOTE: The delete requests by id method expects 2 aurguments(relative path, body)
#    ${response3}=  delete requests by id                       ${Relative_Path}                               ${delete_body}
#
#    #STEP 4
#    #Validate if the status is 204 or not (204 means success)
#    ${status_code}=     convert to string                     ${response3.status_code}
#    should be equal       ${status_code}                      204
#    log to console                                            Delete request by valid action id and it's resource version created above was successful

POST request where the standalone action is missing a responsible user
    [Documentation]                                           POST request where the standalone action is missing a responsible user
    sleep                                                     2
    #Get Current Date
    ${StartDate}=              get current date               result_format=%Y-%m-%d
    #Get Future Date
    ${DueDate}=                Get Current Date               result_format=%Y-%m-%d   increment=2day

    ${body} =   create dictionary    description=${Description_with_1000_cahr}        priority=${Priority}       Status=${Status}     startDate=${StartDate}       dueDate=${DueDate}      userId=
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 201 or not
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      201
    log to console                                            POST request where the standalone action is missing a responsible user was successful



