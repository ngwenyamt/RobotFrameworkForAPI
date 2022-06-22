*** Settings ***

Library                                                     RequestsLibrary
#Library                                                    JSONLibrary
Library                                                     Selenium2Library
Library                                                     Collections
Library                                                     ../../../../ESG/Keywords/UserDefinedKeywords/UserDefinedKeywords.py

*** Variables ***

${Relative_Path} =                                          /api/User
${User_id}=                                                 53908607-5bdc-42c6-c95f-08d98cce1a76
${Invalid_User_id}=                                         invalid user id
${Blank_User_id}
${Invalid_resource_version}                                 Invalid resource version
${Blank_resource_version}

*** Keywords ***

#***********************************************************NEGATIVE SCENARIOS**************************************************************************************************
Delete request by invalid user id and it's resource version
    [Documentation]                                          Delete request by invalid user id and it's resource version
    ${body} =   create dictionary    id=${Invalid_User_id}       resourceVersion=${Invalid_resource_version}
    #Call the method "delete requests by id" to Request and to get the response           NOTE: The delete requests by id method expects 2 aurguments(relative path, body)
    ${response}=  delete requests by id                      ${Relative_Path}                                ${body}

    #STEP 1
    #Validate if the status is 404 or not (404 means record not found)
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           Delete request by invalid user id and it's resource version was successful

Delete request by blank user id and it's resource version
    [Documentation]                                          Delete request by blank user id and it's resource version
    ${body} =   create dictionary    id=${Blank_User_id}       resourceVersion=${Blank_resource_version}
    #Call the method "delete requests by id" to Request and to get the response           NOTE: The delete requests by id method expects 2 aurguments(relative path, body)
    ${response}=  delete requests by id                      ${Relative_Path}                               ${body}

    #STEP 1
    #Validate if the status is 404 or not (404 means record not found)
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           Delete request by blank user id and it's resource version was successful


#***********************************************************POSITIVE SCENARIOS**************************************************************************************************
Delete request by valid user id and it's resource version
    [Documentation]                                           Delete request by valid user id and it's resource version
    #STEP 1: CREATE A NEW USER
    ${email_with_100_char}=                                   generate_email
    sleep                                                     2
    ${post_body} =   create dictionary    email=${email_with_100_char}     firstName=TestApi     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${post_body}
    #STEP 2
    #Validate l

    #STEP 3: GET A USER BY THE USER ID CREATED ABOVE
    #Call the method "get requests by id" to Request and to get the response           NOTE: The get requests by id method expects 2 aurguments(relative path, userid)
    ${response2}=  get requests by id                         ${Relative_Path}                              ${Converted_content}
    #STEP 4
    #Validate if the status is 200 or not (200 means success)
    ${status_code2}=     convert to string                    ${response2.status_code}
    should be equal       ${status_code2}                     200
    log to console                                            GET request by valid user id created above was successful

    #STEP 5: Gets the resource version and the user id from the responds data
    ${response_data}=    Evaluate                             json.loads("""${response2.content}""")    json
    ${get_resource_version}=    Set Variable                  ${response_data['resourceVersion']}
    ${get_user_id}=    Set Variable                           ${response_data['id']}

    #STEP 6: Delete the user created above
    ${delete_body} =   create dictionary    id=${get_user_id}        resourceVersion=${get_resource_version}
    #Call the method "delete requests by id" to Request and to get the response           NOTE: The delete requests by id method expects 2 aurguments(relative path, body)
    ${response3}=  delete requests by id                       ${Relative_Path}                               ${delete_body}

    #STEP 7
    #Validate if the status is 204 or not (204 means success)
    ${status_code}=     convert to string                     ${response3.status_code}
    should be equal       ${status_code}                      204
    log to console                                            Delete request by valid user id and it's resource version was successful

    #STEP 8: Verify if the user is deleted or not (404 means success)
    #Call the method "get requests by id" to Request and to get the response           NOTE: The get requests by id method expects 2 aurguments(relative path, userid)
    ${response4}=  get requests by id                         ${Relative_Path}                              ${get_user_id}
    #STEP 9
    #Validate if the status is 404 or not (404 means record not found)
    ${status_code2}=     convert to string                    ${response4.status_code}
    should be equal       ${status_code2}                     404
    log to console                                            GET request by valid user id deleted above was successful





