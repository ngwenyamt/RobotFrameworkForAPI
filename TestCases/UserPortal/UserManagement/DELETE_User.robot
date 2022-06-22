*** Settings ***
Documentation                       User Management[Delete Records]- Tebogo Ngwenya

Resource                            ../../../../ESG/Keywords/UserPortal/UserManagement/DELETE_UserKeywords.robot


*** Test Cases ***
Delete a user- Negative Scenario
    [Tags]                              DeleteUser-NegativeScenario
    Given Delete request by invalid user id and it's resource version
    When Delete request by blank user id and it's resource version

Delete a user- Positive Scenario
   [Tags]                              DeleteUser-PositiveScenario
   Given Delete request by valid user id and it's resource version


