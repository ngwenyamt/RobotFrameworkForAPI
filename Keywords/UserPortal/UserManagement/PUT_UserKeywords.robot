*** Settings ***

Library                                                     RequestsLibrary
#Library                                                    JSONLibrary
Library                                                     Selenium2Library
Library                                                     Collections
Library                                                     ../../../../ESG/Keywords/UserDefinedKeywords/UserDefinedKeywords.py

*** Variables ***

${Relative_Path} =                                          /api/User
${User_id}=                                                 53908607-5bdc-42c6-c95f-08d98cce1a76
${First_name_with_65_char}                                  HAy4lsfBGFVQAeUaMxaT3BqCXjDfr8aCZxfb8VFSXtdqp6U2o2AS7odConUIytA3l
${Last_name_with_65_char}                                   HAy4lsfBGFVQAeUaMxaT3BqCXjDfr8aCZxfb8VFSXtdqp6U2o2AS7odConUIytA3l
${First_name_with_64_char}                                  HAy4lsfBGFVQAeUaMxaT3BqCXjDfr8aCZxfb8VFSXtdqp6U2o2AS7odConUIytA3
${Last_name_with_64_char}                                   HAy4lsfBGFVQAeUaMxaT3BqCXjDfr8aCZxfb8VFSXtdqp6U2o2AS7odConUIytA3

