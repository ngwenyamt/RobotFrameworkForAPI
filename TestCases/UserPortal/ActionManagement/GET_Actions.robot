*** Settings ***
Documentation                       Actions Management[Fetch Records]- Tebogo Ngwenya

Resource                            ../../../../ESG/Keywords/UserPortal/ActionManagement/GET_ActionsKeywords.robot


*** Test Cases ***
Fetch action- Negative Scenario
    [Tags]                              FetchAction-NegativeScenario
    Given GET request by invalid action id


#Fetch action- Positive Scenario
#    [Tags]                              FetchAction-PositiveScenario
#    Given GET request for a list of actions
#    When GET request by valid action id
#    And GET request for the ImportTemplate


