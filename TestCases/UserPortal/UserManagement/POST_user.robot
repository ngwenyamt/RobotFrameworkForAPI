*** Settings ***
Documentation                       User Management[Add Records]- Tebogo Ngwenya

Resource                            ../../../../ESG/Keywords/UserPortal/UserManagement/POST_UserKeywords.robot


*** Test Cases ***
Create a new user- Negative Scenario
    [Tags]                              CreateUser-Negative Scenario
    Given POST request when the user name is blank
    When POST request where the user name contains 65 characters
    And POST request when the user last name is blank
    And POST request where the user last name contains 65 characters
    And POST request when the user email is blank
    And POST request where the user email address contains 101 characters
    And POST request when the user email address contains 1-100 characters in invalid format
    And POST request when the user title is blank

Create a new user- Positive Scenario
    [Tags]                              CreateUser-Positive Scenario
    And POST request when the user name contains 1 character
    Then POST request when the user name contains 64 characters
    And POST request when the user last name contains 1 character
    And POST request when the user last name contains 64 characters
    And POST request when the user email contains 1-100 characters in a valid format