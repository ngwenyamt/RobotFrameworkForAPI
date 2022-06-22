*** Settings ***
Documentation                           Action Management[Add Records]- Tebogo Ngwenya

Resource                                ../../../../ESG/Keywords/UserPortal/ActionManagement/POST_ActionsKeywords.robot


*** Test Cases ***
Create a new action- Negative Scenario
    [Tags]                              CreateAction-Negative Scenario
    Given POST request where the standalone description contains 1001 characters
    When POST request where the standalone action description is blank


Create a new action- Positive Scenario
    [Tags]                              CreateAction-Positive Scenario
    Given POST request where the standalone action is valid
    And POST request where the standalone action is missing a responsible user