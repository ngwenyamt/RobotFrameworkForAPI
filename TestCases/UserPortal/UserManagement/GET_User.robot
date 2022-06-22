*** Settings ***
Documentation                       User Management[Fetch Records]- Tebogo Ngwenya

Resource                            ../../../../ESG/Keywords/UserPortal/UserManagement/GET_UserKeywords.robot


*** Test Cases ***
Fetch a user- Negative Scenario
    [Tags]                              FetchUser-NegativeScenario
    Given GET request by invalid user id


Fetch a user- Positive Scenario
    [Tags]                              FetchUser-PositiveScenario
    Given GET request for a list of users
    When GET request by valid user id
    And GET request for the ImportTemplate


