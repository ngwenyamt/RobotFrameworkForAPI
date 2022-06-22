*** Settings ***

Library                                                     RequestsLibrary
#Library                                                    JSONLibrary
Library                                                     Selenium2Library
Library                                                     Collections
Library                                                     ../../../../ESG/Keywords/UserDefinedKeywords/UserDefinedKeywords.py

*** Variables ***

${Relative_Path} =                                          /api/User
${email_with_101_char}                                      xE5NskAxylJKvhFSi921cc0n1f42fvwgfn8OPOkjAQ3GLuySvSfpa7WJuZ8G8s4GXQGaeoM7tUnAXwPI8hxKRrs@isometrix.com
${email_with_invalid_char}                                  xE5NskAxylJKvhFSi921cc0n1f42fvwgfn8OPOkjAQ3GLuySvSfpa7WJuZ8G8s4GXQGaeoM7tUnAXwPI8hxKRru4xRqJYmRNYGuu
${first_name_with_64_char}                                  DCYmc6UUmLfHKdS4i25AuLEwgDbLTbdJMRMKoiUMtZO2ViCv57ofzWj3CoWQ0l5o
${last_name_with_64_char}                                   DCYmc6UUmLfHKdS4i25AuLEwgDbLTbdJMRMKoiUMtZO2ViCv57ofzWj3CoWQ0l5o
${first_name_with_65_char}                                  DCYmc6UUmLfHKdS4i25AuLEwgDbLTbdJMRMKoiUMtZO2ViCv57ofzWj3CoWQ0l5oj
${last_name_with_65_char}                                   DCYmc6UUmLfHKdS4i25AuLEwgDbLTbdJMRMKoiUMtZO2ViCv57ofzWj3CoWQ0l5oh
${last_name}                                                ngwenya
${platformNotificationEnabled}                              true
${emailNotificationEnabled}                                 true

#***********************************************************NEGATIVE SCENARIOS**************************************************************************************************
*** Keywords ***
POST request when the user name is blank
   [Documentation]                                           POST request when the user name is blank
    sleep                                                    2
    ${email_with_100_char}=                                  generate_email
    ${body} =   create dictionary    email=${email_with_100_char}    firstName=      lastName=${last_name}      platformNotificationEnabled=${platformNotificationEnabled}      emailNotificationEnabled=${emailNotificationEnabled}     title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                              ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 400 or not
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           POST request when the user name is blank was successful

POST request where the user name contains 65 characters
    [Documentation]                                          POST request where the user name contains 65 characters
    sleep                                                    2
    ${email_with_100_char}=                                  generate_email
    ${body} =   create dictionary    email=${email_with_100_char}     firstName=${first_name_with_65_char}     lastName=ngwenya       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}     title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                              ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 400 or not
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           POST request where the user name contains 65 characters was successful

POST request when the user last name is blank
   [Documentation]                                          POST request when the user last name is blank
    sleep                                                    2
    ${email_with_100_char}=                                  generate_email
    ${body} =   create dictionary    email=${email_with_100_char}     firstName=tebogo      lastName=       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}         title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                             ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 400 or not
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           POST request when the user last name is blank was successful

POST request where the user last name contains 65 characters
    [Documentation]                                          POST request where the user last name contains 65 characters
    sleep                                                    2
    ${email_with_100_char}=                                  generate_email
    ${body} =   create dictionary    email=${email_with_100_char}     firstName=tebogo     lastName=${last_name_with_65_char}       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}         title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                             ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 400 or not
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           POST request where the user last name contains 65 characters was successful

POST request when the user email is blank
    [Documentation]                                          POST request when the user email is blank
    sleep                                                    2
    ${body} =   create dictionary    email=      firstName=tebogo      lastName=${last_name}       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}           title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                             ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 400 or not
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           POST request when the user email is blank was successful

POST request where the user email address contains 101 characters
   [Documentation]                                           POST request where the user email address contains 101 characters
    sleep                                                    2
    ${body} =   create dictionary    email=${email_with_101_char}     firstName=tebogo     lastName=${last_name}       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}          title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                              ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 400 or not
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           POST request where the user email address contains 101 characters was successful