#***********************************************************NEGATIVE SCENARIOS**************************************************************************************************
*** Keywords ***
update the user details where the user id and it's resource version are invalid
    [Documentation]                                           update the user details where the user id and it's resource version are invalid

    ${put_body} =   create dictionary    id=invaid_id      resourceVersion=invlaid     firstName=TestApi     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "put requests" to Request and to get the response           NOTE: The put requests method expects 2 aurguments(relative url, the body)
    ${response}=  put requests                               ${Relative_Path}            ${put_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      400
    log to console                                            update the user details where the user id and it's resource version are invalid was successful

update the user details where the user id is valid and it's resource version is invalid
    [Documentation]                                           uupdate the user details where the user id is valid and it's resource version is invalid

    ${put_body} =   create dictionary    id=${User_id}      resourceVersion=invlaid     firstName=TestApi     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "put requests" to Request and to get the response           NOTE: The put requests method expects 2 aurguments(relative url, the body)
    ${response}=  put requests                               ${Relative_Path}            ${put_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      400
    log to console                                            update the user details where the user id is valid and it's resource version is invalid was successful

update the user details where first name contains 65 characters
    [Documentation]                                           update the user details where first name contains 65 characters

    #1: CREATE A NEW USER
    ${email_with_100_char}=                                   generate_email
    sleep                                                     2
    ${post_body} =   create dictionary    email=${email_with_100_char}     firstName=TestApi     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${post_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      201
    log to console                                            User ${response.content} was created successfully
    ${Convert_content}                                        Evaluate    json.dumps(${response.content})    json
    ${Converted_content} =      remove quotes from string     ${Convert_content}

    #STEP 2: GET A USER BY THE USER ID CREATED ABOVE
    #Call the method "get requests by id" to Request and to get the response           NOTE: The get requests by id method expects 2 aurguments(relative path, userid)
    ${response2}=  get requests by id                         ${Relative_Path}                              ${Converted_content}
    #STEP 3
    #Validate if the status is 200 or not (200 means success)
    ${status_code2}=     convert to string                    ${response2.status_code}
    should be equal       ${status_code2}                     200
    log to console                                            GET request by valid user id created above was successful

    #STEP 4: Gets the resource version and the user id from the responds data
    ${response_data}=    Evaluate                             json.loads("""${response2.content}""")    json
    ${get_resource_version}=    Set Variable                  ${response_data['resourceVersion']}
    ${get_user_id}=    Set Variable                           ${response_data['id']}

    #STEP 5: Update the user first name which contains 65 characters
    ${put_body} =   create dictionary    id=${get_user_id}      resourceVersion=${get_resource_version}     firstName=${First_name_with_65_char}     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "put requests" to Request and to get the response           NOTE: The put requests method expects 2 aurguments(relative url, the body)
    ${response}=  put requests                               ${Relative_Path}            ${put_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      400
    log to console                                            update the user details where first name contains 65 characters was successful

    #STEP 5: Delete the user created above
    ${delete_body} =   create dictionary    id=${get_user_id}        resourceVersion=${get_resource_version}
    #Call the method "delete requests by id" to Request and to get the response           NOTE: The delete requests by id method expects 2 aurguments(relative path, body)
    ${response3}=  delete requests by id                       ${Relative_Path}                               ${delete_body}

    #Validate if the status is 204 or not (204 means success)
    ${status_code}=     convert to string                     ${response3.status_code}
    should be equal       ${status_code}                      204
    log to console                                            user was deleted successful

update the user details where last name contains 65 characters
    [Documentation]                                           update the user details where last name contains 65 characters
    #1: CREATE A NEW USER
    ${email_with_100_char}=                                   generate_email
    sleep                                                     2
    ${post_body} =   create dictionary    email=${email_with_100_char}     firstName=TestApi     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${post_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      201
    log to console                                            User ${response.content} was created successfully
    ${Convert_content}                                        Evaluate    json.dumps(${response.content})    json
    ${Converted_content} =      remove quotes from string     ${Convert_content}

    #STEP 2: GET A USER BY THE USER ID CREATED ABOVE
    #Call the method "get requests by id" to Request and to get the response           NOTE: The get requests by id method expects 2 aurguments(relative path, userid)
    ${response2}=  get requests by id                         ${Relative_Path}                              ${Converted_content}
    #STEP 3
    #Validate if the status is 200 or not (200 means success)
    ${status_code2}=     convert to string                    ${response2.status_code}
    should be equal       ${status_code2}                     200
    log to console                                            GET request by valid user id created above was successful

    #STEP 4: Gets the resource version and the user id from the responds data
    ${response_data}=    Evaluate                             json.loads("""${response2.content}""")    json
    ${get_resource_version}=    Set Variable                  ${response_data['resourceVersion']}
    ${get_user_id}=    Set Variable                           ${response_data['id']}

    #STEP 5: Update the user last name which contains 65 characters
    ${put_body} =   create dictionary    id=${get_user_id}      resourceVersion=${get_resource_version}     firstName=tebogo     lastName=${Last_name_with_65_char}     platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "put requests" to Request and to get the response           NOTE: The put requests method expects 2 aurguments(relative url, the body)
    ${response}=  put requests                               ${Relative_Path}            ${put_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      400
    log to console                                            update the user details where last name contains 65 characters was successful

    #STEP 5: Delete the user created above
    ${delete_body} =   create dictionary    id=${get_user_id}        resourceVersion=${get_resource_version}
    #Call the method "delete requests by id" to Request and to get the response           NOTE: The delete requests by id method expects 2 aurguments(relative path, body)
    ${response3}=  delete requests by id                       ${Relative_Path}                               ${delete_body}

    #Validate if the status is 204 or not (204 means success)
    ${status_code}=     convert to string                     ${response3.status_code}
    should be equal       ${status_code}                      204
    log to console                                            user was deleted successful

update the user details where title is blank
    [Documentation]                                           update the user details where title is blank
    #1: CREATE A NEW USER
    ${email_with_100_char}=                                   generate_email
    sleep                                                     2
    ${post_body} =   create dictionary    email=${email_with_100_char}     firstName=TestApi     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${post_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      201
    log to console                                            User ${response.content} was created successfully
    ${Convert_content}                                        Evaluate    json.dumps(${response.content})    json
    ${Converted_content} =      remove quotes from string     ${Convert_content}

    #STEP 2: GET A USER BY THE USER ID CREATED ABOVE
    #Call the method "get requests by id" to Request and to get the response           NOTE: The get requests by id method expects 2 aurguments(relative path, userid)
    ${response2}=  get requests by id                         ${Relative_Path}                              ${Converted_content}
    #STEP 3
    #Validate if the status is 200 or not (200 means success)
    ${status_code2}=     convert to string                    ${response2.status_code}
    should be equal       ${status_code2}                     200
    log to console                                            GET request by valid user id created above was successful

    #STEP 4: Gets the resource version and the user id from the responds data
    ${response_data}=    Evaluate                             json.loads("""${response2.content}""")    json
    ${get_resource_version}=    Set Variable                  ${response_data['resourceVersion']}
    ${get_user_id}=    Set Variable                           ${response_data['id']}

    #STEP 5: Update the user title to contain no data
    ${put_body} =   create dictionary    id=${get_user_id}      resourceVersion=${get_resource_version}     firstName=tebogo     lastName=ngwenya     platformNotificationEnabled=true       emailNotificationEnabled=true            title=
    #Call the method "put requests" to Request and to get the response           NOTE: The put requests method expects 2 aurguments(relative url, the body)
    ${response}=  put requests                               ${Relative_Path}            ${put_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      400
    log to console                                            update the user details where title is blank was successful

    #STEP 5: Delete the user created above
    ${delete_body} =   create dictionary    id=${get_user_id}        resourceVersion=${get_resource_version}
    #Call the method "delete requests by id" to Request and to get the response           NOTE: The delete requests by id method expects 2 aurguments(relative path, body)
    ${response3}=  delete requests by id                       ${Relative_Path}                               ${delete_body}

    #Validate if the status is 204 or not (204 means success)
    ${status_code}=     convert to string                     ${response3.status_code}
    should be equal       ${status_code}                      204
    log to console                                            user was deleted successful

#***********************************************************POSITIVE SCENARIOS**************************************************************************************************

update the user details where the user id is valid and it's resource version is valid
    [Documentation]                                           update the user details where the user id is valid and it's resource version is valid
     #1: CREATE A NEW USER
    ${email_with_100_char}=                                   generate_email
    sleep                                                     2
    ${post_body} =   create dictionary    email=${email_with_100_char}     firstName=TestApi     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${post_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      201
    log to console                                            User ${response.content} was created successfully
    ${Convert_content}                                        Evaluate    json.dumps(${response.content})    json
    ${Converted_content} =      remove quotes from string     ${Convert_content}

    #STEP 2: GET A USER BY THE USER ID CREATED ABOVE
    #Call the method "get requests by id" to Request and to get the response           NOTE: The get requests by id method expects 2 aurguments(relative path, userid)
    ${response2}=  get requests by id                         ${Relative_Path}                              ${Converted_content}
    #STEP 3
    #Validate if the status is 200 or not (200 means success)
    ${status_code2}=     convert to string                    ${response2.status_code}
    should be equal       ${status_code2}                     200
    log to console                                            GET request by valid user id created above was successful

    #STEP 4: Gets the resource version and the user id from the responds data
    ${response_data}=    Evaluate                             json.loads("""${response2.content}""")    json
    ${get_resource_version}=    Set Variable                  ${response_data['resourceVersion']}
    ${get_user_id}=    Set Variable                           ${response_data['id']}

    #STEP 5: Update the user details with valid data
    ${put_body} =   create dictionary    id=${get_user_id}      resourceVersion=${get_resource_version}     firstName=tebogo update    lastName=ngwenya update     platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mrs
    #Call the method "put requests" to Request and to get the response           NOTE: The put requests method expects 2 aurguments(relative url, the body)
    ${response}=  put requests                               ${Relative_Path}            ${put_body}
    #STEP 6
    #Validate if the status is 204 or not (204 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      204
    log to console                                            update the user details where the user id is valid and it's resource version is valid was successful

update the user details where first name contains 64 characters
    [Documentation]                                           update the user details where first name contains 64 characters
      #1: CREATE A NEW USER
    ${email_with_100_char}=                                   generate_email
    sleep                                                     2
    ${post_body} =   create dictionary    email=${email_with_100_char}     firstName=TestApi     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${post_body}
    #STEP 1
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      201
    log to console                                            User ${response.content} was created successfully
    ${Convert_content}                                        Evaluate    json.dumps(${response.content})    json
    ${Converted_content} =      remove quotes from string     ${Convert_content}

    #STEP 2: GET A USER BY THE USER ID CREATED ABOVE
    #Call the method "get requests by id" to Request and to get the response           NOTE: The get requests by id method expects 2 aurguments(relative path, userid)
    ${response2}=  get requests by id                         ${Relative_Path}                              ${Converted_content}
    #STEP 3
    #Validate if the status is 200 or not (200 means success)
    ${status_code2}=     convert to string                    ${response2.status_code}
    should be equal       ${status_code2}                     200
    log to console                                            GET request by valid user id created above was successful

    #STEP 4: Gets the resource version and the user id from the responds data
    ${response_data}=    Evaluate                             json.loads("""${response2.content}""")    json
    ${get_resource_version}=    Set Variable                  ${response_data['resourceVersion']}
    ${get_user_id}=    Set Variable                           ${response_data['id']}

    #STEP 5: Update the user first name with 64 characters
    ${put_body} =   create dictionary    id=${get_user_id}      resourceVersion=${get_resource_version}     firstName=${First_name_with_64_char}    lastName=ngwenya update     platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mrs
    #Call the method "put requests" to Request and to get the response           NOTE: The put requests method expects 2 aurguments(relative url, the body)
    ${response}=  put requests                               ${Relative_Path}            ${put_body}
    #STEP 6
    #Validate if the status is 204 or not (204 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      204
    log to console                                            update the user details where first name contains 64 characters was successful

update the user details where last name contains 64 characters
    [Documentation]                                           update the user details where last name contains 64 characters
    #STEP 1:CREATE A NEW USER
    ${email_with_100_char}=                                   generate_email
    sleep                                                     2
    ${post_body} =   create dictionary    email=${email_with_100_char}     firstName=TestApi     lastName=TestAPI      platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                               ${Relative_Path}            ${post_body}
    #STEP 2
    #Validate if the status is 201 or not (201 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      201
    log to console                                            User ${response.content} was created successfully
    ${Convert_content}                                        Evaluate    json.dumps(${response.content})    json
    ${Converted_content} =      remove quotes from string     ${Convert_content}

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

    #STEP 6: Update the user last name with 64 characters
    ${put_body} =   create dictionary    id=${get_user_id}      resourceVersion=${get_resource_version}     firstName=tebogo update     lastName=${Last_name_with_64_char}     platformNotificationEnabled=true       emailNotificationEnabled=true            title=Mrs
    #Call the method "put requests" to Request and to get the response           NOTE: The put requests method expects 2 aurguments(relative url, the body)
    ${response}=  put requests                               ${Relative_Path}            ${put_body}
    #STEP 7
    #Validate if the status is 204 or not (204 means success)
    ${status_code}=     convert to string                     ${response.status_code}
    should be equal       ${status_code}                      204
    log to console                                            update the user details where last name contains 64 characters was successful