POST request when the user email address contains 1-100 characters in invalid format
   [Documentation]                                          POST request when the user email address contains 1-100 characters in invalid format

    sleep                                                    2
    ${body} =   create dictionary    email=${email_with_invalid_char}     firstName=tebogo     lastName=${last_name}       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}            title=Mr
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                             ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 400 or not
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           POST request when the user email address contains 1-64 characters in invalid format was successful

POST request when the user title is blank
    [Documentation]                                          POST request when the user title is blank
    sleep                                                    2
    ${email_with_100_char}=                                  generate_email
    ${body} =   create dictionary    email=${email_with_100_char}     firstName=tebogo     lastName=${last_name}       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}            title=
    #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
    ${response}=  post requests                              ${Relative_Path}            ${body}

    #STEP 1
    #Validate if the status is 400 or not
    ${status_code}=     convert to string                    ${response.status_code}
    should be equal       ${status_code}                     400
    log to console                                           POST request when the user title is blank

#***********************************************************POSITIVE SCENARIOS**************************************************************************************************

POST request when the user name contains 1 character
   [Documentation]                                          POST request when the user name contains 1 character
   ${email_with_100_char}=                                  generate_email
   sleep                                                    2
   ${body} =   create dictionary    email=${email_with_100_char}     firstName=t     lastName=${last_name}       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}            title=Mr
   #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
   ${response}=  post requests                             ${Relative_Path}            ${body}

   #STEP 1
   #Validate if the status is 201 or not
   ${status_code}=     convert to string                    ${response.status_code}
   should be equal       ${status_code}                     201
   log to console                                           POST request when the user name contains 1 character
   log to console                                           ${response.content}

POST request when the user name contains 64 characters
   [Documentation]                                          POST request when the user name contains 64 characters
   ${email_with_100_char}=                                  generate_email
   sleep                                                    2
   ${body} =   create dictionary    email=${email_with_100_char}     firstName=${first_name_with_64_char}     lastName=${last_name}       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}            title=Mr
   #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
   ${response}=  post requests                              ${Relative_Path}            ${body}

   #STEP 1
   #Validate if the status is 201 or not
   ${status_code}=     convert to string                    ${response.status_code}
   should be equal       ${status_code}                     201
   log to console                                           POST request when the user name contains 64 characters
   log to console                                           ${response.content}

POST request when the user last name contains 1 character
   [Documentation]                                          POST request when the user last name contains 1 character
   ${email_with_100_char}=                                  generate_email
   sleep                                                    2
   ${body} =   create dictionary    email=${email_with_100_char}     firstName=tebogo     lastName=n       platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}            title=Mr
   #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
   ${response}=  post requests                              ${Relative_Path}            ${body}

   #STEP 1
   #Validate if the status is 201 or not
   ${status_code}=     convert to string                    ${response.status_code}
   should be equal       ${status_code}                     201
   log to console                                           POST request when the user last name contains 1 character
   log to console                                           ${response.content}

POST request when the user last name contains 64 characters
   [Documentation]                                          POST request when the user last name contains 64 characters
   ${email_with_100_char}=                                  generate_email
   sleep                                                    2
   ${body} =   create dictionary    email=${email_with_100_char}     firstName=tebogo     lastName=${last_name_with_64_char}      platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}            title=Mr
   #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
   ${response}=  post requests                              ${Relative_Path}            ${body}
   #STEP 1
   #Validate if the status is 201 or not
   ${status_code}=     convert to string                    ${response.status_code}
   should be equal       ${status_code}                     201
   log to console                                           POST request when the user last name contains 64 character
   log to console                                           ${response.content}

POST request when the user email contains 1-100 characters in a valid format
   [Documentation]                                          POST request when the user email contains 1-100 characters in a valid format
   ${email_with_100_char}=                                  generate_email
   sleep                                                    2
   ${body} =   create dictionary    email=${email_with_100_char}     firstName=tebogo     lastName=${last_name}      platformNotificationEnabled=${platformNotificationEnabled}       emailNotificationEnabled=${emailNotificationEnabled}            title=Mr
   #Call the method "post requests" to Request and to get the response           NOTE: The post requests method expects 2 aurguments(relative url, the body, response_data: status or content)
   ${response}=  post requests                              ${Relative_Path}            ${body}
   #STEP 1
   #Validate if the status is 201 or not
   ${status_code}=     convert to string                    ${response.status_code}
   should be equal       ${status_code}                     201
   log to console                                           POST request when the user last name contains 64 character
   log to console                                           ${response.content}







